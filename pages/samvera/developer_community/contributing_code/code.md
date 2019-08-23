---
title: Code Guidelines
permalink: code.html
keywords: ["Code", "Guidelines", "Style"]
last_updated: March 30, 2017
folder: samvera/developer_community/contributing_code/
---

# Code Guidelines

## GitHub workflow, forking and cloning

To start working on a Samvera codebase quickly, you may wish to fork it to your own organization and then clone it locally. This will allow you to push your work up for review and for pull requests. The advantage of forking existing codebases is that you can do so without asking anyone and get started quickly. The disadvantage is that there's a risk of writing code that only lives in your fork, which -- if you wind up running this in production, or pointing other production code at your fork -- is a surefire way to make your work difficult to upgrade.

You will probably want to request access to push your work directly to Samvera codebases (see [formalities](formalities.md)).

## Making changes

To start, make sure you have the latest commits from the upstream codebase's default branch (which is usually the `master` branch). Then create a new topic or feature branch for the work you'll be doing. In practice, it doesn't much matter what you name this branch -- some name it based on a brief description of the changes they will be making, and some include the issue number, but neither of these are ever included in the code review process. Do not work directly on the `master` branch, which is a protected branch.

As you start working on your contribution, feel free to make commits as often as makes sense to you since no one will see these until you push your code up to GitHub; there will be an opportunity later to squash your commits and make sure your commit message is written succinctly and with sufficient detail. (Your commit message will be pulled in as the default description of your PR, so investing some time in writing a [high-quality commit message](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) will help you, and code reviewers, later.)

We also recommend writing tests early and running them often, making small commits as you go. This gives you frequent checkpoints to make sure you do not dig yourself into a deep hole or become bogged down towards the end of working on your changes.

## Testing and test coverage

Many developers in the Samvera community practice [test-driven development](https://en.wikipedia.org/wiki/Test-driven_development), and you will notice as you begin submitting pull requests that the common code review process requires that you cover all code changes with tests; this is equally true of bugfixes, features, and refactoring changes.

We tend to use RSpec as our testing tool of choice, with Capybara for feature tests, and our tests tend to conform to [community-driven testing guidelines](http://betterspecs.org/). All of our codebases on GitHub integrate with the CircleCI or Travis continuous integration services, which allows reviewers to see if changes made in pull requests have a passing test suite. We also tend to use Coveralls to determine whether the proposed changes have increased or decreased overall code coverage.

## Style guidelines

The Samvera community uses a somewhat modified version of the default Ruby style conventions provided by the Rubocop tool. If your pull request contains style violations, continuous integration builds will fail quickly and your work will be in an unmergeable state.

Fortunately, it's very easy (and fast) to check this in your development environment. Run the `rubocop` command to see if your changes pass muster. If they do not, Rubocop also supports an auto-fix flag for some violations. To do this, run `rubocop -a` -- but we recommend committing your changes first, because though this seldom happens, Rubocop can sometimes "fix" your code into a state that causes tests to fail. (Don't worry about having to commit earlier, or more, than you intended; you can always squash your commits later.)

## Pull request size and shape

We have found over the years that it is best when pull requests are small; targeted at a specific issue; and pushed up quickly for review.

Keep pull requests small, where possible. Changes to the codebase that surpass roughly 400 lines at a time become difficult to review, which can limit the number of code reviewers and can delay your pull request getting merged. This also causes the developer some pain, because the longer a contribution sits off in a branch, the more times it will need to be rebased on the master branch which means your test suite may start failing, you may have merge conflicts to deal with, and so forth.

Keep pull requests targeted. For instance, if you're fixing a bug, do not introduce a new feature or fix another bug. Only commit to a refactoring if you can do it while keeping the PR small and without touching parts of the codebase unrelated to your bug. If you are inclined to add one or more refactorings to a PR, you may also want to consult with other Samvera developers (see [communication guidelines(communication.md)) in advance of doing so.

Push branches up quickly for review. We have found that work sitting in unpushed branches for longer than a day or so is likely to cause frustration. It is better for the author of the code, and the reviewers of the code, to see it sooner so there's time to provide feedback before a large commitment is made. If you are choosing between copying/pasting code to a snippet site like [Gist](http://gist.github.com/) and pushing your branch, please push your branch; it allows developers to review your code in the context of the codebase with its commit history.

As you assign yourself to issues, if you find that the code you're writing will be difficult to keep small, stay targeted, or push quickly, you have well have picked up an issue that is too large and that needs decomposition. Please talk to fellow Samvera developers, or the codebase's product owner if it has a clear owner, for advice about continuing.

## Submitting changes

When you are satisfied that the code you have written adequately addresses the issue you're working on, and your test suite covers your changes and is green, it's time to prepare your changes for a pull request. We recommend that you [squash all of your commits down into a single commit](http://ndlib.github.io/practices/one-commit-per-pull-request/).

Next, you'll want to check that your branch is up to date with its parent branch (likely to be `master`); if you kept your PR small and targeted, you will find that this isn't a difficult process. Make sure your code conforms to style guidelines and your test suite is green, and then push your branch and create a pull request.

## Additional resources

The [Samvera Camp Resources List](https://docs.google.com/document/d/1wnpJBS-Q9Yswp7r2fGfzvOzjjz0C971INU3pDfgZd8k/edit#heading=h.avateqba3goc)
has links to lots of good resources on general Ruby information, IDEs, data models, example Samvera
apps, etc.
