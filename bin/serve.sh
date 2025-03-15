if [ "$1" = "-d" -o "$1" = "--docker" ]; then
  docker run --rm -it -v .:/home -p 4000:4000 -e JEKYLL_GITHUB_TOKEN=$JEKYLL_GITHUB_TOKEN jsware/github-pages
else
    bundle exec jekyll serve --open
fi