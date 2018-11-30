---
title: How to Coordinate Testing for a Release
keywords: ['Testing', 'Release', 'Community']
last_updated: March 30, 2017
sidebar: samvera_sidebar
permalink: release_testing.html
folder: samvera/developer_community/releases/
---

Each release will have a release testing coordinator, usually the QA specialist from the [Hyrax Working Group](https://wiki.duraspace.org/display/samvera/Hyrax+Working+Group). This person can vary from release to release. They will work closely with the Hyrax Tech Lead and Product Owner. Follow the newly-defined process outlined in [Hyrax Testing and Release Process](/release_process.html). As this is a new process, you may find that some sections need adjustment or more detail.

### PR testing:

The Hyrax [Pull Request Template](https://github.com/samvera/hyrax/blob/master/.github/PULL_REQUEST_TEMPLATE.md) asks for guidance on QA testing. To the extent possible, pull requests will undergo QA testing from the QA Specialist _in addition to_ code review by the [Hyrax code reviewers](https://github.com/orgs/samvera/teams/hyrax-code-reviewers). The QA Specialist will either use [NURAX-DEV](https://nurax-dev.curationexperts.com) or a local instance of Hyrax for testing pull requests.


### When release is ready:

  - **Figure out what needs to be tested**

    When a release is ready there will be a list of commits that have been merged since the last release. You may or may not understand the implications of these changes for testing. The tech lead (or others) will be able to help you determine what needs to be tested. In some cases, large community efforts like a shared sprint, may have a person to document how features are supposed to work.

    Here are some common situations to consider:

    Is this a major, minor, or patch release? For major releases we test all the features we can on Nurax across browsers and platforms as well as testing for accessibility. Minor release process is in flux and will likely be determined on a case by case basis. Patch releases will usually happen without your involvement.

    Are there changes to the UI?

    UI updates should have cross browser, platform and accessibility testing. This is not necessary for minor changes like text updates, but does the page look totally different to you? It should be tested!

    Are there updates to core gems that may potential affect certain tasks (like searching, access controls, etc)?

    You will need to work closely with a developer to figure this out. Generally, it would be ideal to do a single browser test of the entire spreadsheet but in some cases this may not be needed.

  - **Make sure Nurax is updated with the release**

    You will hopefully have one or two people that can help get the release on Nurax. Once Nurax is up to date, update the announcement text so people who may be checking out Hyrax (or documenters) know what they are seeing.

  - **Conduct a preliminary test on Nurax**

    Conduct some basic testing to ensure there are not any major problems. (log in, submit a work, edit a work, test the new feature). At this stage you are trying to make sure the release is ready to be tested by the rest of the testing team. You don't want to call on your team to get ready to test if there are major blockers that prohibit testing, for example. This is also a time to work with the PO to make sure new features seem ready to release (user acceptance testing). Any problems you see, document by added issue in Nurax Github and working directly with your Nurax point person or tech lead depending on the release.

  - **Create a testing spreadsheet**

    Create a release version of the testing template spreadsheet and update the spreadsheet with what needs to be tested for each release. Ideally you will run through any new tests before sharing with a larger group. You may have 5 versions of the spreadsheet filled out depending on how many beta and release candidates are in the cycle. You will name them specifically for the release. For example an RC 2 would be called: "Hyrax_2.0.0_testing_spreadsheet_RC2"

    Some common things you will need to consider when creating the spreadsheet:

    1. Browsers/platforms
    2. Accessibility
    3. Update an existing tests if any features change
    4. Add new tests for new feature sets
    5. Remove tests that are not needed

  - **PIN the testing template to the #nurax channel on slack**

    Right now we aren't posting the URL for the template on this page since it needs to be open.

  - **Identify testers**

    Put a call out to find people to help you test and add their initials to the tasks in first page of the testing spreadsheet. This could be between 3-10 people depending on the size and scope of the release. You want to try to give them a timeline and a target due date. Most testers are busy but able to help out with some notice. Accessibility is particularly tricky to schedule because of limited number of testers, complexity of the test, and timing of the testing. Some places to find testers: repo-managers, UX (accessibility). Please note: the tests will range various roles in the system, some may only be conducted by those with repo-admin status on Nurax. You will need to update the .yml file for anyone who needs this and a deploy to the server will be needed (this should be automatic, but ask your Nurax Helpers if needed).

    Ask your testers to join the #nurax channel on github - this is where they may communicate with other testers and helpers who may be able to resolve bugs and system issues. Some helpers may say "Restarting Nurax, any problems with that?"

- **Conducting testing**

  - Document who is going to test what on the first sheet of the testing spreadsheet. You may want to coordinate a quick call to make sure people are on the same page. Repeat testers will know the drill.

  - Give testers a heads up on the process and make sure you communicate when you'd like testing done by. Even a couple hours of someone's time will be very helpful!

  - Try not to help people too much, you want to make sure people are going to uncover issues and you might 'know exactly how to do something'. Testers are capturing their problems so we can surface issues. They can comment directly in the spreadsheet.

  - Also, try not to assign yourself any tests if possible - you will be very busy during this phase verifying bugs, triaging tickets and helping testers.

  - **Accessibility testing**

    - The timing of accessibility testing is important, because you want to make sure you balance a well-working system (no major bugs) and giving time for testers to do their work. These tests are specialized and need people who have an understanding of what to test and how to determine what pass/fail looks like.

  - **Admin set issues**

    - Because Hyrax deposits to the last admin set created, you've got to really make sure the test specify what admin set to use depending on what you are testing for. Since part of testing is creating new admin sets (with various settings), you will never really know what is going on with the settings on release, visibility, and mediation there will be. "Default Admin Set" should have no restrictions and can be used for general tests.

  - **Repository Admin testing**

    - With the "flippable" features, the Repository Administration test must make sure 1) they announce on Nurax before they test (since they will be turning features on and off) and 2) they return settings to the original settings.

- **Bug reports/Triage Process**

  - Ask testers to report bugs directly in [the github issues](https://github.com/curationexperts/nurax/issues)
  - You will work very closely with PO/Tech lead to label, verify, and close issues related to bugs. You may meet 1 time a week to go through issues.
  - One approach you can take is: Verify each bug and give it an appropriate label. Coordinate with PO/Tech Lead to move "must fix" issues to Hyrax Issues.
  - Once bugs are fixed, code must be updated on Nurax, you must retest on Nurax.
  - Close Nurax Issues, once bug is confirmed fixed on Nurax.

- **How do you know when the release is "done"?**

  - This will be determined by the PO and Technical Lead signing off that all blocker issues are successfully resolved.
  - In addition, you will want to help make sure the targets are ready for documentation mentioned here.  Although you are not responsible for creating documentation, it's helpful for you to communicate when testing.

- **Stuff you can't test**

  There are few things you can't test, like "real time notification" or any email notification feature (like contact us forms!). This is because Nurax is does not have a SMTP server set up and has a particular configuration that might affect your ability to test everything. This is okay, please note anything that you can not test.
