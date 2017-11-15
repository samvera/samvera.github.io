---
title: "Works"
permalink: works-testing.html
folder: samvera/manager_resources/works.md
sidebar: home_sidebar
a-z: ['works']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [works]
categories: How to create and manage Works in hyrax
version:
  id: 'hyrax_1.0-stable'
---

# Works

## Create a new work
Selecting “Share Your Work” on the Hyrax homepage will pop up a box of Work Types which control a number of aspects of how the work is ingested into the repository (model, view, controller, and forms).  ![works](images/screenshots/UIT_works_1.png)

Selecting the radio button next to a work type and then selecting the “Create Work” button at the bottom of the pop-up window will take the user to the metadata input form for that work type. Selecting the “X” at the top-right of the pop-up window or clicking anywhere outside of the pop-up window will make the pop-up window disappear.

On the metadata form, the following tabs are available across the top of the form for entering information about the work: ![works](images/screenshots/UIT_works_2.png)

- Descriptions: This is where descriptive metadata can be entered about the item. Fields labelled “Required” are required before the item can be uploaded. Part way down the Descriptions page is a button labelled “Additional Fields” which will reveal the full suite of descriptive metadata fields available for the model.

- Files: This is where you define the files or sets of files you wish to upload. You may either select a single file or folder of files or drag and drop the file onto the interface. Loading a file results in the filename and size appearing in a table above the upload buttons with the option to delete the file. Loading a folder of files results in the individual files in the folder being uploaded individually. Last, as the file is being uploaded, a progress bar appears in the interface, as does the option to cancel the upload.

- Relationships: This is where you define if the items being uploaded are part of any Collections and what Admin Set the items are in.

In addition, there is a sidebar along the right side of the page titled “Save Work” which keeps track of the following ![works](images/screenshots/UIT_works_3.png)

- Whether the three main elements of uploading a work have been completed: descriptive metadata has been added, files have been uploaded, and the deposit agreement has been verified. Next to each of these elements is a red icon that will turn green when that element has been completed
The Visibility settings of the item: There are five visibility settings in this area:

  - Public: Pubic Works are visible on the open web. Selecting this option causes text to appear below the label with prompts to check that the uploader has rights to share the work on the open web.
  - Private: Private Works are visible only to the administrators of the admin set the work was deposited to, the administrators of the repository, and the user who owns the work (usually the user who uploaded the work).
  - Institution: Institution Works are only visible to the users at the institution in question. Parameters defining the institution (e.g. IP Ranges, authentication, etc.) must be configured for the each repository individually.
  - Embargo: Embargoed Works have restricted visibility until the end of an embargo time period, after which the visibility changes. Selecting this option causes an interface to appear, asking what the visibility should be upon upload, what date the visibility setting should change, and what the visibility should be after the embargo date passes.
  - Lease: Leased Works have less-restricted visibility until the end of a lease period and then visibility is returned to a more restrictive visibility setting. Selecting this option causes and interface to appear, asking what the visibility should be upon upload, what date the visibility setting should change, and what the visibility should be after the embargo date passes.

- The Deposit Agreement: The uploader must select the check-box indicating that they agree to the terms of deposit. Selecting the check-box will change the “Check deposit agreement” area of the Requirements section to green. The words “Deposit Agreement” link to the text of the deposit agreement for the repository.

## Create a new work, uploading multiple files
Select the type of work: Generic work or Image. The two requirements are Describe your work and Add files.

## Create a new work, upload file from cloud storage

## Create a new batch of works
Creating a batch of new works is very similar to creating a single new work. The primary difference involves the upload process, which creates a new work with each new file, and the metadata inputs, which are applied across the batch of new works.

To get started, select “Batch Create” beneath the Works heading in the top navigation.

- Start by adding local files. Each local file upload will result in a new work, whereby the user can edit the Display Label and select the Resource type. The Display Label will default to the file name. Users can apply a Resource Type selection across all works in the batch.
- Descriptions are applied across all works.

## View your works
Clicking on View Files will return a table of Works created by the user, including the Title, Date Uploaded, Status, Visibility, and Action. Users can sort and display their Works by Date Uploaded or Modified and Count (i.e. Show 20 [Works] per page). ![works](images/screenshots/UIT_works_4.png) The boxes to the left of the Work Titles indicate selections, allowing users to Edit, Delete, or Add to Collection in bulk. For individual Works, users can Select an Action, including Editing, Deleting, Highlighting the Work on the user’s profile or Transferring the work to another user. Similar to browsing the Catalog, users can select Titles of work to view the Work record and filter works using the Facets.

## Grant proxy authority to another user
Use case: Faculty member wants to deposit her works in the repository but delegates this task to her lab manager to deposit, describe, and manage Works on her behalf.

