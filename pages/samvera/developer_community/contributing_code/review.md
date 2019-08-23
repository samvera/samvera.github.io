---
title: Code Review
permalink: review.html
keywords: ["Code", "Review", "PR", "Pull Request"]
last_updated: March 30, 2017
folder: samvera/developer_community/contributing_code/
tags: [getting_started, community]
summary: "Procedure for adding code to a community repository"
---
# Code review

## When Submitting a Pull Request

When you have code ready to be reviewed, and it meets the [code guidelines](code.md), open a pull
request to ask for it to be merged into the codebase.

To help make the review go smoothly, here are some general guidelines:
* Your pull request should address a single issue.
  * It's better to split large or complicated PRs into discrete steps if possible.  This makes
    review more manageable and reduces the risk of conflicts with other changes.
* Give your pull request a brief title, and use the description to provide key information:
  * Provide a list of the key changes
  * If your PR addresses an existing ticket, link to it with "Fixes #123".  This will make it easy
    to refer back to the original ticket and automatically close it when the PR is merged.
  * If you've discussed the issue, or just want to alert someone to your PR, tag them by including
    their @username.
  * Link to relevant resources, such as Wiki pages, mailing list threads, specifications, or other
    tickets.  This makes it easier to understand the full context of your PR.
* Please be patient.  Your PR may not be reviewed right away, since the people doing code review
  are often busy, and may be traveling, in a different time zone, or otherwise not available to
  review your code immediately.
  * Especially if it's blocking other work, it's fine to ask someone to review, either by tagging
    them in a comment or asking on [Slack](communication.md#slack) or at the [weekly tech call](communication.md#tech-call).
* Respond to code review comments, with discussion where it's appropriate or by pushing additional
  commits to the branch.  They will be added to the same PR automatically.
* If another PR is merged and conflicts with your changes, you may need to rebase your PR.
  * See [GitHub's rebasing documentation](https://help.github.com/articles/about-git-rebase/) and
    [One Commit Per Pull Request](http://ndlib.github.io/practices/one-commit-per-pull-request/)
    for more information on rebasing.

## When Reviewing a Pull Request

Pull requests are evaluated in many different ways; fortunately, we have tools to help us with code
review so that human review can focus on overall code quality and maintainability. For instance, we
use:

* A continous integration (CI) service, to ensure the test suite is passing (typically CircleCI or Travis)
* Rubocop, to be consistent w/ a baseline of Ruby style conventions
* Coveralls, to ensure code changes are covered by test changes
* Hound, to be consistent w/ Javascript and CSS style conventions
* CodeClimate, to flag obvious code smells early for remediation

When reviewing a pull request, please take the time to review the changes and get a sense of what
is being changed.

The key things to focus on are:

* Are the PR description and commit messages clear?
* Do the functional code changes match the PR description?
* Does the PR contain tests for new features or bugfixes?
  * Not all PRs require tests, such as wording changes or simple refactoring.
* Does the commit contain more than it should? Are two separate concerns being addressed in one
  commit?

As a reviewer, it's also your responsibility to make sure:

* Does the submitter have a signed CLA [on file](https://wiki.duraspace.org/display/samvera/CLA+submission+list)?
* Did the CI tests complete successfully?
* Is there a significant drop in code coverage?
* Do all new or changed methods, modules, and classes have comments?

## Merging Pull Requests

When merging pull requests:

* Give discussion time to settle down.  When there is a contentious discussion, please allow 24
  hours before merging to make sure everyone's had a chance to respond.
* It is considered "poor form" to merge your own request, and you should be cautious when merging
  pull requests from other developers at your own insitution.
* If you are uncertain, bring other contributors into the conversation by creating a comment that
  includes their @username.
* If you like the pull request, but want others to chime in, create a +1 comment and tag a user.
