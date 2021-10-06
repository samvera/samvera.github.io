---
title: "Administrative Sets"
permalink: administrative-sets-3.0.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"

---
# Administrative Sets

Administrative or admin sets are a special type of collection which allows administrators to configure participants, visibility, and workflow options for works which are deposited into it. For example, if the administrator wanted to only allow depositors to choose "Public" visibility for their deposits, they would do so via an administrative set. In Hyrax 2.1, administrative sets were reconfigured as a collection type.

## Creating an Administrative Set
Administrative sets can be created and accessed as collections.
1. On the Dashboard, click "Collections"
2. Click "New Collection"
3. In the "Select type of collection" popup, select "Admin Set"
4. Click "Create Collection"
5. Enter a title for the admin set and click "Save"

After creating an administrative set, its settings can be altered through the Participants, Release and Visibility and Workflow tabs.

Administrative sets will always have "Private" visibility, since they cannot be discovered as regular collections. This only affects the administrator view of the administrative set and does not affect the visibility of works deposited into the administrative set.

## Participants
The participants tab allows administrators to assign users or groups as Managers, Depositors and Viewers of works in the administrative set.
* Managers can edit the administrative set settings. They can also edit any works deposited into the admin set, even if they did not deposit the work. Additionally, they can approve works in a one-step mediated deposit workflow.
* Depositors can add new works to an administrative set, but cannot edit works that they did not deposit.
* Viewers can see works in the administrative set, even if the works cannot be viewed by other users.

Note that any changes made to the participants list only affect works that are deposited going forward. To change participants on works which have already been deposited, the work will need to be updated individually with the new participants.

To add a group to the administrative set: 
1. Search for the group name in the "Add group" box 
2. Choose the desired level of access from the "Select a role" drop down menu. Note that clicking the "Allow all registered users to deposit" button in the "Current Participants" list will allow all users of the repository to deposit to the administrative set
3. Click "Add" to add the group to the list of users in the "Current Participants" list

To add a single user to the administrative set: 
1. Search for their username in the "Search for a user" box. Note that this box will only search for users registered with your repository. 
2. Choose the desired level of access from the "Select a role" drop down menu. Note that clicking the "Allow all registered users to deposit" button in the "Current Participants" list will allow all users of the repository to deposit to the administrative set.
3. Click "Add" to add the group to the list of users in the "Current Participants" list.

## Release and Visibility
The "Release and Visibility" tab controls which visibility settings users will be allowed to select when they deposit works to the administrative set. Note that any changes to these settings will only affect works deposited going forward.

The "Release" section controls whether users can choose to lease or embargo their work, as well as the length of time that the restrictions will be in effect. For more information on leases and embargoes, see the Managing Leases and Embargoes section.

The "Visibility" section controls which visibility options are available to users. Administrators can choose to allow users to choose any of the visibility settings, or restrict users to "Public", "Institution" or "Private" visibility only.

## Workflow
The workflow tab allows administrators to specify the circumstances under which works deposited to the administrative set will be published. 

The Default workflow is selected by default. In this workflow, works will be made available under the depositor's chosen visibility setting as soon as they are deposited.

In the one-step mediated deposit workflow, works need to be approved by a repository administrator or administrative set manager before they are published. For more information on the approval process, see the "Review Submissions" section.

# Depositing Works to an Administrative Set
Works can be deposited through a particular administrative set via the "Relationships" tab. Hyrax can be configured by a developer to assign an administrative set to a particular worktype.
1. From the Dashboard, click "Works", then "Add New Work"
2. Select a worktype and click "Create work" (if applicable)
3. Click on the "Relationships" tab
4. In the "Administrative Set" drop-down menu, select the administrative set to which the work should be deposited. The default admin set is selected by default
5. Continue depositing the work and click "Save"



