---
title: "How to Enable and Disable Features"
keywords: [ "Configuration", "Enable / Disable Features",
            "FlipFlop", "Feature Flipper" ]
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

For a list of flipper features that can be configured in this way, see the [https://github.com/samvera/hyrax/blob/master/config/features.rb](https://github.com/samvera/hyrax/blob/master/config/features.rb) which defines keys and whether they are enabled by default.

<ul class='warning'><li>If both options exist, whichever option is set from the Administrative Dashboard will take precedence.</li></ul>

For a complete list of features and instructions on how to configure them, see the [Hyrax Feature-matrix](https://github.com/samvera/hyrax/wiki/Feature-matrix).
