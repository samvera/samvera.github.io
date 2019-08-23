---
title: Samvera Labs
permalink: samvera_labs.html
keywords: ["Labs", "Experiments", "Starting a Project", "Development"]
last_updated: February 26, 2018
folder: samvera/developer_community/git_structure/
sidebar: samvera_sidebar
toc: true
---
# What is Samvera-Labs?

The [`samvera-labs` Github repository](https://github.com/samvera-labs) is for
Samvera Experiments, Works-in-progress, and Beta versions of gems and apps.
Projects here may be suitable for production use, but awaiting broader adoption.

## Requirements for creating a project
The samvera-labs repository is meant to be a true lab, and experimentation is to
be encouraged as much as possible. The committers may accept any any contributions
to samvera-labs by any Samvera Licensed Contributors wishing to offer their work.

## Guidelines for Promotion to Samvera from Labs
You may utilize this [template](https://docs.google.com/document/d/1pq80frBACLzA_q9cE1ZnMZh4WTiBv6iMUXELligbcv0/edit?usp=sharing) to display how your repository meets each criteria

To move from `samvera-labs` to the core `samvera` code organization, the following
requirements must be met:

### Code Requirements

  1. Code must be released at version >= 1.0

  1. Good unit test coverage measured by community (e.g. 100% or 75% of what’s important)

  1. uses CI (Preferably CircleCI, unless there is a compelling reason to do something else)

  1. uses Coverage tool (coveralls or simplecov)

  1. Show compatibility with current Rails versions and other dependencies, when was it last tested; note compatibility with prior versions when available. Compatibility can be specified in the gemspec(s) or verified via CI matrix.

  1. [Hierarchy of promises](https://wiki.duraspace.org/display/samvera/Hydra+Stack+-+The+Hierarchy+of+Promises) asserted in clearly defined acceptance tests

### Documentation Requirements

  1. LICENSE file, Apache 2 (or compatible)

  1. README.md

  1. Statement of purpose

  1. Basic install steps

  1. Identify any volatile/experimental features

  1. How to contribute -> CONTRIBUTING.md

  1. How/Who to contact for help -> push out to all gems like CONTRIBUTING.md

  1. Known issues documented in github Issues tickets (not just listed in text)

  1. Tutorial / Walkthrough / Example usage

  1. Resolve TODO items in documents and remove them

  1. All Contributors should have signed Hydra Contibutor License Agreement (CLA)

### Use Requirements

1. Community use by three or more institutions

1. In active use for six months

1. Has an ongoing maintenance plan.


## Mechanism for Promotion

As needed or requested, code repositories are reviewed for promotion / deprecation.
To start this process, email the Samvera Tech list with a request. Provide documentation
that all of the above requirements have been met. Ask for a spot on the next developer's
call to discuss the issue. Once the promotion has been decided, another email
should go out to the list with an announcement.
