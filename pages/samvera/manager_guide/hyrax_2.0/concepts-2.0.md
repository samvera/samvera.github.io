---
title: "Concepts and Definitions"
permalink: concepts-2.0.html
folder: samvera/manager_guide/concepts-2.0.md
sidebar: home_sidebar
a-z: ['manager_guide', 'user_guide']
keywords: hyrax administration, glossary
tags: [user_resources]
categories:
version:
  id: 'hyrax_2.0-master'
  versions:  
  - label: 'Hyrax 1.0'
    link:  'concepts-1.0.html'
  - label: 'Hyrax 2.0'
    link:  'concepts-2.0.html'
    selected: 'true'
---

*This Guide is maintained by Samvera's [Repository Management Interest Group](https://wiki.duraspace.org/display/samvera/Repository+Management+Interest+Group). Screenshots are taken from [Nurax](https://nurax.curationexperts.com/), a testing repository running on the latest release of Hyrax. Hosting is generously provided by [Data Curation Experts](https://curationexperts.com/). Please open an issue on our [GitHub repository](https://github.com/samvera/samvera.github.io) to request edits or additions.*

## Administrative Set
An Administrative Set is a top-level grouping of Works that is managed by a user with administrative privileges, such as reviewing deposited Works before they are made accessible. Unlike Collections, Administrative Sets are not discoverable by searching or browsing the catalog. They are intended to provide repository administrators the ability to apply a workflow, define behaviors, and apply policies on a set of works. Only repository administrators can create an administrative set, but they can designate any user to have management or edit access to an administrative set. All works must belong to one, and only, one Admin Set. Example: Electronic Dissertations and Theses.

## Collection
A thematic grouping of works or collections. Any user in the system can create a Collection. Collections can be visible publicly or kept private. Collections can have a dedicated thumbnail and be shared among repository users with defined access levels: view/download or edit. Only users with access to a collection can add Works to it. Example: Professor creates a collection of Works related to her funded research project.

## Mediated deposit
The group of steps necessary for reviewing a deposited work, culminating in approval before publishing it for public viewing. Commonly used in the context of collecting Electronic Theses and Dissertations or staff-facing metadata workflows for digital collections.

## Participants
Participants for Administrative Sets allow the repository manager to define what individual types of users can do with or to items in an Admin Set, such as deposit, approve, edit, or withdraw.

## Proxy
A user who can deposit works on behalf of another user. Example. Research Assistant deposits articles written by a Professor.

## Resource Type
A classification for content that is assigned to the Work by the depositor. Resource Types are discoverable via facet by default. Examples include: Article, Dataset, Image.

## Roles
**System Roles**

Repository Administrator is the only system-wide role that exists out of the box. Repository Administrators:
- Can see, edit, delete all works, collections, admin sets regardless of access controls and workflows on the objects.
- Only Repository Administrators can
  - create Administrative Sets
  - manage user roles system-wide
  - access the repository configuration settings

Registered User is any user that is logged into the repository.
Public User is anyone visiting the public contents of the repository.

**Collections & Administrative Set Participants**

In addition to system roles, there are collection-based and admin-set based roles, but these are limited to specific collections and sets and not across all content in the system. These include:
- Viewers, Depositors, Managers of an Administrative Set
- Editors and Viewers of a Collection
- Work Editors, Viewers
- Workflow reviewers

## Work
The basic content item in the repository. Works bring together file(s) and associated metadata and presents them as one intellectual object. Example: A single dissertation (PDF and descriptive information) or a dataset containing multiple files (spreadsheets, images, text files and descriptive information).

## Workflows
Workflows can be used in conjunction with and Admin Set to dictate the process by which a work is submitted, reviewed, and published. For example, Senior Honors Theses need to be reviewed and approved by advisors before becoming available to the general public in the repository.

## Work Ownership
Works are usually owned by the user who makes the deposit, unless that user is a Proxy for another user. Work ownership can be transferred between current users of the system.

## Work Type
A classification tool for the submission of distinct types of works. Custom work types can be generated to allow different descriptive metadata to be collected as appropriate for the classification. Work Types are discoverable via facet by default. Examples include: Publication, Dataset, Image.
