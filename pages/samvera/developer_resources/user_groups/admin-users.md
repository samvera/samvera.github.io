---
title: "Creating User Groups with a Database"
permalink: admin-users.html
keywords: ["Roles", "Groups", "Setup"]
sidebar: home_sidebar
toc: false
---

### Creating Groups of Users: Database-backed Solutions
  This page demonstrates managing groups with Hyrax Role Management, but there are a few other options available. See:

  - [Rolify](https://github.com/RolifyCommunity/rolify),
  - [Hydra-ldap]( https://github.com/samvera-labs/hydra-ldap)

### Setup - Development Note

If you need to add administrative users in a production or production-like application, please proceed with following this guide.

If you only need to set up an admin user in development, this guide may be too heavyweight for your needs. Instead you should edit `config/role_map.yml` in the internal test application per [these instructions](https://github.com/samvera/hyrax/wiki/Setting-up-test-app-for-workflow).

### Install hydra-role-management

Follow the directions for installing [hydra-role-management](https://github.com/samvera/hydra-role-management#installing).

Add the following to your application's Gemfile:

```ruby
gem 'hydra-role-management'
```

Then install the gem and run its database migrations:

```bash
# each of these commands will produce some output.
bundle install
rails generate roles
rake db:migrate
```

### Add new abilities

When you add new abilities to `app/models/ability.rb` per the hydra-role-management instructions, add that code to the end of the `custom_permissions` method.

### Add an initial admin user via command-line

Run rails console

```
$ rails c
```

Add the administrative role to an administrative user:

```
admin = Role.create(name: "admin")
admin.users << User.find_by_user_key( "your_admin_users_email@fake.email.org" )
admin.save
```

### Add more admin users

You can add more administrative users via the command-line like you did above, or you can do so via the UI:

* Login as an admin user
* Browse to http://your.app.host/roles
* Select a role and add one or more users to it

### Confirm user was made an admin

Run the following commands in the rails console:

```
u = User.find_by_user_key( "your_admin_users_email@fake.email.org" )
u.admin?
# => true
```

If `u.admin?` returns `true` then everything worked as expected.

Or you can verify this in the UI:

* Login as an admin user
* Browse to http://your.app.host/roles
  * The page should load without exceptions
  * You should see a button labeled "Create a new role"

If you don't see this or get a permission error, you may need to restart your Rails server and try again in the browser.
