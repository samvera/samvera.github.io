---
title: "Dashboard"
permalink: dashboard-testing.html
folder: samvera/ui_testing/dashboard-testing.md
sidebar: home_sidebar
a-z: ['Dashboard']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [testing, test_scripts, dashboard]
categories: How to test the user interface for the Hyrax Dashboard.
version:
  id: 'hyrax_1.0-stable'
---

# Dashboard

Access the Dashboard by selecting your username from the top navigation bar and selecting the Dashboard link in the drop-down menu.

![dashboard](images/screenshots/UIT_dash_1.png)

![dashboard](images/screenshots/UIT_dash_1.png)

## Edit your profile
On initial page load, Hyrax displays the heading “Edit Profile” and then input elements for avatar picture, ORCID profile, Twitter handle, Facebook handle, Google+ handle, then text that says “Remove Highlight Designation” with a help tooltip, then a save button, and lastly two column headings, “Authorize Proxies” and “Current Proxies,” with a search/select displaying “Search for a user” in the “Authorize” column.

![dashboard](images/screenshots/UIT_dash_2.png)

Beside the Choose File button for a picture is the copy “No file selected.” Just below the button is copy that provides the valid file requirements “JPG, GIF, or PNG (less than 2MB).” Below this are checkboxes for deleting your picture and refreshing the directory you are uploading from, each with tooltips.

![dashboard](images/screenshots/UIT_dash_3.png)

Clicking the Choose File button opens a dialog to your computer displaying potential picture files. Selecting one will display its title next to the browse button. Clicking save with a file larger than 2MB will reload the page with the validation error “Avatar file size must be less than 2MB ” in a flash message and “No file selected.” next to the browse button.

![dashboard](images/screenshots/UIT_dash_4.png)

Clicking save with an invalid ORCID reloads the page with the validation copy: Orcid must be a string of 19 characters, e.g., “0000-0000-0000-0000." (see: https://orcid.org)

![dashboard](images/screenshots/UIT_dash_5.png)

Any validation error will prevent the persisting of all the data entered. A successful save will load the user’s profile page with a green success message and the new information on display.

![dashboard](images/screenshots/UIT_dash_6.png)

Clicking in the search/select for Authorizing Proxies displays a panel that says: Please enter 2 or more characters. Entering characters changes its copy to “Searching…”. Two characters that don’t return any results will change it to “No matches found”, and two matching characters return the email of the matched user(s).

![dashboard](images/screenshots/UIT_dash_7.png)

Clicking the email result displays it as an element in the Current Proxies column, that contains a clickable “x” icon in it that removes the user from the list of authorized proxies. Adding and removing authorized proxy users is not persisted through the page’s Save button, but handled by the elements themselves.

## Notifications
(See above)

## Transfers
Transfers shows two tables, one for Transfers Sent and one for Transfers Received.

![dashboard](images/screenshots/UIT_dash_8.png)

![dashboard](images/screenshots/UIT_dash_8.png)

The Transfers Sent table will populate with works that you have attempted to transfer to another user. The table includes the work title, transfer request date, the ID of the user you sent the transfer request to, the status of the transfer request, and the comments you included in your transfer request. The Status column of the table offers a Cancel button that allows the cancellation of transfer request. Selecting the Cancel button activates a pop-up message asking you to confirm the cancellation. Confirming the cancellation changes the Status field for this item in the table to “Cancelled”.

The Transfers Received table will populate with requests for works that have been transferred to you. The table includes the work title, transfer date, the ID of the user the transfer is coming from, the status of the transfer, and the comments that were included with the transfer. The Status column will include a Reject button and an Accept drop-down list. In the Accept drop-down list, one has the ability to: Allow the depositor to retain edit access, Remove depositor access, and Authorize depositor as proxy. Selecting any of these Accept or Reject actions will update the table with a static Status of either accepted or rejected.

### Comments: Transfers

- Note: if the repo is CAS authenticating, the person assigned as batch user, nobody will be able to transfer content to them. so if CAS is enabled the default batch user is not created properly because password doesn't exist. for some reason we're also seeing that one cannot transfer content to the batch user.

- Ideally the batch user would never be visible in the UI, IMO. And should work in CAS situations. New ticket?

## Reports
The Reports page allows a user to submit a date range for which they would like statistics reported. The date range may be entered in the two date fields labelled Start and End. Selecting Load Stats will refresh the statistics in the Works Statistics, Newest Users, and Deposits by Users areas of the page. Leaving the End field should use today’s date as the default End date.

## Administrative Sets
The Administrative Sets page allows a user to view basic information about and to edit Administrative Sets (Admin Set). The page presents a table of Admin Sets by name, the date the Admin Set was created, the ID of the creator, and the number of items in the Admin Set.  Selecting an Admin Set from this table will return an information page about the Admin Set including basic statistics for the Admin Set, a table of all of the items in the admin set, and buttons that allow the user to Edit or Delete and Admin Set.

![dashboard](images/screenshots/UIT_dash_9.png)  
![dashboard](images/screenshots/UIT_dash_10.png)


Selecting Edit returns a page that allows the user to edit the core elements of the Admin Set including:

- Description: modify the Admin Set title, the text description of the Admin Set, and a thumbnail that is used to represent the Admin Set visually
- Participants: add participants to an admin set using the group or user search boxes and the role drop-down lists at the top of the page. This page also allows the user to review and change the participants in the admin set. Last, this page allows the user to allow all registered users of the repository to deposit content to the admin set.
- Release and Visibility: control when works added to this set are made available for discovery and download and who can discover and download them. This page allows the user to select among a number of options using radio selectors and date fields.
- Workflow: select the workflow that should be used for items deposited into this admin set

![dashboard](images/screenshots/UIT_dash_11.png)

![dashboard](images/screenshots/UIT_dash_11.png)

## Collections
The Collections page allows the user to see a table of collections that have been created in Hyrax, edit those collections, or create new collections.

![dashboard](images/screenshots/UIT_dash_12.png)
![dashboard](images/screenshots/UIT_dash_13.png)
![dashboard](images/screenshots/UIT_dash_14.png)

The table includes the names of collections, creation date, visibility, and a drop-down list of actions to take on the collection (Edit or Delete collection).

Selecting the collection name will return a collection page with basic statistics about the collection, a table of the items in the collection, and links to delete, edit, or add works to the collection. Editing the collection allows the user to modify the metadata and sharing settings as described in Create Collection (below).

![dashboard](images/screenshots/UIT_dash_15.png)

Selecting “Create Collection” returns a form for metadata about the collection, visibility of the collection, and sharing the collection with other users and groups. Sharing fields allow the user to search for another user or group with whom to share the collection and to define the type of access the user or group has to the collection (View/Download versus Edit).

![dashboard](images/screenshots/UIT_dash_16.png)

Adding works to a collection can be achieved by selecting Add Works button anywhere on a collection page, whereupon the user will be sent to the Works page (see below) with Your Works showing. To add other works, select All Works at the top of the page.

![dashboard](images/screenshots/UIT_dash_17.png)

### Comments: Collections

- Currently, can't add works that are not in Your Works to a collection. Is this by design?
- Yes, I believe the current model is that you can only add works to collections if you have edit access to them. And Your Works only shows works you can edit. Does that sound right, or is that too limited in modern-day Hyrax? Perhaps worth discussing in an issue?
