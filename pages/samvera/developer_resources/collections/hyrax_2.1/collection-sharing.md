---
title: "Understanding Collection Sharing"
permalink: collection-sharing.html
keywords: ["Participant", "Collection", "Sharing"]
last_updated:
version:
  id: hyrax_2.1-stable
sidebar: home_sidebar
---

## How to set participants for a collection?

* Dashboard -> Collections
* Click Edit collection in action menu beside the collection you want to update
* Select Sharing tab
* Search for user/group
* Set access level to Manager or Depositor or Viewer
* Click Add button

## Sharing Roles

### Manager

Managers of a collection can add to and remove works from the collection, modify collection metadata, and delete the collection.  If the collection type allows nesting of collections, the manager can also add and remove parent collections and subcollections.  If configured to set work permissions, the managers are given 'edit_access' to any work created directly in the collection.  See [Configuring collection sharing](collection-type-participants.html#configuring-collection-sharing) for more information.

**Default:**  user creating the collection and Collection Type managers for this collection's type

**Implementation:**

* When a manager is added
  * an entry is added to the database via `Hyrax::PermissionTemplateAccess` granting the user/group `:manage` access
  * `edit_access_group_ssim` or `edit_access_person_ssim` is set in the solr document
  * a `Hydra::AccessControls::Permission` is added in Fedora
* When a manager is removed
  * the entry added by `Hyrax::PermissionTemplateAccess` is removed from the database for this manager
  * `edit_access_group_ssim` or `edit_access_person_ssim` is updated to remove the group/user id from the solr document
  * the `Hydra::AccessControls::Permission` is removed from Fedora
* When the create new work actor stack is run, if this is the only collection assigned, then the work is considered to be created directly in the collection.  When a work is created directly in a collection AND the collection type is configured to apply permissions to new works
  * each manager is granted `edit_access` to the new work

<ul class='info'><li>A <b>work is considered to be created directly in a collection</b> when the work is first created, if-and-only-if, there is one collection assigned to the work when the work is saved for the first time.</li></ul>

Special Notes on Admin Sets:
* A site can set managers on an admin set, which grants them `:manage` access to that admin set.  This creates the solr edit access and Fedora AccessControl entries as well, same as for other collections.
* Admin set managers are given `edit_access` to a work at the time it is creating within the admin set.

<ul class='warning'><li>Access to a work is granted when the work is created.  Changes to managers after a work is created do not change the access grants of any existing works.  Work access grants can be updated in the work edit form to remove/add access for any group/user including those set by the collection.  See also <a href="#setting-groups-vs-users-as-participants">Setting groups vs. users as participants</a>.</li></ul>



### Depositor

Depositors of a collection can view the collection's admin show page and add works even if the visibility permissions of the collection otherwise would not permit them to view it.  If the collection type allows nesting of collections, the manager can also add parent collections and subcollections.

**Default:**  *assigned only, no defaults*

**Implementation:**

* When a depositor is added
  * an entry is added to the database via `Hyrax::PermissionTemplateAccess` granting the user/group `:deposit` access
* When a depositor is removed
  * the entry added by `Hyrax::PermissionTemplateAccess` is removed from the database for this depositor
* When the create new work actor stack is run, no special access is granted to depositors.


### Viewer

Viewers of a collection can add to and remove works from the collection, modify collection metadata, and delete the collection.  If configured to set work permissions, the viewers are given 'read_access' to any work created directly in the collection.  See [Configuring collection sharing](collection-type-participants.html#configuring-collection-sharing) for more information.

**Default:**  *assigned only, no defaults*

**Implementation:**

* When a viewer is added
  * an entry is added to the database via `Hyrax::PermissionTemplateAccess` granting the user/group `:view` access
  * `read_access_group_ssim` or `read_access_person_ssim` is set in the solr document
  * a `Hydra::AccessControls::Permission` is added in Fedora
* When a viewer is removed
  * the entry added by `Hyrax::PermissionTemplateAccess` is removed from the database for this viewer
  * `read_access_group_ssim` or `read_access_person_ssim` is updated to remove the group/user id from the solr document
  * the `Hydra::AccessControls::Permission` is removed from Fedora
* When the create new work actor stack is run, if this is the only collection assigned, then the work is considered to be created directly in the collection.  When a work is created directly in a collection AND the collection type is configured to apply permissions to new works
  * each viewer is granted `read_access` to the new work

<ul class='info'><li>A <b>work is considered to be created directly in a collection</b> when the work is first created, if-and-only-if, there is one collection assigned to the work when the work is saved for the first time.</li></ul>

**Special Note on Admin Sets:**
* A site can set viewers on an admin set, which grants them `:view` access to that admin set.  This creates the solr read access and Fedora AccessControl entries as well, same as for other collections.
* Admin set viewers are given `read_access` to a work at the time it is creating within the admin set.

<ul class='warning'><li>Access to a work is granted when the work is created.  Changes to viewers after a work is created do not change the access grants of any existing works.  Work access grants can be updated in the work edit form to remove/add access for any group/user including those set by the collection.  See also <a href="#setting-groups-vs-users-as-participants">Setting groups vs. users as participants</a>.</li></ul>

## Setting groups vs. users as participants

### Why should you care about this?

Works that are assigned access grants through a collection or admin set are not updated if the roles in the collection or admin set are changed after the work already exists.  

For example,
* if user-1 is a manager of collection-1 when work-1 is created
  * user-1 is granted `edit_access` to work-1
* if collection-1 participants is changed to remove user-1 as a manager and add user-2 as a manager
  * work-1 continues to have user-1 with `edit_access`  
  * user-2 has no special access grants to work-1  
* when work-2 is created after the manager change
  * user-2 is granted `edit_access` to work-2, and all other works going forward as long as user-2 is a manager of the collection/admin_set

### Why might you want to set user participants?

Some sites have preservation concerns and do not want to allow access roles to change on existing collections and works.  In this case, you may want to set participants as specific users.  Any changes to existing collections and works will require an edit of each one individually to change those assigned to roles.

### What are the benefits of setting groups as participants?

If you set a group as a participant, you are granting access to all members of that group.  You can move users in and out of the group to grant or remove access to a work.

For example,
* if group-1 includes user-1 AND group-1 is a manager of collection-1 when work-1 is created
  * group-1 is granted `edit_access` to work-1
  * user-1 has `edit_access` to work-1 through their membership in group-1
* if group-1 membership is changed to remove user-1 and add user-2
  * user-1 no longer has `edit_access` to work-1 since user-1 is no longer a member of group-1
  * user-2 has `edit_access` to work-1 through their membership in group-1
