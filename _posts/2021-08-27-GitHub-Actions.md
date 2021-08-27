---
title: "Awesome Actions!"
excerpt: GitHub Actions and Python scripting come together to produce an auto-updating GitHub Profile page.
image: &image https://avatars.githubusercontent.com/u/44036562?s=200&v=4
categories:
  - Programming
tags:
  - Python
  - DevOps
  - GitHub
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
classes: wide
---
GitHub recently introduced a special repository for your profile. A repository with the same name as your user name (e.g. [`JohnScottUK/JohnScottUK`](https://github.com/JohnScottUK/JohnScottUK)) is where GitHub looks for a `README.md` to display on your profile page. See [GitHub documentation](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) for more details.

Cool I thought. Somewhere (else) to keep my profile description updated. Possible, but not immediately interesting. I decided I would do this later...

In other news, GitHub added [GitHub Actions](https://github.com/features/actions) for a respository. You can build CI/CD pipelines for code stored on GitHub. Sounds cool, so how could I play with that to learn a little about it?

I have an Atom `feed.xml` generated from blog posts on this website. I could make my profile `README.md` auto-update to include links to my blog posts.

So how does it work? You can do it too...

First create a profile `README.md` file with some static content. For example, a two-column table with static text on the left and blog post links on the right:

```markdown
<table>
  <thead>
    <tr>
      <th valign="top" width="50%">About Me</th>
      <th valign="top" width="50%">My Blog</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td valign="top">
        Some static content about me for now...
      </td>
      <td valign="top"> <!-- Need blank line next for markdown lists to work... -->

* [Blog title](https://blog.example.org/...)<sup>DD Mmm YYYY</sup>
* ...
      </td>
    </tr>
  </tbody>
</table>
```

Nothing fancy, but enough for now. GitHub Actions is more interesting.

There is much that GitHub Actions can do. A [marketplace](https://github.com/marketplace?type=actions) with lots of actions. Everything from a [checkout](https://github.com/actions/checkout) repository action, through [setup](https://github.com/marketplace?type=actions&query=setup+) various languages (e.g. [Python](https://github.com/marketplace/actions/setup-python)) to [zip-release](https://github.com/marketplace/actions/zip-release). I have yet to try most of these.

With GitHub Actions a repository can define multiple workflows. Each workflow defined one or more jobs. Workflow configurations are stored as YAML files in the `.github/workflows` folder of your repository. See the [workflow syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) pages for full details.

By default jobs in a workflow run in parallel. You can configure interdependencies to control their order. Each job defines a set of steps to execute in sequence. Each step in a job can run an action, run setup tasks or run commands or scripts found in your repository.

I wanted to perform the following steps on a daily basis (do consider [usage limits](https://docs.github.com/en/actions/reference/usage-limits-billing-and-administration) but they seem very generous for a free tier):

1. Checkout my profile repository;
1. Update the profile `README.md`;
1. Commit any changes and push back to the origin.

First I needed a script to update the `README.md`. This script must parse my blog's `feed.xml` and insert its entries into the `README.md`. Helped by a little Google searching here and there, a script starts to evolve:

```python
import feedparser
from datetime import datetime as dt
import os

url="https://www.jsware.io/feed.xml"
filename = "{}/README.md".format(os.path.dirname(os.path.abspath(__file__)))

print("Grabbing feed '{}'...".format(url))
feed = feedparser.parse(url)
entries = [
  {
    "title": entry["title"],
    "link": entry["link"],
    "published": dt.strptime(entry["published"],"%Y-%m-%dT%H:%M:%S%z")
  }
  for entry in feed["entries"]
]

print("Generating markdown...")
markdown = "\n".join(["* [{0}]({1})<sup>{2}</sup>".format(entry["title"], entry["link"], entry["published"].strftime("%d %b %Y")) for entry in entries])
```

The above python is relatively simple:

* Declare the modules I need;
* Use the `README.md` file in the same directory as the Python script (`os.path.dirname...`)
* Use Python feedparser to [parse the feed from a URL](https://feedparser.readthedocs.io/en/latest/introduction.html#parsing-a-feed-from-a-remote-url)
* Extract the entries from the feed (converting the published value to a date/time to be formatted nicely)
* Generate the list of blog links as markdown.

Now to read the `README.md`, replace the blog links and overwrite the `README.md`.

First, some markers are required to find the blog section in the `README.md`. HTML `<!--` and `-->` comments can help here, so add them to the table:

```markdown
...
<td valign="top"><!-- begin blog -->

* [Blog title](https://blog.example.org/...)<sup>DD Mmm YYYY</sup>
* ...
<!-- end blog -->
</td></tr></tbody></table>
```

With the above comment markers, I can use a regular expression to subsitute the comments and everything in between:

```python
...
print("Reading '{}'...".format(filename))
with open(filename) as f:
  readme = f.read()

readme = re.sub("<\!-- begin blog -->(\n|.)*<\!-- end blog -->",
                "<!-- begin blog -->\n\n" + markdown + "\n<!-- end blog -->", readme)

print("Writing '{}'...".format(filename))
with open(filename, "w") as f:
  f.write(readme)
```

The regular expression includes any characters between the `begin blog` and `end blog` comment markers. Note the `(\n|.)` match string in the regular expression. This **include** line breaks.

Also, don't forget to escape regular expression special characters like `!` too.

Now I have a script that performs the following:

1. Parse the feed.xml into an array of entries.
1. Converts each entry into a markdown unordered list using each feed item's title, link and published date.
1. Replaced the existing blog section with the new blog entries.

For the GitHub Actions my workflow job needs to:

1. Checkout the repository.
1. Setup Python and required modules. Use [actions/cache](https://github.com/marketplace/actions/cache) to cache any installed PIPs to improve performance
1. Update the `README.md` with the above script.
1. Commit the `README.md` file and push any changes.

Under your profile repository go to the Actions panel and create a new workflow. You can choose ready made workflows, but I chose to skip and setup a workflow myself. You then create and commit the generated YAML file in the `.github/workflows` folder using a suitable name.

Something like this:

{% raw %}
```yaml
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push request events but only for the main branch
  push:
    branches: [ main ]
  # Triggers the workflow on a cron schedule - daily at 21:43.
  schedule:
    - cron: '43 21 * * *'

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "update"
  update:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - name: Checkout Repository
        uses: actions/checkout@v2.3.4

      # Sets up Python to run the script.
      - name: Setup Python
        uses: actions/setup-python@v2.2.2
        with:
          python-version: '3.9'

      # Configure caching of installed PIPs to improve performance.
      - name: Cache Python PIPs
        uses: actions/cache@v2.1.6
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-

      # Install Python modules listed in requirements.txt
      - name: Install Python requirements
        run: |
          python -m pip install -r requirements.txt

      # Run the script to update the README.md
      - name: Update README
        run: |
          python update_readme.py
          cat README.md

      # Commit any changes found (the || exit 0 skips a git push if nothing to commit)
      - name: Commit Changes
        run: |
          git config user.name github-actions
          git config user.email github-actions@github.com
          git add .
          git commit -m "Updated README.md" || exit 0
          git push
```
{% endraw %}

The push of changes only occurs if `git commit` finds something. The `|| exit 0` executes when git commit returns a non-zero exit code. Git commit does if there is nothing to commit. Read it like "git commit or exit 0". When `git commit` works, it's 0 exit code means `git push` will execute.

The workflow runs daily, or whenever I update the repository manually. The `workflow_dispatch` line allows manual execution from within the GitHub UI.

Overall GitHub Actions has lots of potential. With some awesome actions, so much will be possible.