Proxy Users may deposit, edit, and delete Works that are owned by other users. From the Dashboard, scroll down to the Manage Proxies. ![works](images/screenshots/UIT_works_5.png) From the Authorized Proxies search menu, select a Users. Users available for proxy select must have logged into the repository in order to be found. When a User has been authorized as a Proxy, they will receive a Notification upon their next login

## Upload a new version of a file to a work
Using the workflow above called ‘Create a new work’, make sure that you can add a work with at least one file and then locate that work.  Once you have opened the work for viewing, locate the ‘Items’ section at the bottom of the page.  ![works](images/screenshots/UIT_works_6.png) You should see a listing of the files that you added, and each one should have a control labeled ‘Select an Action’ in the far right column.  From this dropdown control, choose ‘Versions’. ![works](images/screenshots/UIT_works_7.png)

At this point you should see the edit page for the file itself, and the ‘Versions’ tab should be opened by default. In this tab are controls to manage versions of this specific file.  To upload a new version, simply click ‘Browse’ to bring up a file browser and choose a local file.  Once selected, click ‘Upload New Version’ to upload the new file as the active version associated with this work.

Upon completion you should see the full detail view for the file, and the user activity section should contain a message showing the addition of a new version of the file. ![works](images/screenshots/UIT_works_8.png)

## Restore a prior version of a file within a work
Using the workflow above called ‘Create a new work’, make sure that you can add a work with at least one file. Then, using the workflow above called “Upload a new version of a file”, add at least one more version to an existing file.  

After adding a new version of a file you should be on the detail page for the file itself. ![works](images/screenshots/UIT_works_9.png) To return to the version controls, click ‘Edit this File’ in the left sidebar area, and then click the ‘Versions’ tab.  To restore a previous version, click to choose the desired version and then submit with the ‘Save Revision’ button. This will make the selected version the current active version of the file.

Upon completion you should see the full detail view for the file, and the user activity section should contain a message showing the restoration of a previous version of the file.

## Share work information with social media
From an item’s showpage, selecting one of the social media links on the bottom of the right hand column will open a new browser tab for that social media site. If you are not logged into the site, this page will present you with a login screen. Once logged in, you will be presented with a “new post” type screen for that site with a link to the repository item pre-populated in the post text area.

## Highlight a work on your user profile
From the Your Works page, selecting Highlight Work option in the Actions drop-down menu will highlight the work in question. With this action, the star icon under the Highlighted column of the table will change appearance to indicate that the work is highlighted. ![works](images/screenshots/UIT_works_10.png) To highlight a work, select Unhighlight Work from the Actions drop down menu for the work.

## Feature a work on the homepage
At the top right side of a work’s showpage, you will see a Feature button that can be used to feature a work on the repository homepage. When selected, the Feature button will turn into an Unfeature button allowing you to remove the work from the homepage. The Feature/Unfeature button will only appear if you have administrative rights to the work.

## Create and use a single-use link for a file
From a file’s showpage, you will see a set of buttons on the lower left side of the screen underneath the file thumbnail image. Here, the Single-use Link To File button can be selected, which will result in the creation of a Single Use Links table on the bottom left of the page. This table lists each of the single use links you have created for this file, a copy button, a delete button, and a time counter for when the single use link will expire. Selecting the copy button will copy the link to the clipboard. Selecting the delete button will remove the link from the table ![works](images/screenshots/UIT_works_11.png)

## Transfer ownership of a work to another user
From the Works table, select the Transfer Ownership of Work option from the Actions drop-down menu, which will take you to the Transfer of Ownership page. ![works](images/screenshots/UIT_works_12.png) On this page, search for a user and enter a comment to the person to whom you are transferring the work. Selecting the Transfer button will pop up a confirmation window allowing you to Cancel the transfer or Okay the transfer.

Up on Okaying the transfer, the Transfer Ownership page will show a table of items that you have transferred to others and the status of that transfer. ![works](images/screenshots/UIT_works_13.png) The table displays the work title, the date of the transfer request, the user ID of the person to whom the transfer request was sent, the status of the transfer request, and the comment sent with the transfer request. In the Status column, you have the option to Cancel the transfer if it has not yet been accepted.

## Upload a work on behalf of another user
From the edit page of a user profile, the Authorize Proxies area at the bottom of the screen allows you to search for another user and set them as a proxy depositor for you. ![works](images/screenshots/UIT_works_14.png) Selecting another user from the search box will populate the adjacent Current Proxies table. To remove a proxy depositor, select the X next to the user’s name and they will be removed from the list and no longer able to act as a proxy depositor. Assigning or deleting a proxy will also initiate an email to both the user and the proxy that the assignment or deletion has occurred.

## Batch editing works
