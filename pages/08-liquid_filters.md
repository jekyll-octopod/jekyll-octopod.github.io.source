---
title: Liquid Filters
layout: default
docs: 8
permalink: liquid_filters
---

# Liquid Filters

Because Jekyll uses [Liquid](http://www.liquidmarkup.org/) for template processing, jekyll-octopod does so, too. Along with [the standard liquid tags and filters](http://wiki.github.com/shopify/liquid/liquid-for-designers), Jekyll adds [a few of its own](https://github.com/mojombo/jekyll/wiki/Liquid-Extensions) and jekyll-octopod adds a few more which are documented on this page.

## Filters

### CDATA escape

Escapes some text for CDATA

{% highlight YAML %}
{% raw %}
{{ page.content | cdata_escape }}
{% endraw %}
{% endhighlight %}

### JSON escape

Escapes HTML entities in JSON strings.

{% highlight YAML %}
{% raw %}
{{ page.some_string | j }}
{% endraw %}
{% endhighlight %}

### Expand URLs

Replaces relative urls with full urls

{% highlight YAML %}
{% raw %}
{{ "about.html" | expand_urls }}             => "/about.html"
{{ "about.html" | expand_urls:site.url }}    => "http://example.com/about.html"
{% endraw %}
{% endhighlight %}

### Remove Script and Audio tags

Removes unwanted tags from shownotes

{% highlight YAML %}
{% raw %}
{{ page.content | remove_script_and_audio }}
{% endraw %}
{% endhighlight %}

### Http Only

changes url from requesting https to http

{% highlight YAML %}
{% raw %}
{{ url | http_only }} => "http://..."
{% endraw %}
{% endhighlight %}

### Time to RSS schema

Formats a Time to be RSS compatible.

{% highlight YAML %}
{% raw %}
{{ site.time | time_to_rssschema }} => "Wed, 15 Jun 2005 19:00:00 GMT"
{% endraw %}
{% endhighlight %}

### Otherwise

Returns the first argument if it's not nil or empty — otherwise it returns the second one.

{% highlight YAML %}
{% raw %}
{{ post.author | otherwise:site.author }}
{% endraw %}
{% endhighlight %}

### Select audio file from hash

Returns the value of a given hash. If no key is given as a second parameter, it first tries "mp3", then "m4a" and then it will return a more or less random value.

{% highlight YAML %}
{% raw %}
{{ post.audio | audio:"m4a" }} => "my-episode.m4a"
{% endraw %}
{% endhighlight %}

### MIME type

Returns the MIME-Type of a given file format.

{% highlight YAML %}
{% raw %}
{{ "opus" | mime_type }} => "ogg; codecs=opus"
{% endraw %}
{% endhighlight %}

### File size

Returns the size of a given file in bytes. If there is just a filename without a path, this method assumes that the file is an episode audio file which lives in /episodes.

{% highlight YAML %}
{% raw %}
{{ "example.m4a" | file_size }} => 4242
{% endraw %}
{% endhighlight %}

### Size By Format

Returns the size of a given file in bytes by looking into the front matter
The sizes in bytes should be in the front matter for remotely hosted files:

```yaml
filesize:
   mp3: 123456
   ogg: 234567
   m4a: 345678
```

{% highlight YAML %}
{% raw %}
{{ "example.m4a" | size_by_format: "mp3" }} => 4242
{% endraw %}
{% endhighlight %}

### In Megabytes

Converts a size in Bytes to Megabytes

{% highlight YAML %}
{% raw %}
{{ 123456 | in_megabytes }} => 0.1 MB
{% endraw %}
{% endhighlight %}

### Slug

Returns a slug based on the id of a given page.

{% highlight YAML %}
{% raw %}
{{ page | slug }} => '2012_10_02_octopod'
{% endraw %}
{% endhighlight %}

### Split chapter

Splits a chapter, like it is written to the post YAML front matter, into the
components 'start' — which refers to a single point in time relative to the
beginning of the media file — and 'title' — which defines the text to be
the title of the chapter.

{% highlight YAML %}
{% raw %}
{{ '00:00:00.000 Welcome to Octopod!' | split_chapter }} =>
                    { 'start' => '00:00:00.000', 'title' => 'Welcome to Octopod!' }
{{ '00:00:00.000 Welcome to Octopod!' | split_chapter:'title' }}  => 'Welcome to Octopod!'
{{ '00:00:00.000 Welcome to Octopod!' | split_chapter:'start' }}  => '00:00:00.000'
{% endraw %}
{% endhighlight %}

### Audio tag

Returns an `<audio>` tag for a given page with `<source>` tags in it for every
audio file in the page's YAML front matter.

{% highlight YAML %}
{% raw %}
{{ page | audio_tag:site }}
{% endraw %}
{% endhighlight %}

### Web player

Returns the web player for the episode of a given page.

{% highlight YAML %}
{% raw %}
{{ page | podigee_player:site }}
{% endraw %}
{% endhighlight %}

### String of duration

Gets a number of seconds and returns a human readable duration string of it.

{% highlight YAML %}
{% raw %}
{{ 1252251 | string_of_duration }} => "00:03:13"
{% endraw %}
{% endhighlight %}

### String of size

Gets a number of bytes and returns a human readable string of it.

{% highlight YAML %}
{% raw %}
{{ 1252251 | string_of_size }} => "1.19M"
{% endraw %}
{% endhighlight %}

### Host from URL

Returns the host of a given url

{% highlight YAML %}
{% raw %}
{{ 'https://github.com/pattex/octopod' | host_from_url }} => "github.com"
{% endraw %}
{% endhighlight %}

### Disqus configuration

Generates the config for disqus integration. If a page object is given, it
generates the config variables only for this page. Otherwise, it only
generates the global config variables.

{% highlight YAML %}
{% raw %}
{{ site | disqus_config }}
{{ site | disqus_config:page }}
{% endraw %}
{% endhighlight %}

### SHA1

Returns the hex-encoded hash value of a given string. The optional
second argument defines the length of the returned string.

{% highlight YAML %}
{% raw %}
{{ "Octopod" | sha1 }}    => "8b20a59c"
{{ "Octopod" | sha1:23 }} => "8b20a59c8e2dcb5e1f845ba"
{% endraw %}
{% endhighlight %}

### Navigation list

Returns a ready-to-use navigation list of all pages that have `navigation` set
in their YAML front matter. The list is sorted by the value of `navigation`.

{% highlight YAML %}
{% raw %}
{{ site | navigation_list:page }}
{% endraw %}
{% endhighlight %}

### Episode feeds

Returns an array of all episode feeds named by the convention
`episodes.<episode_file_format>.rss` within the root directory. Also it
contains all additional feeds specified by `additional_feeds` in the `_config.yml`.
If an `episode_file_format` or key of `additional_feeds` equals the optional
parameter, it will be skipped.

{% highlight YAML %}
{% raw %}
{{ site | episode_feeds }}
{{ site | episode_feeds:mp3 }}
{% endraw %}
{% endhighlight %}

### Episode feeds HTML

Returns HTML links to all episode feeds named by the convention
`episodes.<episode_file_format>.rss` within the root directory. Also it returns
all additional feeds specified by `additional_feeds` in the `_config.yml`. If
an `episode_file_format` or key of `additional_feeds` equals the optional
parameter, it will be skipped.

{% highlight YAML %}
{% raw %}
{{ site | episode_feeds_html:'m4a' }} =>
<link rel="alternate" type="application/rss+xml" title="mp3 Episode RSS-Feed"
      href="/episodes.mp3.rss" />
<link rel="alternate" type="application/rss+xml" title="Torrent Feed m4a"
      href="http://bitlove.org/octopod/octopod_m4a/feed" />
<link rel="alternate" type="application/rss+xml" title="Torrent Feed mp3"
      href="http://bitlove.org/octopod/octopod_mp3/feed" />
{% endraw %}
{% endhighlight %}

### Episode feeds RSS

Returns RSS-XML links to all episode feeds named by the convention
`episodes.<episode_file_format>.rss` within the root directory. Also it returns
all additional feeds specified by `additional_feeds` in the `_config.yml`. If an
`episode_file_format` or key of `additional_feeds` equals the optional
parameter, it will be skipped.

{% highlight YAML %}
{% raw %}
{{ site | episode_feeds_rss:'m4a' }} =>
<atom:link rel="alternate" href="/episodes.mp3.rss"
           type="application/rss+xml" title="mp3 Episode RSS-Feed"/>
<atom:link rel="alternate" href="http://bitlove.org/octopod/octopod_m4a/feed"
           type="application/rss+xml" title="Torrent Feed m4a"/>
<atom:link rel="alternate" href="http://bitlove.org/octopod/octopod_mp3/feed"
           type="application/rss+xml" title="Torrent Feed mp3"/>
{% endraw %}
{% endhighlight %}

## Font Awesome icons

Returns the HTML tags for a font awesome icon

{% highlight YAML %}
{% raw %}
{% icon fa-camera-retro %} =>
<i class="fas fa-camera-retro"></i>

{% icon fa-camera-retro fa-lg %} =>
<i class="fas fa-camera-retro fa-lg"></i>
{% endraw %}
{% endhighlight %}

_Continue reading with [The post structure](/post_structure)._
