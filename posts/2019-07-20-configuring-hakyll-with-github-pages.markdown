---
title: Configuring Hakyll with GitHub Pages the Easy Way
---

## Overview

After looking over a few tutorials on setting up Hakyll with GitHub Pages, I
noticed that they weren't beginner-friendly.  Therefore, the intent of this
post is to guide the reader through setting up Hakyll with GitHub Pages in an
easy-to-understand manner.

The official Hakyll [website](https://jaspervdj.be/hakyll/) has a tutorial for
setting up GitHub Pages
[here](https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html).
However, at the time of this posting, there are details that were left out that
cause arcane errors. I will rectify the errors in this tutorial.


## Setting up the repo

GitHub Pages does not work out of the box with Hakyll. This is because GitHub
Pages expects the site content to be in the root directory of the repository,
while Hakyll puts the site content in the `_site/` subdirectory.  To solve this
problem, we will have two separate branches: `dev` and `master`. Github Pages
requires the web content to be in `master`. The `dev` branch is where we will
be developing the website. The workflow looks like this:

1. checkout `dev`
2. edit the website
3. build the website (this creates the `_site/` directory) 
4. checkout `master`
5. copy the contents of `_site/` into the project root directory.
6. commit and push the changes to `master` (your GitHub Page will display the
   contents)

To set up the repo for GitHub Pages, create a repository with your username
concatanated with `.github.io`.  Since my username is `senofsky`, my GitHub
Pages site is located at `senofsky.github.io`. Once the repository is created,
create a `.gitignore` file with the following contents:
```
.stack-work/
_cache/
_site/
```

## Install Hakyll

The next step is to install Hakyll. At the time of the posting, the standard
`stack install hakyll` generates a dependency error. Instead, use:
```
stack install hakyll --resolve lts-12.26
```

The error and workaround are documented 
[here](https://github.com/jaspervdj/hakyll/issues/684).

## Create the site

Once Hakyll is installed, create your site and name it after your GitHub
Pages repo for ease of use:
```
stack exec hakyll-init username.github.io
```

Do **NOT** use the Hakyll template given in [Using Hakyll with GitHub
Pages](https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html) post.
At the time of this posting, the Hakyll template given in that tutorial uses
outdated HTML tags that will fail when adding up-to-date themes from sites such
as [Hakyll CSS Garden](http://katychuang.com/hakyll-cssgarden/).

In the newly created website directory, execute:
```
git init
git remote add origin <URL to your GitHub pages repository>
git pull
git checkout -b dev
git add --all
git commit -m "first posting"
git push
```

## Deploying the site

To build the site, you must first execute:
```
stack init
stack build
stack exec site build
```

At this point, you can view a local copy of your site by executing:
```
stack exec site watch
```
and navigating to <http://localhost:8000/>.

If you make changes to the website's HTML or markdown files, be sure to rebuild
the site by executing
```
stack exec site clean
stack exec site build
```
or
```
stack exec site rebuild
```

If you make changes to the `site.hs` file itself, you must rebuild the site
binary itself by executing:
```
stack build
```

Now to publish the website, execute:
```
stack exec site build
```
to generate the `_site` directory.  Next, check out the `master` branch,
extract the `_site` contents, commit the changes, and push to origin.
```
git checkout master
cp -a _site/. .
git commit -m "published first draft"
git push
```

You can then visit your site at username.github.io. The site may take up up to 10 minutes to update so patience is required.

## Adding a new theme

Dr. Kat Chuang developed [Hakyll CSS
Garden](http://katychuang.com/hakyll-cssgarden/), an awesome site that provides
various themes for Hakyll. Her themes work with the default Hakyll template, so
they're easy to use.  Simply replace `css/default.css` with the css file of the
desired theme (be sure to rename it to `default.css`).

## Final words

I wanted this tutorial to get the reader's GitHub Page running
in a quick and easy manner. I would strongly encourage the reader the visit the
official Hakyll [website](https://jaspervdj.be/hakyll/) to learn how to
customize their site.
