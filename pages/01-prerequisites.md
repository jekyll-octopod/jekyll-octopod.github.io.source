---
title: Prerequisites
layout: default
docs: 1
permalink: prerequisites
---

# Prerequisites

The [Ruby programming language](http://www.ruby-lang.org/) and its package manager [Bundler](http://gembundler.com/).

Nice installation guides for the different operating systems can be found at
the [Rails Girls Website](http://guides.railsgirls.com/install). You can stop
right before installing Rails, because we do not depend on Ruby on Rails here.

You can check if you succeeded by entering

{% highlight shell %}
$ ruby -v
$ gem -v
{% endhighlight %}
at the command prompt. Both commands should return a Ruby version greater or equal 3.0 (the theme
gem [jekyll-bulma](https://github.com/jekyll-octopod/jekyll-bulma) requires at least this). The
project itself is developed and tested against Ruby 4.0.6, see its
[`.tool-versions`](https://github.com/jekyll-octopod/jekyll-octopod/blob/master/.tool-versions).

_Continue reading with [Installation](/installation)._
