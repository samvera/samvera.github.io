---
title: "Creating User Groups"
permalink: groups.html
keywords: ["Roles", "Groups", "User Groups", "Setup"]
sidebar: home_sidebar
toc: false
---

### Creating Groups of Users: The Default Setup

Samvera ships with a YAML based group management system.  Typically this is only used when learning Samvera.

To change the groups in the default YAML implementation, you want to edit `config/role_map.yml`. That file should look something like this:

```yaml
development:
  archivist:
    - archivist1@example.com

test:
  archivist:
    - archivist1@example.com
    - archivist2@example.com
    - leland_himself@example.com
  admin_policy_object_editor:
    - archivist1@example.com
  donor:
    - donor1@example.com
    - leland_himself@example.com
  researcher:
    - archivist1@example.com
    - researcher1@example.com
  patron:
    - patron1@example.com
    - leland_himself@example.com

production:
  # Add roles for users here.
```

If we want to add ourselves as to the `admin` group we could make this change:

```yaml
development:
  admin:
    - me@example.com
```

We can change the groups implementation (default is `RoleMapper`) by setting
```
User.groups_service = MyCustomService
```

Here is the original implementation of the [RoleMapper class]( https://github.com/samvera/hydra-head/blob/master/hydra-access-controls/lib/hydra/role_mapper_behavior.rb).
