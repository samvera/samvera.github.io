---
title: "Administration"
permalink: administration-guide.html
folder: samvera/manager_guide/administration-guide.md
sidebar: home_sidebar
a-z: ['Administration']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [user_resources]
categories: How to use the Administration panel in hyrax
version:
  id: 'hyrax_1.0-stable'
---

# Administration
URL: /admin

Guide to the Administration features of Hyrax for repository managers.

## Statistics
URL: /admin/Stats

Not working.

## Settings

## Administrative Sets

### Create new administrative set
From the Administration dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the ‘Create new administrative set’ button in the upper right. Give the new set a title and short summary and save it. You should now be in the ‘Edit Administrative Set’ view for performing additional configuration.

### Edit an administrative set
From the Administration dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the desired administrative set. From this detail page, click the ‘Edit’ button in the upper right. You should now be in the ‘Edit Administrative Set’ view for performing additional configuration. From here, you can edit the title, summary, or select additional tabs to manage participants, visibility, and workflow configuration.

### Delete an administrative set
From the Administrative dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the desired administrative set. From this detail page, click the ‘Delete’ button in the upper right. If you confirm when prompted, the administrative set will be deleted and you will be returned to the list of available administrative sets.

## Workflows

### Assign a workflow role to a user
From the dashboard, click on ‘Workflow Roles’ under ‘CONFIGURATION’. In the workflow roles view, choose the desired user from the dropdown list.  In the workflow role dropdown, there will be a list of available roles as defined in workflow configurations.  These workflows are configured via JSON files and loaded into the Hyku instance, which have then been assigned to available administrative sets.  Choose the desired administrative set and the desired respective role and click ‘Save’.  You should now see the newly created association of a user to a role in the lower half of the view.

### Create a new user group and assign users
From the dashboard, in the Configuration section, select Manage Groups under Users and Groups to be taken to the Manage Groups page. On this page, you will see a table listing the groups that exist for the repository and the option, via a button on the top right of the page, to Create New Group.

Selecting Create New Group will take you to an interface with three pages, indicated by tabs across the top of the page:

- Description: on this tab you can name the group and supply a short description of the group. Access to the Users and Remove tab is disabled until the group is saved.
- Users: on this tab you can add members to the group by searching for their name and selecting Add. For members already in the group, you have the option to…
- Remove: on this tab you have the option to permanently remove the group from the repository by selecting the Remove button. Selecting this button activates a pop up window asking for confirmation of this action. Selecting Cancel will return you to the Remove tab, while selecting OK will remove the group permanently and return you to the Manage Groups page.

## Manage Users
