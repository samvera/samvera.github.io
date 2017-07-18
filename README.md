# How Does This Work?

We use a Jekyll-based custom theme for markup and display, and pages are published to http://samvera.github.io.

## Adding or Editing Content

These are community documents, so we rely on the pull request model. If you'd like to contribute content:

- clone the project
- make a branch
- create/edit pages within the Samvera directory
- add/update [front matter](#basic-front-matter)
- add links to the page in home_sidebar.yml
- [generate the A-Z Index](#generate-the-a-z-index-page), if needed
- submit a Pull Request

### Basic Front Matter

Example front matter for page [Best Practices -> Coding Styles](https://raw.githubusercontent.com/samvera/samvera.github.io/master/pages/samvera/developer_resources/best_practices/coding_style.md)
```
---
title: "Coding Style with RuboCop"
permalink: best-practices-coding-styles.html
folder: samvera/how-to/best_practices/coding_styles.md
sidebar: home_sidebar
a-z: ['Coding Styles', 'Rubocop']
keywords: Best Practices
tags: [development_resources]
categories: How to Do All the Things
---
```
where,
* **title** [String] - _(required)__ - the title displayed on the generated html page
* **permalink** [text] - _(required)_ - the name of the generated html file that will be part of the url accessed by users
* **folder** [text] - _(required)_ - the location of this *.md file under the pages directory
* **sidebar** [text] - _(required)_ - value is always `home_sidebar` at this point
* **a-z** [Array<Strings>] - _(recommended)_ - array of terms to link to this page in the A-Z Index
* **keywords** [comma separated list] - _(recommended)_ - keywords that get populated into the metadata of the page for SEO
* **tags** [Array<text>] - _(recommended)_ - array of tags where tags must be defined in your [_data/tags.yml](https://github.com/samvera/samvera.github.io/tree/master/_data/tags.yml) list. You also need a corresponding tag file inside the [pages/tags](https://github.com/samvera/samvera.github.io/tree/master/pages/tags) folder that follows the same pattern as the other tag files shown in the tags folder.  It is rare that a new tag would be created.  If you think you need a new tag, be sure to highlight it as requiring review in the issue.
* **categories** [text] - _(recommended)_ - represents the 4 major headings under which a page can reside

### Generate the A-Z Index page

```
bundle exec jekyll build
mv generated/atoz.md pages
```
Then commit pages/atoz.md to github

## Our Theme

We use a Jekyll theme designed for [documentation](https://github.com/tomjohnson1492/documentation-theme-jekyll). We chose the Documentation Theme because of its excellent navigation and clear page layout, and for the ease of working in markdown.
