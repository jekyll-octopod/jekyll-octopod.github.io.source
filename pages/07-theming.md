---
title: Theming
layout: default
docs: 7
permalink: theming
---

# Theming

The theme currently in use is
[jekyll-octopod-bulma](https://github.com/jekyll-octopod/jekyll-octopod-bulma), a Gem based theme
(a Jekyll feature described in the Jekyll documentation of
[Gem based themes](https://jekyllrb.com/docs/themes/)) implementing [Bulma](https://bulma.io/), a
modern, small CSS framework with no JavaScript bloat. Bulma is well documented:
[Bulma documentation](https://bulma.io/documentation/).

jekyll-octopod-bulma is a fork of the standalone [jekyll-bulma](https://github.com/jekyll-octopod/jekyll-bulma)
theme, with octopod's own sidebar layout, post/feed layouts, and vendored assets (the Podlove
player, the subscribe button, the default logo/favicons) folded in — so it, not jekyll-bulma
directly, is what ships in your site's `theme:` setting and what everything below applies to.

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
triple, not from the flat color alone) stay consistent with it. Two more things need covering
alongside it, or the result looks like it's only half-themed:

* the *currently active* nav item (`a.navbar-item.is-active`) doesn't inherit `--bulma-navbar-h`/
  `-s`/`-l` at all — it reads a separate `--bulma-navbar-item-selected-*` set of properties that
  default to Bulma's own global link color, unrelated to whatever the navbar itself uses.
* the background above is a flat, literal color, so it won't react to the visitor's OS/browser dark
  mode preference the way the rest of the (CSS-custom-property-driven) theme does. Left alone, dark
  mode still swaps the *text* color of the resting nav items to something light (Bulma's own
  `--bulma-text-l`, meant for contrast against a dark page) while the navbar's background stays
  exactly as light as it was — light text on a still-light bar. A `prefers-color-scheme: dark`
  override with a darker version of the same hue keeps it legible in both.

```scss
.navbar {
  --bulma-navbar-background-color: rgb(72, 207, 173);
  --bulma-navbar-h: 166deg;
  --bulma-navbar-s: 48%;
  --bulma-navbar-l: 55%;

  --bulma-navbar-item-selected-h: var(--bulma-navbar-h);
  --bulma-navbar-item-selected-s: var(--bulma-navbar-s);
  --bulma-navbar-item-selected-l: var(--bulma-navbar-l);
  --bulma-navbar-item-selected-background-l: 40%;
  --bulma-navbar-item-selected-color-l: 97%;
}

@media (prefers-color-scheme: dark) {
  .navbar {
    --bulma-navbar-background-color: #1B4B40;
    --bulma-navbar-l: 20%;
  }
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
  [`_sass/sass/` directory](https://github.com/jekyll-octopod/jekyll-octopod-bulma/tree/master/_sass/sass)
  of jekyll-octopod-bulma.
* Some visual states (hover, active, dropdown shading, ...) are derived from companion `-h`/`-s`/`-l`
  variables rather than the flat color property alone — overriding just the background color without
  the matching hue/saturation/lightness can leave those derived states looking inconsistent.

## Overriding Sass variables

jekyll-octopod-bulma's entry point ([`_sass/bulma.scss`](https://github.com/jekyll-octopod/jekyll-octopod-bulma/blob/master/_sass/bulma.scss))
loads its components with `@use`, not `@forward`, so the component-level Sass variables defined
deep inside (e.g. `$navbar-background-color` in `_sass/sass/components/navbar.scss`) are not
exposed for configuration via `@use "bulma" with (...)` from your own `main.scss`. In practice,
overriding the CSS custom properties above (option 1) is the supported way to theme this gem —
there currently isn't a working Sass-variable-override path the way there was with the old
`@import`-based Bootflat/Bootstrap theme.
