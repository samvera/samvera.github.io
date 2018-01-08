---
title: "Troubleshooting Production"
a-z: ["Troubleshooting Production"]
keywords: debugging
categories: Production
permalink: troubleshooting-production.html
folder: samvera/production/
sidebar: home_sidebar
tags: [production]
---

# Known gotchas

## displaying default admin set raises exception
Hyrax creates a default admin set that has a slash in its id ("admin_set/default").
This means that unless your webserver is configured to allow encoded slashes, 
features that refer to the default admin set in the url will raise an exception.
If you are using passenger on Ubuntu, you can fix this by adding this line to 
`/etc/apache2/conf-enabled/passenger.conf`:
```
  PassengerAllowEncodedSlashes on
```
The actual syntax might vary depending on your webserver configuration.
