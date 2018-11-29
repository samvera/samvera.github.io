---
title: "Troubleshooting Production"
permalink: troubleshooting-production.html
keywords: ["Debugging", "Troubleshooting", "Production"]
last_updated:
tags: production
summary: "Known issues regarding running in production"
sidebar: home_sidebar
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

## 'Failed to upgrade to WebSocket' ERROR for Hyrax notifications

It's a known issue that Hyrax notifications don't work with Apache and Passenger.

An alternative approach is to use puma and have Apache reverse proxy to the puma port. In this configuration, you may find that notifications still don't work, with `ERROR: Failed to upgrade to WebSocket` repeatedly appearing in the logs.

The following configuration example has been successfully used as a fix for this issue in Centos7. Note, you will need mod_proxy and mod_proxy_wstunnel enabled.

Please note that this configuration MAY also work with Passenger, but has not been tested.

```
<VirtualHost *:80>
  ServerName localhost
  DocumentRoot /var/lib/hyku/public
  ProxyPreserveHost On

  # Needed for RIIIF image server
  AllowEncodedSlashes NoDecode

  <Directory /var/lib/hyku/public>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
  </Directory>

  # Hyrax notifications require the following re-write configuration
  #   otherwise notifications won't work and the log will contain lots of:
  #   "ERROR: Failed to upgrade to WebSocket"
  # Enable the rewrite engine
  # Requires: sudo a2enmod proxy rewrite proxy_http proxy_wstunnel
  # In the rules/conds, [NC] means case-insensitve, [P] means proxy
  # See https://stackoverflow.com/questions/27526281/websockets-and-apache-proxy-how-to-configure-mod-proxy-wstunnel
  RewriteEngine On

  # socket.io 1.0+ starts all connections with a HTTP polling request
  RewriteCond %{QUERY_STRING} notifications/endpoint       [NC]
  RewriteRule /(.*)           http://localhost:3000/$1 [P]

  # When socket.io wants to initiate a WebSocket connection, it sends an
  # "upgrade: websocket" request that should be transferred to ws://
  RewriteCond %{HTTP:Upgrade} websocket               [NC]
  RewriteRule /(.*)           ws://localhost:3000/$1  [P]

  ProxyPass / http://127.0.0.1:3000/
  ProxyPassReverse / http://127.0.0.1:3000/
</VirtualHost>

```
