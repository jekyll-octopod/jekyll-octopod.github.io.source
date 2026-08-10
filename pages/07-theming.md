---
title: Theming
layout: default
docs: 7
permalink: theming
---

# Theming

The theme currently in use is [jekyll-bulma](https://github.com/jekyll-octopod/jekyll-bulma), a
Gem based theme (a Jekyll feature described in the Jekyll documentation of
[Gem based themes](https://jekyllrb.com/docs/themes/)) implementing [Bulma](https://bulma.io/), a
modern, small CSS framework with no JavaScript bloat. Bulma is well documented:
[Bulma documentation](https://bulma.io/documentation/).

Bulma 1.x styles its components with CSS custom properties (`--bulma-*`) instead of baking fixed
colors straight into the compiled CSS, which makes theming considerably simpler than with the old
Bootflat/Bootstrap-based theme.

## Overriding in `/_sass/_overrides.scss`

You can override any of Bulma's `--bulma-*` custom properties (or plain CSS selectors) in your
site's own `/_sass/_overrides.scss` file. It's loaded last, so anything you put there wins the
cascade at equal selector specificity.

### Example

To change the navbar's background color, override the custom properties it reads its colors from
— `--bulma-navbar-background-color` for the flat background, plus `--bulma-navbar-h`/`-s`/`-l` so
that hover, active and dropdown states (which Bulma derives from that hue/saturation/lightness
triple, not from the flat color alone) stay consistent with it:

```scss
.navbar {
  --bulma-navbar-background-color: rgb(72, 207, 173);
  --bulma-navbar-h: 166deg;
  --bulma-navbar-s: 48%;
  --bulma-navbar-l: 55%;
}
```

### Gotcha: specificity beats color modifier classes

If the element you're overriding also carries one of Bulma's own color modifier classes (e.g.
`<nav class="navbar is-light">`), the compiled `.navbar.is-light { ... }` rule has *higher*
specificity than a plain `.navbar { ... }` override and wins regardless of where your override
sits in the file. Either remove the modifier class from the markup, or match its specificity in
your own selector.

### Drawbacks

* You still need your browser's developer tools to find the exact `--bulma-*` custom property name
  for the component you want to change — check the compiled `--bulma-*` declarations on the
  element, or the component's own partial in the vendored
  [`_sass/sass/` directory](https://github.com/jekyll-octopod/jekyll-bulma/tree/master/_sass/sass)
  of jekyll-bulma.
* Some visual states (hover, active, dropdown shading, ...) are derived from companion `-h`/`-s`/`-l`
  variables rather than the flat color property alone — overriding just the background color without
  the matching hue/saturation/lightness can leave those derived states looking inconsistent.

## Overriding Sass variables

jekyll-bulma's entry point ([`_sass/bulma.scss`](https://github.com/jekyll-octopod/jekyll-bulma/blob/master/_sass/bulma.scss))
loads its components with `@use`, not `@forward`, so the component-level Sass variables defined
deep inside (e.g. `$navbar-background-color` in `_sass/sass/components/navbar.scss`) are not
exposed for configuration via `@use "bulma" with (...)` from your own `main.scss`. In practice,
overriding the CSS custom properties above (option 1) is the supported way to theme this gem —
there currently isn't a working Sass-variable-override path the way there was with the old
`@import`-based Bootflat/Bootstrap theme.
