# samvera.github.io

[![Build Status](https://travis-ci.org/samvera/samvera.github.io.svg?branch=master)](https://travis-ci.org/samvera/samvera.github.io)
## How Does This Work?

We use a Jekyll-based custom theme for markup and display, and pages are published to http://samvera.github.io.

## Adding or Editing Content

These are community documents, so we rely on the pull request model. If you'd like to contribute content:

- clone this project (link on [samvera/samvera.github.io](http://samvera.github.io))
- make a branch for your new documentation
- run `bundle install`
- create/edit pages within the Samvera directory (e.g. [/pages/samvera/](https://github.com/samvera/samvera.github.io/tree/master/pages/samvera))
- add/update [front matter](#basic-front-matter)
- add links to the page in home_sidebar.yml
- write content ([notes on writing content](#notes-on-writing-content))
- [add versioning information](#versioning-information) for the gem version the document page describes
- submit a Pull Request

To Test in Jekyll:

* Run the jekyll server

```
bundle exec jekyll serve
```

* View the documentation in a browser at http://localhost:4000

### Basic Front Matter

Example front matter for page [Best Practices -> Coding Styles](https://raw.githubusercontent.com/samvera/samvera.github.io/master/pages/samvera/developer_resources/best_practices/coding_style.md)
```
---
title: "Coding Style with RuboCop"
permalink: best-practices-coding-styles.html
folder: samvera/how-to/best_practices/coding_styles.md
sidebar: home_sidebar
keywords: ["Best Practices", "Coding Styles", "Rubocop"]
categories: How to Do All the Things
version:
  id: 'hyrax_1.0-stable'
last_updated: March 30, 2017
---
```
where,
* **title** [String] - _(required)__ - the title displayed on the generated html page
* **permalink** [text] - _(required)_ - the name of the generated html file that will be part of the url accessed by users
* **folder** [text] - _(required)_ - the location of this *.md file under the pages directory
* **sidebar** [text] - _(required)_ - value is always `home_sidebar` at this point
* **keywords** [Array<Strings>] - _(recommended)_ - keywords that get populated into the metadata for SEO and page browsing.
* **categories** [text] - _(recommended)_ - represents the 4 major headings under which a page can reside
* **version** [hash] - _(recommended)_ - specifies the gem's name and version that this documentation page describes.  See [Versioning Information](#versioning-information) for details.
* **last_updated** [text] - (recommended) - Text version of updated date, to show in page footer.

### Notes on writing content

You can highlight content with the following...

```
<ul class='info'><li>This shows an info icon and provides the user additional information in a blue box.</li></ul>
```
![info box](https://github.com/samvera/samvera.github.io/tree/master/assets/images/readme_documentation/info_box.jpg "Info Box")
(Example: [code](https://raw.githubusercontent.com/samvera/samvera.github.io/master/pages/hydra/developer_resources/customize_metadata/hyrax_1.0/generate-work-type.md), [webpage](http://samvera.github.io/customize-metadata-generate-work-type.html))

```
<ul class='warning'><li>This shows a warning icon and provides the user warning information in a red box.</li></ul>
```
![warning box](https://github.com/samvera/samvera.github.io/tree/master/assets/images/readme_documentation/warning_box.jpg "Warning Box")

```
<ul class='question'><li>This shows a question icon and provides the user with information in a yellow box indicating that there may be some uncertainty about a particular piece of information in the documentation.</li></ul>
```
![question box](https://github.com/samvera/samvera.github.io/tree/master/assets/images/readme_documentation/question_box.jpg "Question Box")


NOTE: You cannot use markdown in these boxes.  For example, if you want a link, you will have to use an html anchor tag.

### Versioning-information

The documentation on this site covers multiple gems and multiple versions of those gems.  The recommended best practice is to specify the gem's name and version, including a link to the applicable branch in github.  If there is documentation for multiple versions of the gem, then a selection list allows users to switch between versions.

#### Specifying gem name, version, and branch

##### Predefined version information

Common gems have version information encoded and can be referenced by id in front matter.  The predefined version information is defined in [_includes/version_info/](https://github.com/samvera/samvera.github.io/tree/master/_includes/version_info)

Example for Hyrax v1.0 stable:
```
version:
  id: 'hyrax_1.0-stable'
```

##### Custom version information

If the predefined version information does not exist.  You can specify custom values in the front matter.

Example custom version information:
```
version:
  label: 'Hydra Role Management v0.2.2'
  branch:
    label: 'master'
    link: 'https://github.com/samvera/hydra-role-management'
```

##### Adding predefined version information for a gem version

It is good practice to add predefined version information, as this allows reuse and consistent encoding of gem names and versions.  

Adding predefined version information is a two step process.

1. Add the version information to a new version file in directory [_includes/version_info/](https://github.com/samvera/samvera.github.io/tree/master/_includes/version_info) naming the file with the gem and verion number (e.g. version_hyrax_1.0-stable.html).  Include in the new file assignments for version_label, branch_label, and branch_link.

Example assignments for Hyrax v1.0:
```
{% assign version_label = 'Hyrax stable v1.0' %}
{% assign branch_label = '1.0-stable' %}
{% assign branch_link = 'https://github.com/samvera/hyrax/tree/1-0-stable' %}
```

2. Add a new condition in [_includes/versions.html](https://github.com/samvera/samvera.github.io/tree/master/_includes/versions.html) that includes the predefined version information if its id is specified in front matter for a document.  The condition in the case statement becomes the id that is used in front matter.

Example conditional include based on id:
```
{% case page.version.id %}
{% when 'hyrax_1.0-stable' %}
  {% include version_info/version_hyrax_1.0-stable.html %}
...
{% endcase %}
```

#### Selector for switching versions

Identifying multiple versions is done by specifying each version in front matter including its label and link.  If the version is the active version that the current page is describing, then also include `selected: 'true'`.  The multi-version information is repeated on every version's page for the documentation topic.

Example front matter for multiple versions:
```
version:
  versions:  
    - label: 'Hyrax 1.0'
      link:  'what-happens-deposit-1.0.html'
      selected: 'true'
    - label: 'Hyrax 2.0'
      link:  'what-happens-deposit-2.0.html'  
```

## Our Theme

We use a Jekyll theme designed for [documentation](https://github.com/tomjohnson1492/documentation-theme-jekyll). We chose the Documentation Theme because of its excellent navigation and clear page layout, and for the ease of working in markdown.
