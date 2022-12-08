---
title: Samvera Labs
permalink: samvera_labs.html
keywords: ["Labs", "Experiments", "Starting a Project", "Development"]
last_updated: June 23, 2022
folder: samvera/developer_community/git_structure/
sidebar: samvera_sidebar
toc: true
---
# What is Samvera-Labs?

The [`samvera-labs` Github Organization](https://github.com/samvera-labs) is for
Samvera Experiments, Works-in-progress, and Beta versions of gems and apps.
Projects here may be suitable for production use, but awaiting broader adoption.

## Requirements for creating a project
The samvera-labs repository is meant to be a true lab, and experimentation is to be encouraged as much as possible. The committers may accept any any contributions to samvera-labs by any Samvera Contributors wishing to offer their work.

## Guidelines for Promotion to Samvera from Labs
You may utilize this [template](https://docs.google.com/document/d/1pq80frBACLzA_q9cE1ZnMZh4WTiBv6iMUXELligbcv0/edit?usp=sharing) to display how your repository meets each criteria

To move from `samvera-labs` to the core `samvera` code organization, the following requirements must be met:

### Code Requirements

  1. Software unit and integration test suites using a framework such as [RSpec](https://rspec.info/) or [Jest for JavaScript](https://jestjs.io/). While there is no minimum threshold for test coverage, usage of tools such as [SimpleCov for Ruby](https://github.com/simplecov-ruby/simplecov) or [Jest test coverage analysis features](https://jestjs.io/docs/configuration#collectcoverage-boolean) are encouraged (but not required)

  1. Employs a source code linting tool such as [Bixby](https://github.com/samvera/bixby) or [Prettier](https://github.com/prettier/prettier) in order to enforce style guidelines within the source code base
 
  1. Show compatibility with current Ruby and Rails versions and other dependencies, when was it last tested. Note compatibility with prior versions when available. Compatibility can be specified in the gemspec(s) or verified within the CI configuration

  1. Uses continuous integration to automate the execution of test suites (preferably CircleCI, unless there is a compelling reason to do something else). For CircleCI, also strongly encouraged would be the usage of [Samvera CircleCI Orb](https://github.com/samvera/samvera-circleci-orb)

  1. Code must feature releases using [RubyGems](https://rubygems.org/) or the [NPM](https://www.npmjs.com/), and offer a release version >= 1.0.0

  1. Code releases must follow the [Semantic Versioning specification](https://semver.org/) standards

### Documentation Requirements
These document files are derived from the templates managed within [the Samvera Maintenance repository](https://github.com/samvera/maintenance).

  1. [`README.md`](https://github.com/samvera/maintenance/blob/main/templates/README.md)

  1. [`LICENSE`](https://github.com/samvera/maintenance/blob/main/templates/LICENSE)

  1. [`CODE_OF_CONDUCT.md`](https://github.com/samvera/maintenance/blob/main/templates/CODE_OF_CONDUCT.md)

  1. [`SUPPORT.md`](https://github.com/samvera/maintenance/blob/main/templates/SUPPORT.md)

  1. [`CONTRIBUTING.md`](https://github.com/samvera/maintenance/blob/main/templates/CONTRIBUTING.md)

  1. Known issues documented in GitHub Issues

  1. Resolve any `TODO` comments within the code base (or, remove the comments and please create these as GitHub Issues)

### Use Requirements

  1. Community use by three or more organizations

  1. In active use for six months

  1. Has an ongoing maintenance plan

## Mechanism for Promotion

As needed or requested, code repositories are reviewed for promotion and deprecation. To start this process, email the [Samvera Tech Google Group](https://groups.google.com/g/samvera-tech) with a request. Provide documentation that all of the above requirements have been met. Then propose an agenda item on the next [Samvera Tech Call](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405211059/Notes+from+Tech+Meetings+and+Calls) to discuss the issue. Once the promotion has been decided, another email should go out to the group with an announcement.
