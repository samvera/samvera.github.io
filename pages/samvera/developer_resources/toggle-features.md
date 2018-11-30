---
title: "How to Enable and Disable Features"
permalink: toggle-features.html
keywords: [ "Configuration", "FlipFlop", "Feature Flipper" ]
last_updated:
tags: [development_resources]
summary: 'A number of Hyrax features can be flipped on and off, either via the Administrative Dashboard or via a YAML configuration file'
sidebar: home_sidebar
toc: false
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
