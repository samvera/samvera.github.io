---
title: "Visibility and Access Controls"
permalink: access-controls.html
keywords: ["Visibility", "Access Controls", "Authorization"]
last_updated:
tags: [development_resources]
summary: 'An overview of how Samvera applications authorize users to see content and perform actions'
sidebar: home_sidebar
---
### Quickstart
Samvera uses [cancancan](https://github.com/CanCanCommunity/cancancan#1-define-abilities) to do authorization of many actions.

Cancancan generates `app/models/ability.rb` into your application and then hydra-head's generator and later Hyrax's generator each adds a couple of lines so that the class looks like this:

```
class Ability
  include Hydra::Ability

  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
  end
end
```

You don't need to make any changes to this class as the included behavior provides all that you need to get started.   However, if you are integrating an group system other than the default (See Hydra::RoleMapper), then you may want to change who has the admin role.

You can do this by overriding the `admin?` method on the `Ability` class like this:

```
    def admin?
      user_groups.include? 'librarians'
    end
```
### Legacy

In-depth tutorials and explanations of the structure

- [Access Controls with Hydra 9](https://github.com/samvera/hydra-head/wiki/Access-Controls-with-Hydra)

- [Access Controls with Hydra < 9](https://github.com/samvera/hydra-head/wiki/Access-Controls)

### Potential for Refactoring

Notes, links and ideas

- [Oligarchical SaaS with CanCan](https://schwad.github.io/ruby/cancan/saas/2017/04/06/oligarchical-saas-with-cancan.html)

- [Refacotoring Notes: Access Control Details, WIP](https://docs.google.com/document/d/1tWpV8b11WZ5qXP0ZHgFtatVuRg3YFUoMA7jPzU-QB34/edit?usp=sharing)
