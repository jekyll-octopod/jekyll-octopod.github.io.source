---
title: Configuration
layout: default
docs: 3
permalink: configuration
---

# Configuration

several settings can be specified in the configuration file ```_config.yml``` in the main directory.

```
title: Octopod
url: http://localhost:4000

# needed, if and only if audio files are hosted in a different location
download_url: http://my.cdn.com/path/to/episodes/

subtitle: Static Site Podcast Publishing for Geeks
description: My super duper cool podcast.
author: Uncle Octopod
email: octopod@example.com
keywords: [octopod, podcast, magic]
itunes_categories: [Technology]
episodes_per_feed_page: 100

player_theme:  default  #  default  /  "default-dark" / legacy / minimal / republica

## Rsync Deploy config #########################################################
### Be sure your public key is listed in your server's ~/.ssh/authorized_keys file.
ssh_host: user@host.org
ssh_port: 22
document_root: /path/to/your/htdocs/
rsync_delete: true

twitter_nick: my_twitter_handle
language: en
explicit: no  # yes / no / clean

license: CC BY 4.0
license_url: https://creativecommons.org/licenses/by/4.0/
license_image_url: https://i.creativecommons.org/l/by/4.0/88x31.png

## Flattr ######################################################################
flattr_uid: # Flattr will not be used unless this is set
flattr_button: compact # compact | default
flattr_mode: auto # auto | manual(default)
flattr_popout:  1 # 1 | 0 (show popout when hovering mouse over button)
flattr_language: en_GB # available languages - https://api.flattr.com/rest/v2/languages.txt
flattr_category: audio # available categories - https://api.flattr.com/rest/v2/categories.txt

## Disqus comments #############################################################
disqus_shortname: my_disqus_shortname # Disqus will not be used unless this is set
disqus_developer: 0 # 1 / 0

## Isso comments #########################################################
use_isso: no # set to 'yes' to include isso comments form

## Feed links ###########################################################
itunes_url: https://itunes.apple.com/at/podcast/myname/id#myid#
bitlove_url: https://bitlove.org/myaccount
fyyd_url: https://fyyd.de/podcast/myaccount/myid
gpodder_url: https://gpodder.net/podcast/mypodcast

additional_feeds:
  itunes: http://itunes.apple.com/de/podcast/podcast_name/id42424242
  torrent_m4a: http://bitlove.org/example_user/example_podcast_m4a/feed
  torrent_mp3: http://bitlove.org/example_user/example_podcast_mp3/feed

gems: [jekyll-octopod]
theme: jekyll-bootflat
```

_Continue with [Usage](/usage)_.
