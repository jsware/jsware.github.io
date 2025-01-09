---
title: "Docker GitHub Pages"
excerpt: A Docker container image and startup profile to run GitHub Pages locally during development...
image: &image "/assets/images/philippe-oursel-06y6wukkSKg-unsplash.jpg"
categories: GitHub Docker
tags: GitHub Docker
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
toc: true
toc_sticky: true
---

This site (along with many others) is run using GitHub Pages.

GitHub Pages hosts static websites. It could be about yourself, a project, or a business. GitHub Pages [prohibits](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#prohibited-uses) use for running an online business, e-commerce site or anything primarily directed as commercial transactions or Software as a Service. For more information on GitHub Pages, see [GitHub Pages documentation](https://docs.github.com/en/pages).

Before sending my site updates to GitHub for publishing, I like to preview it locally. GitHub Pages uses Jeylll (a framework for building static websites). Running Jekyll should be quite easy. Install Ruby, some Ruby gems (Bundler, Jekyll and the GitHub Pages plugins) and I can preview my updates locally.

# My Ageing Workstation

I have an Apple MacBook Pro (Mid 2015) as my main workstation. Its almost 10 years old now, but still serves me well. However, it will only run macOS Monterey (v12.7.6 at the time of writing). I have tried [OpenCore Legacy Patcher](https://dortania.github.io/OpenCore-Legacy-Patcher/) with Sequoia but I had network stability issues and WebGL failed to work in Safari for me.

I recently wiped and rebuilt the laptop to clear out lots of old clutter. During re-install, I went to setup my GitHub Pages development environment. This involves using Homebrew to install the correct version of Ruby, Bundle and Jekyll.

This is when I found that as of October this year (2024), Homebrew no longer supported macOS Monterey.

Docker however, runs fine on this ageing old workstation.

# What is Docker?

Docker allows developers to build, test applications and deploy applications. In Docker, an image of everything required to run an application is packaged and used to create a standard container that runs in a virtual machine. For more information on Docker, see the [Docker documentation](https://www.docker.com).

I can use Docker to host a local development environment to preview my GitHub Pages websites.

![GitHub Pages in Docker](https://www.jsware.io/docker-github-pages/assets/images/GitHub-Pages.gif)

# Creating a GitHub Pages container

This turned out to be relatively easy. I did the following:

1. Install Docker Desktop
2. Create a Dockerfile that
    1. Started with Ruby 3.3.4 (The version used by [GitHub Pages](https://pages.github.com/versions/))
    2. Install the GitHub Pages gem bundle
    3. Copied a start script to start Jekyll with the site mounted into the /home directory.
3. Build the Docker image.
4. Create and run a container from the directory.

For more information, see the [Docker GitHub Pages](https://www.jsware.io/docker-github-pages/) documentation.
