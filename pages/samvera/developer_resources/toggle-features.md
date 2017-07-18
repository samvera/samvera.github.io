---
title: "How to Enable and Disable Features"
keywords: Configuration, Features
categories: How to Do All the Things
permalink: toggle-features.html
folder: samvera/how-to/toggle-features.md
sidebar: home_sidebar
toc: false
tags: [development_resources]
---


Some features in Hyrax can be flipped on and off from either the Administrative Dashboard, or via a YAML configuration file at `config/features.yml`. This .yml file doesn't ship with Hyrax but can easily be created.

``` ruby
assign_admin_set:
  enabled: false
proxy_deposit:
  enabled: false
```

If both options exist, whichever option is set from the Administrative Dashboard will take precedence.

[Here is the list of all the features](https://github.com/samvera/hyrax/wiki/Feature-matrix) available to your Hyrax application, with instructions on how to configure them.
