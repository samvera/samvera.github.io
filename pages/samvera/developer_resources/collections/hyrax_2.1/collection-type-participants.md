---
title: "Understanding Collection Type Participants"
permalink: collection-type-participants.html
keywords: ["Participant", "Collection Type", "Sharing", "Collection"]
last_updated:
version:
  id: hyrax_2.1-stable
sidebar: home_sidebar
---

NOTE: Only admins can create, edit, and delete collection types.  Participants set for a collection type effect how users can interact with collections of this type.

## How to set participants for a collection type?

* Dashboard -> Settings -> Collection Types
* Click Edit beside the collection type you want to update
* Select Participants tab
* Search for user/group
* Set access level to Manager or Creator
* Click Add button

## Participant Roles

### Manager

**Description:**

Managers for a collection type can edit collections other users created, including adding to and removing works from a collection, modifying collection metadata, and deleting collections, only for collections of the type they manage.

**Default:**  Repository Administrators

**Implementation:**

* When a manager is added, an entry is added to the database via `Hyrax::CollectionTypeParticipant` granting the user/group `:manage` access.
* When a manager is removed, the entry added by `Hyrax::CollectionTypeParticipant` is removed from the database for this manager.
* When the create new collection process is initiated, the user is allowed to create collections of types for which they have manage access.
* When a collection is created of a type, each collection type manager is made a manager of the collection which grants them `edit_access` to the new collection regardless of which user creates the collection.  This `edit_access` grant is what grants managers the abilities to edit the collection, collection items, and metadata.

**Special Note on Admin Sets:**
* Admin Set collection type is pre-defined and has default managers assigned.
* **Default:**  Repository Administrators
* A site can assign managers to the Admin Set collection type.  This grants them `:manage` access to admin sets created after they became a manager.  At the collection type level, assigning managers to an admin set collection type has the same effect as for other collection types.

<ul class='warning'><li>Access to a collection is granted when the collection is created.  Changes to managers after a collection is created do not change the access grants of the collection.  See also <a href="collection-sharing.html#setting-groups-vs-users-as-participants">Setting groups vs. users as participants</a>.</li></ul>

### Creator

**Description:**

Creators for a collection type can create collections of this type.  They are given manage access only to collections they create.

**Default:**  Registered Users (i.e., users that have logged into the system)

**Implementation:**

* When a creator is added, an entry is added to the database via `Hyrax::CollectionTypeParticipant` granting the user/group `:create` access.
* When a creator is removed, the entry added by `Hyrax::CollectionTypeParticipant` is removed from the database for this creator.
* When the create new collection process is initiated, the user is allowed to create collections of types for which they have create access.
* When a collection type creator creates a new collection, the creator is made a manager of only that collection which grants them `edit_access` to the new collection as the creator of the collection.

**Special Note on Admin Sets:**
* A site can set creators of Admin Set collection type, which gives these creators the ability to create new admin sets.

### Configuring collection sharing

The collection type edit form has a Settings tab which can be used to control whether collections of that type can be shared. The settings that control sharing are:

![-- SHARING and APPLY TO NEW WORKS settings](images\screenshots\collection-types-sharing-settings.png)

If `SHARING` is checked, then collections of this type can be shared; otherwise, they can not.  Collections that can be shared have a Sharing tab in the collection edit form.

For backward compatibility, the `SHARING` setting has the additional `APPLY TO NEW WORKS` option that determines how participants are applied to works created directly in the collection.  

<ul class='info'><li>A <b>work is considered to be created directly in a collection</b> when the work is first created, if-and-only-if, there is one collection assigned to the work when the work is saved for the first time.</li></ul>

Sharing always controls access to the collection itself.  See [Understanding Collection Sharing](collection-sharing.html#understanding-collection-sharing) for details.  The additional configuration determines whether access is granted to works as well.


This additional setting allows for backward compatibility for pre-defined collection types.

* User Collection type allows share permissions that apply to collections only and does not apply permissions to works.
* Admin Set type allows share permissions for the admin sets and applies the permissions to works created in the admin set.
