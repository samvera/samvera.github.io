---
title: "PR Checklist"
permalink: pr-checklist.html
keywords: ["Pull Request", "PR", "Checklist", "Review", "Issues" ]
last_updated:
folder: samvera/developer_community/contributing_code/
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
  - [ ] Unit tests: There are unit tests for new methods.
  - [ ] Feature tests:  There are tests that cover the functionality as it is used by end users in the UI.
  - [ ] Test efficiency: Tests use factorybot `build` instead of `create` where ever possible.  This is especially important for repository objects that cause the object to be created in Fedora.
  - [ ] Test coverage: Test coverage stayed the same or rose.  Review coveralls report for the PR.
  - [ ] The continous integration (CI) service completes without error.
- Backward compatibility
  - [ ] Public API: Public method signatures are not changed when going into a bug release or minor release.  These are ok for a major release, but should be an intentional change that is deemed necessary.
  - [ ] Public API: Requires unit tests exist that ensure correct behavior of new classes/modules/methods
  - [ ] Functional changes: The functional implementation of public methods are not changed for bug release and minor releases.  These are ok for a major release, but should be an intentional change that is deemed necessary.  A change in processing can be added to a method as long as the older approach continues to work with the older code having a deprecation warning.
  - [ ] Deprecation: Code that is targeted for removal in the next major release should have a deprecation warning.
  - [ ] Solr Migrations: Changes to the solr documents should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.
  - [ ] Fedora Migrations: Changes to the fedora objects should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.  
  - [ ] Database Migrations: Changes to the database should not happen for bug releases, should not be required for minor releases.  Are ok for major releases.
- Documentation
  - [ ] Yard Doc: Class, Module, and Method documentation is included.  Method documentation includes a description of the method's purpose, documentation of parameters' type and description, documentaiton of return value's type and description.
  - [ ] Community Documenation: For new features, documentation is added to the community documentation (samvera.github.io) to describe how to use the feature and technical details for understanding the implementation and potential customization path for the feature.  For changes to features, existing community documentation is updated.
  - [ ] QA Testing Documentation: Test descriptions for new features are added to the QA Test spread sheet.  Test descriptions for changed features are updated in the QA Test spread sheet.
