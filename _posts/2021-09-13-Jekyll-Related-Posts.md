---
title: "Jekyll Related Posts"
excerpt: Now you can include a configurable set of related pages without relying on custom plugins, so works with GitHub Pages.
image: &image "https://jekyllrb.com/img/twitter-card.png"
categories: Programming
tags: Jekyll Scripting
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
toc: true
toc_sticky: true
---
I have been using GitHub Pages to build this site (https://www.jsware.io) of posts and collections of other pages on subjects that interest me.

{% include figure popup=true image_path="https://miro.medium.com/max/1400/1*5KLdWCTsnbISVJGMMDZbxw.jpeg" alt="JSWare.io" caption="JSWare.io site by Jekyll and GitHub Pages" %}

The process for setting up a [GitHub Pages](https://pages.github.com/) site is relatively straightforward. You can even setup a custom domain name (as I have done) if you wish — all for free!

GitHub Pages uses [Jekyll](https://jekyllrb.com/) — a simple, blog-aware static static site generator. Jekyll uses a combination of markdown, the Shopify [Liquid](https://shopify.github.io/liquid/) templating language and HTML to produce static web sites.

To publish a GitHub Pages site, create a GitHub repository called *username*.github.io (where *username* is your GitHub username, or organisation name), clone the repository, commit some files and push those changes. Within a few minutes a site appears at https://username.github.io. Voila!

With Jekyll and [free themes](https://github.com/topics/jekyll-theme) such as the popular Minimal Mistakes theme (understandable considering it’s excellent quality), sophisticated static sites can be created.

Jekyll has the concept of posts, pages and collections of documents. For posts, Jekyll makes a list of related posts available. If you have used Jekyll before, they can be found in the [Jekyll variable](https://jekyllrb.com/docs/variables/) `site.related_posts`. There is an option to build high quality related posts (using the `--lsi` option) but this is not available on GitHub pages.

For posts, Jekyll sets the `site.related_posts` variable to an array of the 10 most recent posts by default. For other pages and collections, `site.related_posts` is empty.

There are some Jekyll plugins around that might produce better related posts, but GitHub Pages runs the jeykll site builder in `--safe` mode which disables custom plugins (for security reasons). GitHub Pages supports a [number of standard plugins](https://pages.github.com/versions/), but a better related posts one is not among them.

You are stuck with the 10 most recent posts on GitHub Pages — and only on posts. No related posts for pages in collections.

I wasn’t happy with the default `site.related_posts` list. Showing the 10 most recent posts only for posts, not other documents is a limitation I wanted to be free from.

I decided to write a `jekyll-related-posts` layout that processed posts and pages for the site, matching based on tags and categories which can be assigned manually to each page based on your content. Ultimately it became an include file used at the appropriate point in your page layouts.

The https://www.jsware.io/jekyll-related-posts include file was born.

{% include figure popup=true image_path="https://miro.medium.com/max/1400/1*kYjjlMReo0LYLsplSGSuiQ.jpeg" alt="jekyll-related-posts" caption="Jekyll Related Posts" %}

Now you can include a configurable set of related posts on a page without relying on custom plugins, so works with GitHub Pages.

* Choose random pages from posts and collections.
* Choose pages with matching tags and/or categories.
* Change the number of related pages to include.
* Change the selection criteria (number of tags/categories, match both tags and categories or either).
* Choose random posts from the matched pages.

The core of `jekyll-related-posts` is an `_includes` file called `related.html`. This file first generates and then iterates a related posts list based on your site `_config.yml` and page front matter.

## Installation

1. Copy the `related.html` file into your site `_includes` directory.
2. Modify your `_config.yml` file to include `related_by`, `related_categories` and/or `related_tags` values. See below for available settings.
3. Update the `_layout` used to include related posts to {% raw %}`{% include related.html %}`{% endraw %} where related posts should appear.
4. Copy the `related-post.html` file into your _includes directory - modifying it to output a link for each related document. Alternatively set the `related_template` setting in `_config.yml` with an alternative include file - for example `archive-single.html` if you use the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme.

## Settings

The configured `related_template` file (defaults to `related-post.html`) is included by `related.html` for each post (as a `post` variable). Additionally, a `related_layout` value is provided in `include.type` to control how that related post is shown on your page. This is compatible with the popular Minimal Mistakes' [Grid View](https://mmistakes.github.io/minimal-mistakes/docs/layouts/#grid-view) layout in it's `archive-single` helper.

Configuration for `related.html` is controlled by a set of `related_*` settings. They can be set at the page level, which overrides a site-wide setting. Each setting has a default value if not set at page or site levels:

```
page.related_*? => Use page.related_*
 |
 No
 |
 \-- site.related_*? => Use site.related_*
   |
   No
   |
   \-- Use a default value.
```

The following `related_*` variables are available:

| Related Setting | Description |
|-----------------|-------------|
| `related_by`    | Space separated list defining how related posts are selected. Use **`tags`**, **`categories`** (or both separated by space to match tags and categories). Include the word **or** to match tags or categories.<br/><br/> Alternatively use **`random`** to choose a random set of pages, or **`default`** for `site.related_posts` (or `site.posts` if `site.related_posts` is empty). |
| `related_from` | Specify whether related pages come from just **`posts`**, the same **`collection`** or any **`documents`** (including posts).<br/><br/>NB: When using `related_by: random`, pages can only be selected from all `posts` or all `documents` (including posts). To select random pages from the same collection see the examples below. |
| `related_limit` | The maximum number of related pages to include. Defaults to **4**. |
| `related_categories` | The minimum **number** of matching categories when `related_by` contains `categories`. Defaults to **1**. |
| `related_tags` | The minimum **number** of matching tags when `related_by` contains `tags`. Defaults to **1**. |
| `related_template` | The name of the `_include` file used for each related post added to the page. Defaults to `related-post.html` For the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme, use `archive-single.html` instead. |
| `related_layout` | The layout to pass to the `related_template` in the `include.type` parameter. Can vary depending on the `related_template` used. Defaults to **`list`**. |

NB: Setting `related_categories` and `related_tags` to 0 when using `related_by` = `categories`, `tags` or both has a similar effect to configuring `related_by` as `random`.

## Example Configurations

Example configurations and integration of `related.html` into the `default` layout of the Jekyll `minima` theme is shown below:

**Include up to 6 pages with 1+ matching categories AND 1+ matching tags:**

```yaml
related_by: tags categories # Match on both categories and tags
related_limit: 6            # Include 6 related pages
related_categories: 1       # Match at least 1 category
related_tags: 1             # AND at least 1 tag.
```

**Include up to 4 pages with 1+ matching categories OR 1+ matching tags:**

```yaml
related_by: tags or categories # Match on categories OR tags
#related_limit: 4              # Include 4 related pages by default
related_categories: 1          # Match at least 1 category
related_tags: 2                # OR at least 2 tags.
```
*NB: `related_limit: 4` is the default value, so does not have to be specified.*

**Include up to 5 related pages with 2+ matching tags:**

```yaml
related_by: tags      # Match on both categories and tags
related_limit: 5      # Include 5 related pages
related_tags: 2       # Match with at least 2 tags.
```

### Integrating `related.html` into a layout

Integrating `related.html` into the `default` layout can be as simple as:

{% raw %}
```html
{% comment %}
  <!-- Only show related pages on a page when `related: true` -->
{% endcomment %}
{% if page.id and page.related %}
  <div class="wrapper">
    <h3>See also</h3>
    {% include related.html %}
  </div>
{% endif %}
```
{% endraw %}

### Random Related Pages
The example front matter below will choose 10 random pages across posts and other collections. For example, on a recipe site, you could have a page that just shows random recipies from across your collections and posts.

```yaml
---
title: "Random Recipes"
related_by: random
related_limit: 10
---
```

**Random from the same collection:**

To select random pages from the same collection, you cannot specify `related_by: random` along with `related_from: collection`. Instead relate by 0+ matching tags (i.e. any page from the same collection):
```yaml
related_by: tags         # Match on just tags
related_from: collection # Select from the same collection
related_tags: 0          # Match any page from the collection.
```

**NB: Related posts are chosen randomly at site build time (Jekyll is a static site generator after all). Related pages do not change when the page is accessed, only when the site is built.**
