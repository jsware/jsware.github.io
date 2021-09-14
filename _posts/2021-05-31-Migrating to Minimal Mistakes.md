---
title: "Migrating to Minimal Mistakes"
image: &image /assets/images/mm-teaser.jpg
categories: Programming
tags: Jekyll Scripting
header:
  teaser: *image
  overlay_color: "#5e616c"
  overlay_image: /assets/images/minimal-mistakes.jpg
  actions:
    - label: "Check it out"
      url: "https://mmistakes.github.io/minimal-mistakes/"
---
Minimal mistakes is a great Jekyll theme. Perfect for building personal sites, blogs, and portfolios.

I started this blog last year. I posted a few items, but was never really engaged with the process. One aspect was the original style and colour-scheme. I never really liked it.

![Orange JSWare.io](/assets/images/jsware-orange.jpg)

There is nothing wrong with the [Hyde](http://hyde.getpoole.com) theme and [Poole](https://github.com/poole) it was built on.  It's a good theme - clean and simple. However, my burnt orange colour scheme was too garish and displeased me.

I found [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) searching for a [free theme](https://jekyllthemes.io/free). I had tried a few - for example [Mediumish](https://jekyllthemes.io/theme/mediumish) - even reverting back to [Minima](https://jekyll.github.io/minima/) which is used as the default theme used by `jekyll new`.

Minimal Mistakes is the most popular free theme at [https://jekyllthemes.io/free](https://jekyllthemes.io/free) and for good reason.  It has comprehensive [documentation](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/), a [starter](https://github.com/mmistakes/mm-github-pages-starter) project and lots of features.

Migrating was relatively simple:
1. Downloaded the [Minimal Mistakes Starter](https://github.com/mmistakes/mm-github-pages-starter).
1. Expanded the starter into my project (I did not clone the template as I already had a repository - instead kept duplicate files for now).
1. Removed existing theme's `_includes` and `_layouts` files.
1. Moved and updated core pages (404 and about).
1. Merged index.html files.
1. Moved images to new location under assets.
1. Merged `_config.yml` and `Gemfile` configurations.
1. Updated the front matter and image references in each post for the theme.

Hopefully you like it!
