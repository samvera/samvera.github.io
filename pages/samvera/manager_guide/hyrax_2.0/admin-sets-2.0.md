---
title: "Administrative Sets"
permalink: admin-sets-2.0.html
folder: samvera/manager_guide/admin-sets-2.0.md
sidebar: home_sidebar
a-z: ['Administration']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [user_resources]
categories: How to use the Administration panel in hyrax
version:
  id: 'hyrax_2.0-master'
  versions:  
    - label: 'Hyrax 1.0'
      link:  'admin-sets-1.0.html'
    - label: 'Hyrax 2.0'
      link:  'admin-sets-2.0.html'
      selected: 'true'
---

*This Guide is maintained by Samvera's [Repository Management Interest Group](https://wiki.duraspace.org/display/samvera/Repository+Management+Interest+Group). Screenshots are taken from [Nurax](https://nurax.curationexperts.com/), a testing repository running on the latest release of Hyrax. Hosting is generously provided by [Data Curation Experts](https://curationexperts.com/). Please open an issue on our [GitHub repository](https://github.com/samvera/samvera.github.io) to request edits or additions.*

Hyrax must have at least one Admin set in order for users to add content to the repository. Repository Administrators can create additional Admin sets as needed. Admin sets are advised to use when you have a set of works that need default behaviors and/or permissions. For example, if you have a set of works that specific users need to be able to edit or view. Admin sets also work well for sets of works that need to follow a particular publishing workflow, like supporting the mediated deposit of student papers.

You must create at least one Admin Set. All works in your repository must belong to one, and only one Admin Set.

## To create a new Administrative Set
As a Repository Admin, navigate to your dashboard and then to Administrative Sets on the left hand menu.
- Description: Assign a title and description.

![Create Admin Set](images\screenshots\create-admin-set.png)

After clicking save you have additional configuration options:

![Edit Admin Set](images\screenshots\edit-admin-set-2.png)

- Participants: Use this tab to grant groups of users or individuals role based permissions to the Admin Set.
  - Please note: When you add an individual as a participant to an Admin Set, those permissions ONLY apply to items added AFTER the participant was added. Likewise, removing individual participants from an Admin Set does NOT remove their access to the works added previously, but only removes access to those works that are added to the set AFTER their permission is revoked. If you want to grant access users to all works in an Admin Set regardless of when the work added, it is recommended that you utilize the Groups permissions at the time of Admin Set creation (before new works are added). That way you can add and remove individuals from groups any time. There is currently no way to create adhoc groups but an external grouping system may be integrated.

  - Default roles include:
    - Viewer: Can see items in the set regardless of visibility settings on the individual works. These can be viewed by searching for the works. Viewers can not navigate to Admin Sets via the dashboard.
    - Depositor: Can deposit to the Admin Set. Clicking Allow all registered users, allows anyone who logs in the right to deposit to that set. This might be useful for Admin Sets like “Open Access Articles”.
    - Manager: Can see and edit all works in the set regardless of visibility settings on the individual works. Can change the details about the Admin Set itself.

![Edit Release and Visibility](images\screenshots\edit-admin-set-release-2.png)

- Release and Visibility: Use this tab to apply policies to each set. These policies determine what options a depositor can choose when submitting a work to a specific admin set. For example, if you have a collection of Open Access Articles and you do not want to allow users to apply embargoes, you can enforce that for an entire Admin Set. Settings are ‘shown’ to all depositors but prohibit depositors from selecting certain settings based on the Admin Set’s configuration. Changing these setting do NOT affect the works already in the set. Notes: Use this with caution as these cannot currently be overridden even by Repository Admins.
Here are the available settings.

![Edit Workflow](images\screenshots\edit-admin-set-workflow-2.png)

- Workflows: The two workflows that are included out of the box include Default Workflow and One-step Mediated Deposit. Every Admin Set with have the Default Workflow unless otherwise specified. See the workflow section for more information.
- Setting a thumbnail for the set - you can select a thumbnail on the Description Tab, however you must select an image in the set. Select from an existing file or add a new one.
- Editing an Admin Set - Navigate to the Admin Set via the Dashboard and click the edit button on the page.
- Deleting an Admin Set - You must first delete all items in an admin set in order to delete the admin set itself. Deletion is permanent and can not be undone.

## Mediated Deposit/Workflow
Mediated Deposit Workflows enable repository managers or collection owners to implement a review process before works become available for access.

- Configuration: https://github.com/projecthydra/sufia/wiki/Mediated-Deposit-Workflow
- Settings: Turn on deposit to Admin Sets
- Create Admin Set
  - Add reviewers to Manager Role
  - Add student to depositor role
  - Add workflow 1-step mediated deposit (you would have 1 workflow per admin set, so name it after the admin set)

Workflows:
- Add workflow specific roles to each person who needs to deposit and review
- Default workflow
- 1-step workflow
- Create your own workflow

Reviewing submissions
- *Coming soon*
