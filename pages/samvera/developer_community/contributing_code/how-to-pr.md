---
title: "How to Submit Pull Requests"
permalink: how-to-pr.html
keywords: ["Samvera", "Community", "Pull Request", "PR", "Github"]
folder: samvera/developer_community/contributing_code/
---
## How do I contribute my changes to the project?

Generally speaking, we follow the guidelines / recommendations in [Samvera Technical On-Boarding](https://github.com/escowles/technical-onboarding/blob/master/code.md) regarding both Code Guidelines and Code Reviews.

Create a pull request in GitHub. We recommend creating one as early as you are comfortable doing so, as it allows others to begin to give feedback/suggestions on your work.  If your work is still "in progress", please prefix the PR's name with [WIP]. That way others know it's not complete, but feedback is welcome.

You may choose to create the PR from either a branch within your own fork of the project, or alternatively create a new branch in the main project (the latter would let others contribute to your PR more easily, as needed).

Before pushing any new commits to your pull request, you may wish to do the following:

  * Run rubocop to verify the well-formedness of your Ruby code
  * Please ensure your new code comes with RSpec tests (as code coverage will be auto-verified by Coveralls when you update your PR), and that all tests currently pass (see "How do I run the test suite..." above).
  * Once you finish your work, we recommend squashing all changes down to a single commit. You are welcome to keep commits separate while you are still working though, if it's easier.
  * If any of your PR changes depend on brand new gems, then you will need to ensure your Gemfile.lock gets updated in the codebase. This file controls the version of all gems (including Hyrax) that are currently in use.
  * Just run bundle update AND commit the changes made to your local Gemfile.lock

        NOTE: if you forget to update the Gemfile.lock file in your PR, then the CI service will not pick up the latest versions of Hyrax, and therefore may throw unexpected errors.

    Once your PR is ready for review, remove the [WIP] prefix from your PRs name and ping the development team (on Slack or GitHub).

    You are encouraged to ask for early review while your work is still in progress especially if you haven't had discussed the technical design of the work you're doing. Other developers may have hints/tips on easier ways to achieve your goal, or help note improvements that may be necessary before the PR can be merged.
