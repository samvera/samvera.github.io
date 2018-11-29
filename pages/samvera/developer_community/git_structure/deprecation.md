---
title: Deprecation
permalink: deprecation.html
keywords: ['Deprecation', 'Gems', 'Maintenance']
last_updated: February 26, 2018
tags: [community]
summary: "Our process for the deprecation of legacy code"
folder: samvera/developer_community/git_structure/
sidebar: samvera_sidebar
toc: true
---
# Deprecation

The [`samvera-deprecated` github organization](https://github.com/samvera-deprecated) is the place for older gems, apps, and experiments that we no longer recommend deploying in production but that may be
useful for sample code or reference. This also might be where legacy code that
some organizations still use is kept, if it no longer meets criteria for community
maintenance or is no longer recommended for new adoption.

Just because a code repository has been deprecated does not mean it can't have
new development or new releases. It just means that we as a community cannot
commit to maintaining it and can't recommend it for new production use.

## Deprecation process from core

If a code repository in the core Samvera github:

1. no longer has three institutions using it

1. cannot be upgraded (which might mean no one is willing to upgrade it) to current
versions of core libraries

1. is not recommended for production use for some other reason

... any member of the community may nominate it for deprecation. However, the Core
Components Maintenance WG takes particular responsibility for keeping an eye on
what should be deprecated.

The process looks a lot like the promotion process:

1. Email the samvera-tech mailing list saying what code repository you think should
be deprecated and why. Ask whether three institutions can commit to maintaining
it and addressing any concerns (e.g., any unaddressed security issues). Provide a
date, at least 30 days later, by which these responses should be received.

2. If that date has been reached and no agreement has been reached, the code can
be moved to the samvera-deprecated organization. Please also send an email to all
Samvera lists documenting its move.

## Deprecation process from labs

Not everything that starts off in Samvera-labs is destined for production use.
Deprecating a project from labs should follow the same pattern as deprecation
from core, except that three institutions are not required to commit to
maintenance to keep something in labs. As long as someone is willing to take
ownership of the project it can stay in labs.
