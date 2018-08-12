---
title: Theming
layout: default
docs: 7
permalink: theming
---

# Theming

There are two options, how to do theming, we are aware of:

## 1. Overriding in `/_sass/_overrides.scss`

You can override any css selectors in `/_sass/_overrides.scss`. As it is a scss file, so you can use
the features of SCSS to improve readability, but it could still be a pain.

### Example

Typically people want to change the colors of the navbar, so there is a commented example of the
six colors used in the navbar in the
[overrides file](https://github.com/jekyll-octopod/jekyll-octopod/blob/master/assets/_sass/_overrides.scss).
Uncomment and set them to the values you prefer.

### Drawbacks

* You need to be able to find the css selectors in the developer tools of your browser
* Finding of all the css selectors to be overridden can be a lot of work
* The theme might not be consistent any more, in case you didn't find all the occurencies of e.g.
  the color you want to change
* A lot of css: it might be a huge amount of css selectors, that you have to override


## 2. Overriding using the scss variables

In case you know about scss and gem based themes, you can skip the Gereral Principles chapter,
inline the jekyll-bootflat theme, override the variables and you are done. Otherwise, let's get
into the details:

### General principles

First explaination of the general principles:

The theme currently in use is [jekyll-bootflat](https://github.com/jekyll-octopod/jekyll-bootflat).
It is implementing Bootflat which is based on Bootstrap.
Bootflat is well documented: [Documentation of Bootflat](http://bootflat.github.io/).

Bootstap in included in version 3.3.6., which is also well documented:
[Documentation of Bootstrap 3.3.6](https://bootstrapdocs.com/v3.3.6/docs/getting-started/)

We using jekyll-bootflat as a Gem based theme, a Jekyll feature described in the Jekyll
documentation of [Gem based themes](https://jekyllrb.com/docs/themes/). This is the documetation
you absolutely have to read to be able to adapt jekyll-octopod in the most efficient way possible.

Following the principles in
[Overriding theme defaults](https://jekyllrb.com/docs/themes/#overriding-theme-defaults)
or [Converting gem-based themes to regular themes](https://jekyllrb.com/docs/themes/#converting-gem-based-themes-to-regular-themes)
you may want to change the defaults of

* Bootflat in the [Bootflat scss directory](https://github.com/jekyll-octopod/jekyll-bootflat/tree/master/_sass/bootflat)
* Bootstrap in the [Bootstrap scss directory](https://github.com/jekyll-octopod/jekyll-bootflat/tree/master/_sass/bootstrap)

### Side note

I ran into the trap to believe that you could change variables simply by overriding them
in `/_sass/_overrides`, but that is not the case. The reason is that for the scss parser of
Jekyll not the last setting of a scss variable wins, but the last one before resolving it,
which happens earlier. If that sounds strange, a look at
[the import order](https://github.com/jekyll-octopod/jekyll-bootflat/blob/master/assets/css/main.scss)
might clear things up: The variables are already used before they have been overridden :-(

### Example

Now let's change the colors of the navbar as an example. The file containing the colors of the navbar is:
`https://github.com/jekyll-octopod/jekyll-bootflat/tree/master/_sass/bootflat`
Whereever you inlined the file in your project, change the variables *there* to your heart's desire:

```
$navbar-background-color:                    $mint-dark !default;
$navbar-background-color-active:             $mint-light !default;
$navbar-font-color:                          $black !default;
$navbar-item-background-color-hover:         $navbar-background-color-active !default;
$navbar-inverse-background-color:            $black !default;
```
