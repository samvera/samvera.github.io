---
title: "Configure Hyrax 1 User Polling Notifications"
a-z: ["Configuration, Notifications, Polling"]
keywords: Configuration, Notifications
categories: How to Do All the Things
permalink: how-to-disable-notifications.html
folder: samvera/how-to/
sidebar: home_sidebar
tags: [development_resources]
toc: false
---


In `lib/hyrax/configuration.rb`, there is a method to set the poll interval for notification updates:

```ruby
   def notifications_update_poll_interval
    @notifications_update_poll_interval ||= 30.seconds
   end
```

You could set this to never (effectively).

The setting is referenced in the view partial `app/views/hyrax/users/_notify_number.html.erb` also, providing another place you could set it.

```ruby
data: { 'update-poll-url' => hyrax.user_notify_path,
        'update-poll-interval' => 30 } do %>
        'update-poll-interval' => Hyrax.config.notifications_update_poll_interval }  
```

[Hyrax commit with these settings](https://github.com/samvera/hyrax/commit/4c60143900a02c19419f1ccef7d34068e1ef004e)
