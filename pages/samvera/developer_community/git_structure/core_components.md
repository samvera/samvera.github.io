---
title: Core Samvera Code Repository
permalink: core_components.html
keywords: [ 'Components', 'Labs', 'Community', 'Development', 'Maintenance' ]
last_updated: June 23, 2022
folder: samvera/developer_community/git_structure/
---
# Samvera Code Repository

The [primary Samvera code repository](https://github.com/samvera) contains the
Samvera community's current consensus
on what we are using, maintaining, and recommending. Ideally, this repository
only contains code modules that are being actively used and maintained. Anything
that falls into disuse should be a candidate for [deprecation](deprecation.html).

## Requirements for a Core Component

1. Code is stored in a repository in the Samvera github organization
   [https://github.com/samvera](https://github.com/samvera) and meets the
   [requirements](/samvera_labs.html#guidelines-for-promotion-to-samvera-from-labs)
   for being there.

2. Component has a designated product owner.

3. A participant of the Component Interest Group must have a
   vested interest in the maintenance of that component, acting as a
   representative for their institution's needs.

## Maintenance

The Component Maintenance Interest Group is in the process of creating a framework for
addressing ongoing maintenance of shared code repositories.

## Product Owner Responsibilities

Product owners act as representatives for stakeholders of each component, an
organizational force to enable the component maintenance interest group to do its
work, and a point of contact for distributing or recording information regarding
the component. They are not required to have a deep technical understanding of
their component. Their responsibilities are as follows:

1. Ensure a release gets cut.
  * Decide when a release is done, what the version number should be, what will
     be in a release, ensure the CHANGELOG is updated, and announce the release to
     the community.
  * Decide what the policy for your component is in regards to backwards
    compatibility and which versions are supported.
2. Own the Backlog
  * Handle incoming issue labeling
  * Create tickets for security issues discovered by automated tooling.
  * Ensure pull requests aren’t sitting around without any response for a long time.
  * Know what priorities are by being in touch with stakeholders enough to understand what the greatest pain points/desires for features are.
  * Be able to give the Component Interest Group a gauge of how important a set of work is and when it needs to be done. Have a ready answer for “if we could give you a week of work, what would you spend it on?”
  * Be able to find answers for “so and so wants to do this with the library, is that a good idea?”
3. Act as point of contact for questions about the component’s goals and path
4. Ensure there’s sufficient documentation for the component to be useful
   * Doesn’t necessarily have to write the documentation, but should know what’s out
     there and have an idea of what might need to be updated if the scope changes,
     etc.
5. Actively participate during sprints to provide guidance and prioritization.
6. Report on whether the component still meets the requirements for being a core
   component.
   * Meets the criteria here:
     [http://samvera-labs.github.io/promotion.html](http://samvera-labs.github.io/promotion.html)
7. Recruit any necessary positions for better maintaining their component.
   * E.g a technical lead.

## Core Components and Product Owners

Please note that Hyrax is not considered a 'component' under the definition used by the CCMWG.

### active_fedora

**Code:** [active_fedora](https://github.com/samvera/active_fedora)

**Product Owner:** [Tamsin Johnson](https://github.com/no-reply)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/active-fedora.svg)](https://badge.fury.io/rb/active-fedora)
[![Build Status](https://circleci.com/gh/samvera/active_fedora.svg?style=svg)](https://circleci.com/gh/samvera/active_fedora)
[![Coverage Status](https://coveralls.io/repos/github/samvera/active_fedora/badge.svg?branch=main)](https://coveralls.io/github/samvera/active_fedora?branch=main)

### browse-everything

**Code:** [browse-everything](https://github.com/samvera/browse-everything)

**Product Owner:** [James R. Griffin III](https://github.com/jrgriffiniii)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/browse-everything.svg)](https://badge.fury.io/rb/browse-everything)
[![Build Status](https://circleci.com/gh/samvera/browse-everything.svg?style=svg)](https://circleci.com/gh/samvera/browse-everything)
[![Coverage Status](https://coveralls.io/repos/github/samvera/browse-everything/badge.svg?branch=main)](https://coveralls.io/github/samvera/browse-everything?branch=main)

### hydra-derivatives

**Code:** [hydra-derivatives](https://github.com/samvera/hydra-derivatives)

**Product Owner (Interim):** [James R. Griffin III](https://github.com/jrgriffiniii)  

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-derivatives.svg)](https://badge.fury.io/rb/hydra-derivatives)
[![Build Status](https://circleci.com/gh/samvera/hydra-derivatives.svg?style=svg)](https://circleci.com/gh/samvera/hydra-derivatives)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-derivatives/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-derivatives?branch=main)

### hydra-editor

**Code:** [hydra-editor](https://github.com/samvera/hydra-editor)

**Product Owner:** [James R. Griffin III](https://github.com/jrgriffiniii)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-editor.svg)](https://badge.fury.io/rb/hydra-editor)
[![Build Status](https://circleci.com/gh/samvera/hydra-editor.svg?style=svg)](https://circleci.com/gh/samvera/hydra-editor)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-editor/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-editor?branch=main)

### hydra-file_characterization

**Code:** [hydra-file_characterization](https://github.com/samvera/hydra-file_characterization)

**Product Owner:** [Jamie Little](https://github.com/little9)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-file_characterization.svg)](https://badge.fury.io/rb/hydra-file_characterization)
[![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works)
[![Coverage Status](https://coveralls.io/repos/samvera/hydra-works/badge.svg?branch=main)](https://coveralls.io/r/samvera/hydra-works?branch=main)

### hydra-head

**Code:** [hydra-head](https://github.com/samvera/hydra-head)

**Product Owner:** [Chris Colvard](https://github.com/cjcolvar)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-head.svg)](https://badge.fury.io/rb/hydra-head)
[![Build Status](https://circleci.com/gh/samvera/hydra-head.svg?style=svg)](https://circleci.com/gh/samvera/hydra-head)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-head/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-head?branch=main)

### hydra-pcdm

**Code:** [hydra-pcdm](https://github.com/samvera/hydra-pcdm)

**Product Owner (Interim):** [James R. Griffin III](https://github.com/jrgriffiniii)  

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-pcdm.svg)](https://badge.fury.io/rb/hydra-pcdm)
[![Build Status](https://circleci.com/gh/samvera/hydra-pcdm.svg?style=svg)](https://circleci.com/gh/samvera/hydra-pcdm)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-pcdm/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-pcdm?branch=main)

### hydra-role-management

**Code:** [hydra-role-management](https://github.com/samvera/hydra-role-management)

**Product Owner:** [James R. Griffin III](https://github.com/jrgriffiniii)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-role-management.svg)](https://badge.fury.io/rb/hydra-role-management)
[![Build Status](https://circleci.com/gh/samvera/hydra-role-management.svg?style=svg)](https://circleci.com/gh/samvera/hydra-role-management)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-role-management/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-role-management?branch=main)

### hydra-works

**Code:** [hydra-works](https://github.com/samvera/hydra-works)

**Product Owner (Interim):** [James R. Griffin III](https://github.com/jrgriffiniii)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/hydra-works.svg)](https://badge.fury.io/rb/hydra-works)
[![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-works/badge.svg?branch=main)](https://coveralls.io/github/samvera/hydra-works?branch=main)

### iiif_manifest

**Code:** [iiif_manifest](https://github.com/samvera/iiif_manifest)

**Product Owner:** [Adam Wead](https://github.com/awead)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/iiif_manifest.svg)](https://badge.fury.io/rb/iiif_manifest)
[![Build Status](https://circleci.com/gh/samvera/iiif_manifest.svg?style=svg)](https://circleci.com/gh/samvera/iiif_manifest)
[![Coverage Status](https://coveralls.io/repos/github/samvera/iiif_manifest/badge.svg?branch=main)](https://coveralls.io/github/samvera/iiif_manifest)

### ldp

**Code:** [ldp](https://github.com/samvera/ldp)

**Product Owner (Interim):** [James R. Griffin III](https://github.com/jrgriffiniii)  

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/ldp.svg)](https://badge.fury.io/rb/ldp)
[![Build Status](https://circleci.com/gh/samvera/ldp.svg?style=svg)](https://circleci.com/gh/samvera/ldp)
[![Coverage Status](https://coveralls.io/repos/github/samvera/ldp/badge.svg?branch=main)](https://coveralls.io/github/samvera/ldp?branch=main)

### noid-rails

**Code:** [noid-rails](https://github.com/samvera/noid-rails)

**Product Owner:** [Justin Coyne](https://github.com/jcoyne)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/noid-rails.svg)](https://badge.fury.io/rb/noid-rails)
[![Build Status](https://circleci.com/gh/samvera/noid-rails.svg?style=svg)](https://circleci.com/gh/samvera/noid-rails)
[![Coverage Status](https://coveralls.io/repos/github/samvera/noid-rails/badge.svg?branch=main)](https://coveralls.io/github/samvera/noid-rails?branch=main)

### questioning_authority

**Code:** [questioning_authority](https://github.com/samvera/questioning_authority)

**Product Owner (Interim):** [James R. Griffin III](https://github.com/jrgriffiniii)  

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/qa.svg)](https://badge.fury.io/rb/qa)
[![Build Status](https://circleci.com/gh/samvera/questioning_authority.svg?style=svg)](https://circleci.com/gh/samvera/questioning_authority)
[![Coverage Status](https://coveralls.io/repos/github/samvera/questioning_authority/badge.svg?branch=main)](https://coveralls.io/github/samvera/questioning_authority?branch=main)

### rubydora

**Code:** [rubydora](https://github.com/samvera/rubydora)

**Product Owner:** [Justin Coyne](https://github.com/jcoyne)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/rubydora.svg)](https://badge.fury.io/rb/rubydora)
[![Build Status](https://circleci.com/gh/samvera/rubydora.svg?style=svg)](https://circleci.com/gh/samvera/rubydora)
[![Coverage Status](https://coveralls.io/repos/github/samvera/rubydora/badge.svg?branch=main)](https://coveralls.io/github/samvera/rubydora?branch=main)

### samvera.github.io

**Code:** [samvera.github.io](https://github.com/samvera/samvera.github.io)

**Product Owner:** [Andrew Myers](https://github.com/afred)

**Vital Statistics:**

[![Build Status](https://circleci.com/gh/samvera/samvera.github.io.svg?style=svg)](https://circleci.com/gh/samvera/samvera.github.io)

### valkyrie

**Code:** [valkyrie](https://github.com/samvera/valkyrie)

**Product Owner:** [Alexandra Dunn](https://github.com/dunn)

**Technical Lead:** [Trey Pendragon](https://github.com/tpendragon)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/valkyrie.svg)](https://badge.fury.io/rb/valkyrie)
[![Build Status](https://circleci.com/gh/samvera/valkyrie.svg?style=svg)](https://circleci.com/gh/samvera/valkyrie)
![Coverage Status](https://img.shields.io/badge/Coverage-100-brightgreen.svg)

### bixby

**Code:** [bixby](https://github.com/samvera/bixby)

**Product Owner:** [James R. Griffin III](https://github.com/jrgriffiniii)

**Vital Statistics:**

[![Gem Version](https://badge.fury.io/rb/bixby.svg)](https://badge.fury.io/rb/bixby)
[![Build Status](https://circleci.com/gh/samvera/bixby.svg?style=svg)](https://circleci.com/gh/samvera/bixby)

### samvera-circleci-orb

**Code:** [samvera-circleci-orb](https://github.com/samvera/samvera-circleci-orb)

**Product Owner:** [James R. Griffin III](https://github.com/jrgriffiniii)

**Technical Lead:** [Collin Brittle](https://github.com/rotated8)

**Vital Statistics:**

[![Orb Version Badge](https://badges.circleci.com/orbs/samvera/circleci-orb.svg)](https://circleci.com/developer/orbs/orb/samvera/circleci-orb)
[![Build Status](https://circleci.com/gh/samvera/samvera-circleci-orb.svg?style=svg)](https://circleci.com/gh/samvera/samvera-circleci-orb)

## Gem Release Process

1. Create a new branch of the following form: `git checkout -b prepare-release-3.2.1` where `3` is the major release, `2` is the minor release, and `1` is the patch release (please see [Semantic Versioning](https://semver.org/) for reference).
1. Within this branch, please update the following:
  1. Version number (this is often found within `lib/[GEM_NAME]/version.rb`)
  1. The [`CHANGELOG.md`](https://keepachangelog.com/en/1.0.0/)
  1. Any additional documentation and areas of code
1. Commit these changes (using `git commit`) and push these to the GitHub repository using `git push origin prepare-release-3.2.1`
1. [Create a Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and request a review from `@samvera/maintenance`
1. A member of the Component Maintenance Interest Group should approved of and merge the pull request
1. One this has been completed, there are now two tasks left (both can be delegated to members of `@samvera/maintenance`):
  1. The new Gem release can be published to RubyGems
    1. Invoke `bundle exec rake release`
    1. This requires that one have an account with the necessary privileges on [RubyGems](https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg)
  1. As this creates a new `git tag` with the version as the tag name, this can be used to [draft and publish a release on GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release)
  1. Please notify any member of the Component Maintenance Interest Group, and we can assist by announcing the new release to the `#devs` Samvera Slack Channel and the [`samvera-tech` Google Group](https://groups.google.com/g/samvera-tech).
