---
title: Hyrax Testing and Release Process
a-z: [Testing, Release Process, Managers, Product Owners]
last_updated: February 5, 2018
tags: [release, community]
sidebar: samvera_sidebar
permalink: release_process.html
folder: samvera
toc: false
---
<br />

The [Repository Managers Interest Group](https://wiki.duraspace.org/display/samvera/Repository+Management+Interest+Group) will work with the Hyrax PO to test and document features for Hyrax releases. For each release cycle, there will be at least one designated person from the Repo-Managers to facilitate the process. [Instructions for conducting release testing can be found here](/release_testing.html) (in progress).

For each cycle the Release Testing facilitator will:

- Communicate with testers and demo site committers about timing of upcoming release.
- Ensure the Managers Guide, UI Interactions, Test Tracking Spreadsheet and demo site are up to date for the process of testing and documentation.
- Recruit help with testing, bug reporting and documentation.
- Ensure testing and documentation is complete.


This testing process complements test coverage and regression testing in the code but does not replace it. This testing is meant to facilitate browser, platform, feature, (basic) usability and completion, and accessibility.

### Major release process:
**Beta Release:** All major features are complete. 2-3 weeks

- Beta release on demo site

- Testing for user acceptance and general readiness for systematic testing (no major issues identified that would impede testing).

- Beta release is announced

- First draft of documentation is done

- First round of testing and bug reporting begins

- Institutions have a chance to report bugs or ask for a PR to be considered for inclusion in release

**Release Candidate:** Feature Freeze and bug fixes only. 2-3 weeks (may be unrealistic time frame?)

- RC goes to demo site

- RC is announced

- Finalize feature documentation by end of phase

- Finalize testing document by end of phase

- Distributed testing of all features, supported browsers, accessibility testing.

- Report bugs

- Confirm bugs (PO?) and determine priority (need to establish process for this)

- Fix all priority bugs

- Repeat above with additional versions of RCx until release is confirmed stable.

**Final Release:**

- Once Final Release is ready, at least 1 in-production institutions should upgrade before wide release (This may not be doable, but would be good if there are institutions willing to do this, could rotate and plan ahead to help curb)

- Make sure to update the README if the release requires any new system dependencies or startup steps.

- Update the [Hyrax Feature Matrix](https://github.com/samvera/hyrax/wiki/Feature-matrix)

- Final Release is announced widely

### Minor release process:

- Follows the Major release process on a much more compressed timeline.

- Upgrade demo site, retaining data. In the occasion that data needs to be wiped for whatever reason, this is fine. Mostly we want to test that data and users migrate smoothly.  

### Hyrax Shared Testing Tools:

**Demo site:** shared testing and demo instance of Hyrax. Vanilla app with all "bonus" features configured for testing.

  - https://nurax.curationexperts.com hosted by DCE
  - Github repo: https://github.com/curationexperts/nurax/
  - Maintained and updated by committers in DCE and Samvera Community

**Hyrax Manager Guide:** describes features, set up and concepts for Hyrax repositories

 - [http://samvera.github.io/](http://samvera.github.io/) ('Manager Guide' in side navigation)
 - Maintained and updated by the [Repository Management Interest Group](https://wiki.duraspace.org/display/samvera/Repository+Management+Interest+Group) ask Chris Diaz for more information.

**Hyrax test tracking document:** google doc that helps us track what is tested (including browsers and accessibility) for each release.

-  <this will be shared on the #nurax slack each release> contact Julie Rudder for help.
- Maintained and updated by the [Repository Management Interest Group](https://wiki.duraspace.org/display/samvera/Repository+Management+Interest+Group)


**Testing list will include the following:**

- All features (including "bonus" features that require configuration)
- Browsers ([browser version popularity](http://caniuse.com/usage-table))

  - Chrome on Windows
  - Chrome on Mac OS X
  - Chrome on Android (for public interactions) (most popular android versions)
  - Safari on iPhone (for public interactions)
  - Firefox and Safari should be added (for public interactions?)

- Accessibility

  - Use [http://wave.webaim.org/](http://wave.webaim.org/) (any browser?)
  - Use Firefox for [NVDA testing](http://nvaccess.org) with a screen reading. Either Windows or Mac
