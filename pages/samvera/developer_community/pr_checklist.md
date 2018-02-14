---
title: "PR Checklist"
a-z: ["Pull Request", "PR", "PR Checklist", "Pull Request Checklist", "PR Review", "PR Creation" ]
keywords: PR, Pull Request
categories: Procedures
permalink: pr-checklist.html
folder: samvera/procedures/pr_checklist.md
sidebar: home_sidebar
tags: [procedures]
---

Checklist to use when creating and reviewing a PR.

- Legal
  - [ ] CLA:  The contributor has a valid CLA on file.
  - [ ] Reviewer: At least one of the reviewers is from an institution other than the contributor's institution.
- Code quality
  - [ ] Code: Changes seem reasonable and meet the expected behavior stated in the related issue.  Changes follow best practices for the community.
  - [ ] UI changes: Ad hoc testing of the expected behavior in the UI appears correct.  Expected behavior should be described in the related issue.
  - [ ] UI existing: Ad hoc testing of related features in the UI appear to continue to operate correctly.
  - [ ] Hound issues:  Hound issues are either fixed or comments identify why it doesn't need to be fixed.
  - [ ] Test: There are tests written for all changes and new functionality, including feature tests for regression behavior nd new behaviors.
  - [ ] Test efficiency: Tests use factorybot `build` instead of `create` where ever possible.  This is especially important for repository objects that cause the object to be created in Fedora.
  - [ ] Test coverage: Test coverage stayed the same or rose.  Review coveralls report for the PR.
  - [ ] Travis completes without error for continuous-integration/travis-ci/push.
  - [ ] Travis completes without error for continuous-integration/travis-ci/pr.
- Backward compatibility
  - [ ] Public API: Public method signatures are not changed when going into a bug release or minor release.  These are ok for a major release, but should be an intentional change that is deemed necessary.
  - [ ] Public API: Requires unit tests exist that ensure correct behavior of new classes/modules/methods
  - [ ] Solr Migrations: Changes to the solr documents should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.
  - [ ] Fedora Migrations: Changes to the fedora objects should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.  
  - [ ] Database Migrations: Changes to the database should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.
- Documentation
  - [ ] Yard Doc: Class, Module, and Method documentation is included.  Method documentation includes a description of the method's purpose, documentation of parameters' type and description, documentaiton of return value's type and description.
  - [ ] Community Documenation: For new features, documentation is added to the community documentation (samvera.github.io) to describe how to use the feature and technical details for understanding the implementation and potential customization path for the feature.  For changes to features, existing community documentation is updated.
  - [ ] QA Testing Documentation: Test descriptions for new features are added to the QA Test spread sheet.  Test descriptions for changed features are updated in the QA Test spread sheet.
