---
title: "Coding Style with RuboCop"
permalink: best-practices-coding-styles.html
keywords: ['Code', 'Rubocop', 'Best Practices']
last_updated:
sidebar: home_sidebar
---

# Importance of Consistent Coding Styles

Coding styles are controlled by RuboCop which performs a number of style related checks on the code.  The code may run fine and pass tests while not being style compliant, but compliance with the configured style makes code easier to read and maintain.  The continuous integration (CI) service for Hyrax and many other Samvera gems is configured to fail if RuboCop detects errors.  It is recommneded that you configure CI to fail for RuboCop errors in your Samvera based apps.

# What is RuboCop

RuboCop is a Ruby static code analyzer.  The validations that RuboCop makes are configurable.

## Recommended Configuration

The recommended configuration of RuboCop for the Samvera community can be included in your app by installing the [Bixby gem](https://github.com/samvera-labs/bixby).  You can see the default configuration setup by Bixby in these three files:  [bixby_default.yml](https://github.com/samvera-labs/bixby/blob/master/bixby_default.yml), [bixby_rails_enabled.yml](https://github.com/samvera-labs/bixby/blob/master/bixby_rails_enabled.yml), [bixby_rspec_enabled.yml](https://github.com/samvera-labs/bixby/blob/master/bixby_rspec_enabled.yml).

You can include the default bixby RuboCop configuration by adding the following to the top of your app's `.rubocop.yml` file.

```
inherit_gem:
  bixby: bixby_default.yml
```

## Customizing the Configuration

You can override any configuration provided by Bixby in your app's `.rubycop.yml` file.  See the List of Cops and Configuration documentation in the References list below.  Also, see the Bixby gem files listed above to see examples in use.

**References:**

* [RuboCop Code](https://github.com/bbatsov/rubocop)
* [RuboCop Documentation](http://rubocop.readthedocs.io/en/latest/)
* [RuboCop Configuration](http://rubocop.readthedocs.io/en/latest/configuration/)
* [RuboCop List of Cops](http://rubocop.readthedocs.io/en/latest/cops/)

## Running RuboCop

Validate all files:
```
rubocop
```

Validate a specific file:
```
rubocop path/to/your/file
```

## Autocorrect problems

If RuboCop finds style violations, you can ask it to try automatically fixing them.

<ul class='warning'><li>We recommend committing all work prior to running this command as sometimes RuboCop will create breaking changes.</li></ul>

Auto-fix all files:
```
rubocop -a
```


## Ignoring errors

<ul class='info'><li>It is recommended that all errors reported by RuboCop be fixed.</li></ul>

But there are situations when this is not possible.  In those cases, the following recommendations apply.  These should be applied in priority order with the first being the preferred method.

1. If the error applies to anything smaller than the full class or module, use inline comments to ignore the error. [Disabling Cops within Source Code](http://rubocop.readthedocs.io/en/latest/configuration/#disabling-cops-within-source-code).
1. Put class or module level error exceptions in .rubocop.todo.yml. [Including/Excluding files](http://rubocop.readthedocs.io/en/latest/configuration/#includingexcluding-files)
1. Only if you are sure the error will never be fixed should the exception go in .rubocop.yml.  The syntax for excluding files is the same for .rubocop.todo.yml and rubodo.yml.


Although the documentation about Including/Excluding files shows how to exclude multiple files, you should exclude only one file at a time.  The only exception to this might be during initial setup of RuboCop where specific directories may contain files that are not ruby.  Excluding entire directories is rare.
