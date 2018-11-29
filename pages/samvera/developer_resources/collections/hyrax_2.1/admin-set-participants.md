---
title: "Understanding Participants for Admin Sets"
permalink: admin-set-participants.html
sidebar: home_sidebar
keywords: ["Admin Set", "Participant", "Collection"]
last_updated:
version:
  id: hyrax_2.1-stable
  label: 'Hyrax v2.1 (also applies to Hyrax v2.0.x)'
---

### Impact on Admin Set Access

When participants are added to an Admin Set, access to it will be assigned as follows:

* **Managers** - edit_access for the Admin Set - able to set Admin Set metadata
* **Depositors** - no access levels assigned
* **Viewers** - no access levels assigned

### Impact on ability to add works to an Admin Set

When a user is creating/editing a work, the Relationships tab has a selection list of Admin Sets to which a user can add works.  Participants that can add to an Admin Set are:

* **Managers** - can add works to the admin set
* **Depositors** - can add works to the admin set
* **Viewers** - can _**NOT**_ add to the admin set

### Impact on Work Access

Participant access to a work is assigned when a new work is saved.  Based on the Admin Set selected on the Relationships tab when creating a NEW work, access to the work will be assigned as follows:

* **Managers** - edit_access for the work assigned
* **Depositors** - no access levels assigned
* **Viewers** - read_access for the work assigned

Once a work is created and access is assigned, the Admin Set's participants have no more bearing on the work.  That is, if the participants are changed in the Admin Set, any existing works remain unchanged.  Any new works will get access assigned based on the new participants for the Admin Set.

<ul class='warning'><li>Access to works in an Admin Set is granted when the work is created.  Changes to manager and viewer roles after a work is created do not change the access grants of the work.  See also <a href="collection-sharing.html#setting-groups-vs-users-as-participants">Setting groups vs. users as participants</a>.</li></ul>
