---
title: "Administration"
permalink: administration-testing.html
folder: samvera/ui_testing/administration-testing.md
sidebar: home_sidebar
a-z: ['Administration']
keywords: testing
tags: [testing]
categories: Testing the Administration panel in hyrax
version:
  id: 'hyrax_1.0-stable'
---

# Administration

Overview of the Administration ('/admin') user interface for repository mangers.

## View repository activity summary
Example (non-working) URL: https://insertyourtenanthere.demo.hydrainabox.org/admin

## View repository system status
Example (non-working) URL: https://insertyourtenanthere.demo.hydrainabox.org/status

## Customize content blocks
From the Dashboard, under Configuration, select Content Blocks to get to the Content Blocks page. From here, there are three tabs at the top of the screen - Announcement Text, Marketing Text, Featured Researcher. Each of these tabs presents the user with a text area and rich text editor to add, edit, and format text. To change or add text to any of these repository pages, enter the text you wish to appear on the page and select Save. To add an image to any of these text blocks, drag and drop the image from your computer onto the text area.

### Comment: Customize Content Blocks
- this may be a local issue for me, but drag-drop an image in Chrome causes the image to open in a new tab, and not drop into the text area. This process works fine for me on Firefox.

## Enable/disable features
From the Dashboard, under Configuration, select Technical to get to the enable/disable features page. From here, selecting the Off/On switch next to a listed features will move the switch to the selected position, change the Enabled/Disabled label next to the feature, and enable or disable that feature in the system.

## Create new administrative set
From the Administration dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the ‘Create new administrative set’ button in the upper right. Give the new set a title and short summary and save it. You should now be in the ‘Edit Administrative Set’ view for performing additional configuration.

## Edit an administrative set
From the Administration dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the desired administrative set. From this detail page, click the ‘Edit’ button in the upper right. You should now be in the ‘Edit Administrative Set’ view for performing additional configuration. From here, you can edit the title, summary, or select additional tabs to manage participants, visibility, and workflow configuration.

### Comment: Edit an administrative set
- Does this include adding additional metadata fields (i.e. Interviewee/er, Publication Info)?
- No, that is not yet exposed in the UI; this requires customization of the application code. Good question!

## Delete an administrative set
From the Administrative dashboard, click on ‘Administrative Sets’ under ‘REPOSITORY CONTENTS’ in the left sidebar. In the administrative sets view, click the desired administrative set. From this detail page, click the ‘Delete’ button in the upper right. If you confirm when prompted, the administrative set will be deleted and you will be returned to the list of available administrative sets.

## Assign a workflow role to a user
From the dashboard, click on ‘Workflow Roles’ under ‘CONFIGURATION’. In the workflow roles view, choose the desired user from the dropdown list.  In the workflow role dropdown, there will be a list of available roles as defined in workflow configurations.  These workflows are configured via JSON files and loaded into the Hyku instance, which have then been assigned to available administrative sets.  Choose the desired administrative set and the desired respective role and click ‘Save’.  You should now see the newly created association of a user to a role in the lower half of the view.

## Review workflow submissions
From the Dashboard, select Review Submissions under Tasks to be taken to the Review Submissions page. On the Review Submissions page is a table including all items that need to be reviewed and for which you have review permissions. The table includes the title of the work, depositor ID, submission date, and the status of the item (the state of the workflow it is currently in). Selecting the title of the item will take you to the item’s show page where one can review the metadata, files, and settings for the item. At the bottom of the show page for the item is a Review and Approval panel that, when selected, will open a window that includes options for reviewing the item based on steps defined in the workflow. For each radio button, the user also has the option of entering comments in a text box. Any comments or previous review/workflow steps that have already been applied to the item.

## View reports
From the Dashboard, select Reports under Activities to be taken to the Reports page. On the Reports page, you are presented with a number of reports for the repository, some of which can be modified using the Start and End Date query boxes located at the top of the page. Entering dates into these boxes and selecting the Load Stats button returns the Reports page with statistics for the relevant dates in the Work Statistics, Newest Users, and Deposits By Users areas of the page. The other areas of the Reports page are not subject to filtering by date.

# Features not yet available in Hyrax

## Edit repository labels
From the Dashboard, under Configuration, select Settings - Labels to get to the Labels edit page. From here, you can provide Hyrax with the:

- Application Name - This will appear at the left side of the main banner on each page, in place of “Hyrax” and on the Terms of Use page in place of “Hyrax”
- Institution Name - This will appear in the Terms of Use page where the institution name is used
- Full Institution Name - this will appear in the Terms of Use page where the full institution name is used

## Add banner image
From the Dashboard, under Configuration, select Appearance to get to the Appearance page. From here, there are two tabs at the top of the screen - one for Banner Image and one for Colors. To change the banner image, select the Banner Image tab and select the Choose File button. This will initiate a file browser interface from which you can select an image to act as your banner image. Once you select and Okay the banner image, you will see the image appear on the screen below the file browser button.

### Comment: Add banner image
- May want to indicate, here, the recommended dimensions of the banner image.

## Change Colors
From the Dashboard, under Configuration, select Appearance to get to the Appearance page. From here, there are two tabs at the top of the screen - one for Banner Image and one for Colors. To change the primary colors on the repository, select the Colors tab. From this page you can select any of the color blocks at which time you will be presented with a color selection pop up window. Selecting a color will cause the color block to be set to this color. Selecting Save will set this as the new color for the element(s) in question in your repository.

## Change page contents (about page, deposit agreement, etc.)
From the Dashboard, under Configuration, select Pages to get to the Pages page. From here, there are four tabs at the top of the screen - About Page, Help Page, Deposit Agreement, and Terms of Use. Each of these tabs presents the user with a text area and rich text editor to add, edit, and format text. To change or add text to any of these repository pages, enter the text you wish to appear on the page and select Save.

## Create a new user group and assign users
From the dashboard, in the Configuration section, select Manage Groups under Users and Groups to be taken to the Manage Groups page. On this page, you will see a table listing the groups that exist for the repository and the option, via a button on the top right of the page, to Create New Group.

Selecting Create New Group will take you to an interface with three pages, indicated by tabs across the top of the page:

- Description: on this tab you can name the group and supply a short description of the group. Access to the Users and Remove tab is disabled until the group is saved.
- Users: on this tab you can add members to the group by searching for their name and selecting Add. For members already in the group, you have the option to…
- Remove: on this tab you have the option to permanently remove the group from the repository by selecting the Remove button. Selecting this button activates a pop up window asking for confirmation of this action. Selecting Cancel will return you to the Remove tab, while selecting OK will remove the group permanently and return you to the Manage Groups page.

### Comment: Create a new user group and assign users
- Not a feature in Hyrax yet - still needs backport from Hyku.

## Manage user accounts
From the Dashboard, in the Configuration section, select Manage Users under Users and Groups to be taken to the Manage Users page. On this page, you will see a table listing all fo the users in the repository including their user ID (email), the roles they have been assigned to, and the last time they accessed the repository. You can, from this table, search for users with a search box at the top-right of the page. Selecting an individual user ID from the table will take you to the user’s profile page.

### Comment: Manager user accounts
- Not a feature in Hyrax yet - still needs backport from Hyku.
