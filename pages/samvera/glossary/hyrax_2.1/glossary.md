---
title: "Glossary of Terms"
permalink: glossary-2.1.html
keywords: ["Glossary", "Terms"]
version:
  id: hyrax_2.1-stable
  label: 'Hyrax v2.1 (also applies to Hyrax v2.0.x)'
sidebar: home_sidebar
toc: false
---

## Administrative Set
An Administrative Set is a top-level grouping of Works that is managed by a user with administrative privileges, such as reviewing deposited Works before they are made accessible. Unlike Collections, Administrative Sets are not discoverable by searching or browsing the catalog. They are intended to provide repository administrators the ability to apply a workflow, define behaviors, and apply policies on a set of works. Only repository administrators can create an administrative set, but they can designate any user to have management or edit access to an administrative set. All works must belong to one, and only, one Admin Set. Example: Electronic Dissertations and Theses. ([more information...](admin-sets-as-collections-faq.html))

## Child Work
The lower-level work in a work-to-work relationship. Children can have one or more parent works. The same work can be a parent and a child.

## Collection
A thematic grouping of works or collections. Any user in the system can create a Collection. Collections can be visible publicly or kept private. Collections can have a dedicated thumbnail and be shared among repository users with defined access levels: view/download or edit. Only users with access to a collection can add Works to it. Example: Professor creates a collection of Works related to her funded research project. ([more information...](collection-overview.html))

## Collection Type
Collection Types provide a means for configuring behavior of collections within a site.  The functionality that can be switched on/off are [nesting](collection-nesting-faq.html), [sharing](collection-sharing.html), [discovery](collection-discovery-faq.html), multiple-membership, and branding.  Once collections of a type have been created, these configurations can no longer be changed.  A site may want to create several collection types (e.g. exhibits and user collections).  ([more information...](collection-types.html))

## Fileset
The container representing a single file uploaded to the repository. It is a set that holds the original uploaded file and any generated derivative files (e.g. thumbnails, full text, etc.).

## Groups
Groups of users, controlled by administrators.  Groups can be assigned as Participants for Collection Types and Admin Sets and given Sharing roles for Collections and Works.  

See also [Setting groups vs. users as participants](collection-sharing.html#setting-groups-vs-users-as-participants).

## Mediated deposit
The group of steps necessary for reviewing a deposited work, culminating in approval before publishing it for public viewing. Commonly used in the context of collecting Electronic Theses and Dissertations or staff-facing metadata workflows for digital collections.

## Participants
Participants for Administrative Sets allow the repository manager to define what individual users or groups of users can do with or to items in an Admin Set, such as deposit, approve, edit, or withdraw.

Participants for Collection Types allow the repository manager to define which individual users or groups of users can have roles related to collections of a type.  A manager is given full edit access to collections of this type.  A creator is allowed to create new collections of this type.  ([more information...](collection-type-participants.html))

See also [Sharing](#sharing) which describes roles for Collections and Works.<br>
See also [Setting groups vs. users as participants](collection-sharing.html#setting-groups-vs-users-as-participants).

**Permission Templates**
A template that defines the Visibility, Release, Workflow, and Participants for an Admin Set or Collection.  The template is applied to works when the work is created.  The template is created through the UI when an Admin Set or Collection is created or edited.  Permission Templates are applied to works when the item is created.  Changes to the template are not applied to existing works and will only effect new works created after the change.

**Collection Type Templates**
A template that defines the Participants for Collection based on it's Collection Type.  The template is applied to collections when the collection is created.  The template is created through the UI when a Collection Type is created or edited.  Collection Type Templates are applied to collections when the item is created.  Changes to the template are not applied to existing collections and will only effect new collections created after the change.

## Mediated Deposit Workflow
The group of steps necessary for reviewing an ingested item and its metadata, culminating in approval before publishing it for public viewing.  ([more information...](https://github.com/samvera/sufia/wiki/Mediated-Deposit-Workflow))

## Parent Work
The higher-level work in a work-to-work relationship where there is at least one child work relationship established. Parents can have one or more child works. The same work can be a parent and a child.

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

**Repository Object Roles** (e.g. Collection Type, Collection, Administrative Set, and Work Roles)

In addition to system roles, there are Collection Type based, Collection based, Admin Set based, and Work based roles, but these are limited to specific items in the repository and not across all content in the system. These include:
- Manager and Creators of a Collection Type ([Participants](#participants))
- Viewers, Depositors, Managers of an Administrative Set ([Participants](#participants))
- Viewers, Depositors, Managers of a Collection ([Sharing](#sharing))
- Work Editors, Viewers ([Sharing](#sharing))

**Workflow Roles**

Roles that a user or group of users can perform in a workflow.  These define the functions a person performs during a step in a workflow.
- creating work
- approving work

See also [Medidated Deposit Workflow](#mediated-deposit-workflow)

## Sharing
Sharing roles for Collections allow editors of the collection to share responsibility of the collection with individual users or groups of users.  Managers are given full edit access to the collection.  Depositors can add resources to the collection.  And viewers can see the collection even when it is private.  These roles can optionally be applied to works created in the collection.  ([more information...](collection-sharing.html))

Works can be shared giving individual users or groups of users edit access or read access.  Edit access give the users full editing access to the work.  Read access allows users to view the work even when it is private.

See also [Participants](#participants) which describes roles for Collections and Works.<br>
See also [Setting groups vs. users as participants](collection-sharing.html#setting-groups-vs-users-as-participants).

## Work
The basic content item in the repository. Works bring together file(s) and associated metadata and presents them as one intellectual object. Example: A single dissertation (PDF and descriptive information) or a dataset containing multiple files (spreadsheets, images, text files and descriptive information).

## Workflows
Workflows can be used in conjunction with and Admin Set to dictate the process by which a work is submitted, reviewed, and published. For example, Senior Honors Theses need to be reviewed and approved by advisors before becoming available to the general public in the repository.  Two workflows come predefined.  The first immediately saves the work as complete.  The other is a [Mediated Deposit](#mediated-deposit-workflow) workflow requiring review.

## Work Ownership
Works are usually owned by the user who makes the deposit, unless that user is a Proxy for another user. Work ownership can be transferred between current users of the system.

## Work Type
A classification tool for the submission of distinct types of works. Custom work types can be generated to allow different descriptive metadata to be collected as appropriate for the classification. Work Types are discoverable via facet by default. Examples include: Publication, Dataset, Image.  Work types are also known as Curation Concerns.
