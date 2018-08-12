---
title: Command Line Tool
layout: default
docs: 6
permalink: command_line
---

# Command Line Tool

The octopod-jekyll command line commands are:

{% highlight shell %}
$ octopod b[uild]
# builds from current path . to ./_site

$ octopod build <path/to/target>
# compiles and builds the site from the current path . to path/to/target

$ octopod build <path/to/source> <path/to/target>
# compiles from source_path to  path/to/target

$ octopod import <importer name> <options>
# imports posts using named import script

$ octopod setup
# Sets up Jekyll site to become podcast-aware, copies assets and default config.
# Asks for confirmation on file overwrite.

$ octopod episode
# adds a post for a new episode

$ octopod deploy
# deploys your site via rsync

$ octopod <command> --help
# for more information on a specific command.

$ octopod s[erver]
# Starts the server
{% endhighlight %}

Configuration is read from '<source>/_config.yml' but can be overridden.
Available options are documented in `_config.yml`.
In case, you deleted some of the options, a full reference can be found in `_config.yml.sample`.

For ```octopod episode```, the following options are available to override defaults:
{% highlight shell %}
-a, --author [AUTHOR]

-c, --chapters [CHAPTER1, CHAPTER2...]
# Chapters have the format "HH:MM:SS.sss Title"

-d, --duration [DURATION]
# "HH:MM:SS.sss"

-e, --explicit [yes/no]

--episode-cover [PATH]
# Path to an episode-specific image

-l, --layout [LAYOUT]
# Defaults to 'post', should never need to be changed

-p, --posts_dir [PATH]
# Defaults to '_posts'

-s, --subtitle [TEXT]

--summary [TEXT]

--tags [TAG1, TAG2, ...]

-t, --title [TEXT]
{% endhighlight %}

All derived Jekyll command line tasks can be found in Jekyll's
[Usage Documentation](http://jekyllrb.com/docs/usage/), from which the octopod
command inherits most of its functionality.

If there is an error when building the site, using the ```-t``` option prints
out the full stack trace, which can be helpful in debugging and improves bug reports.

_Continue reading with [Liquid filters](/liquid_filters)._
