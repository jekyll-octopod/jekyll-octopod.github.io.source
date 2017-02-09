---
title: Usage
layout: default
docs: 4
permalink: usage
---

# Usage

Next, update the configuration settings in the configuration file `_config.yml` in the application directory. (You are already in it.)

* You might want to change the images and logos in the `img` directory
* You might want to change the demo episode file and the Jekyll Welcome post in `_posts` and `_episodes`

You can find a documentation of all the non-Octopod-specific settings on the [Configuration page of the Jekyll Documentation](http://jekyllrb.com/docs/configuration/).

Jekyll is highly customizable, if you are into coding (or even just want to get into it), read the [Jekyll Documentation](https://jekyllrb.com/docs/home/). It is very detailed and quite easy to grasp.

First of all, your new podcast episode needs audio data. Octopod assumes that your ready to use audio files stay within the `episodes` directory in your projects root.

{% highlight shell %}
$ cp ~/my_superduper_audio_files/ocp001.m4a episodes
{% endhighlight %}

In addition, jekyll-octopod assumes that the different audio files of each of your episodes are the same content in various formats — with the same duration and everything.  
If they are not, you may confuse your listeners — at least when you are using the chapters feature.

Next up, your episode needs some metadata. A title, some kind of a description, maybe chapters and so on. jekyll-octopod keeps all these metadata in one single text file (Protip: these dear little tots feel very lucky when they might live in a version control system!).  
jekyll-octopod kindly helps you to generate these files with the `octopod episode` command. You will get more information on the [the command line tool](./command_line) later.

The following command

{% highlight shell %}
$ octopod episode --title "Why I <3 Octopod"
{% endhighlight %}

will generate you a template called **YYYY-MM-DD-why-i-_3-octopod.md** (YYYY-MM-DD represents the current date) in your `_posts` subdirectory. When you open it in your text editor you'll see something like this:

{% highlight YAML %}
---
title: Why I <3 Octopod
subtitle: A Subtle Subtitle
date: May 22nd, 2016
layout: post
author: Uncle Octopod
explicit: 'no'
audio:
  m4a: name.m4a
  mp3: name.mp3
  ogg: name.ogg
chapters:
- '00:00:00.000 Intro.'
- '00:00:30.000 Outro.'
---
## {{ page.subtitle }}
{% raw %}
{{ podigee_player page }}
{% endraw %}
## Shownotes and Links

* Note
{% endhighlight %}

The part between the "---" and the "---" is the [YAML front matter](http://jekyllrb.com/docs/frontmatter/). 
This is where all the metadata is stored. Below the YAML frontmatter is the area (body) where you can write down your post's content (like the show notes and stuff). 
This strange looking {% raw %}`{{ podigee_player page }}`{% endraw %} thingy is the [Liquid filter](./liquid-filters), 
which represents the iframe where the web player will be included later.

When all this work is done you are ready to take a first look.  
The following command generates your site and starts a local webserver for a preview. You can check your new podcasting website by opening [http://localhost:4000](http://localhost:4000).

{% highlight shell %}
$ octopod --url "http://localhost:4000" --server
{% endhighlight %}

Since `localhost:4000` is the default, a shorter command with the same result is:

{% highlight shell %}
$ octopod s[erve]
{% endhighlight %}

If everything looks good, you can generate the site with the proper url from your configuration. 
*Warning*: Don't upload the `_site` subdirectory after serving it locally, as all links will assume running on `localhost` and this will cause issues!

To build your site use

{% highlight shell %}
$ octopod b[uild]
{% endhighlight %}

And deploy it to your server:

{% highlight shell %}
$ octopod deploy
{% endhighlight %}

*Warning*: The Rsync settings in your `_config.yml` are mandatory for this last step. 
If you don't wish to use rsync, uploading the website from the `_site` subdirectory via FTP or whichever tool you prefer works just fine.

_Continue with [The command line tool](/command_line)_.
