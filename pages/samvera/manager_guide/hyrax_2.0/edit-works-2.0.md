---
title: "Editing a Work (2.0)"
permalink: edit-works-2.0.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Editing Works"
version:
  id: 'hyrax_2.0-stable'
  versions:  
    - label: 'Hyrax 1.0'
      link:  'edit-works-1.0.html'
    - label: 'Hyrax 2.0'
      link:  'edit-works-2.0.html'
      selected: 'true'
    - label: 'Hyrax 2.1'
      link: 'edit-works-2.1.html'
---
# Editing a Work

There are two views for works: Browse view and Edit view. The public-facing view of a work is the Browse view. A user will navigate to a work and then click “Edit” to access the edit view. As an admin user, you would be able to edit any work in the repository.

In the edit view for a work, you can change the description, add files, edit relationships, edit sharing, and edit visibility. If you edit any of these settings, you must click “Save” in order to apply your changes. Note that if you add files, you must recheck the deposit agreement before saving.

If you edit the sharing or visibility of the work, you can either opt to have all files in the work inherit these permissions, or you can opt to have the individual files retain their permissions so that they can be edited manually.

Set child/parent work: In the “Relationships” tab, you can now add a child or parent work to the work - this is only available after the work is deposited, not at the time of deposit. A child work added to this work will appear as an Item in this work. A parent work will add this work to its Items. To add a child or parent work, enter the unique ID (found at ???) of the work under “Child Work” or “Parent Work” and click “Add”. Click “Save” to apply your changes.

## Editing a work - file manager
To change the order of files in a work or set a representative file, you have to use the File Manager. In the Browse view of a work, click “File Manager”.
Setting representative file: In the File Manager, select “Representative Media” for the file that you would like to be featured as the representative file in the work. Click “Save” to apply your changes.

- Ordering files: In the File Manager, click and drag files into the order that you would like them to appear in the work. Click “Save” to apply your changes.

## Editing a file
In the Browse view of a work, the files in the work are listed under “Items”
There are two views for files: Browse view and Edit view. The public-facing view of a file is the Browse view. In the Browse view of a file, click “Edit” to access the edit view.

In edit view, the user can edit the file description, upload a new version of the file, and change the permissions.

Edit description: In the “Descriptions” tab, enter a new file title in the “Title” field. Click “Update Attached File” to save changes.

Edit description: In the “Descriptions” tab, enter a new file title in the “Title” field. Click “Update Attached File” to save changes.

Upload a new version: Go to the file in the work and click on the Select an action drop-down menu. Click on Versions to see options for replacing the file with a new version.

Permissions: Visibility and sharing permissions can also be set at the file level, in the “Permissions” tab. As a default, all files have the same permissions as the containing work. This can be edited in the “Permissions” tab for each file.

## Uploading a new version
Permissions: Visibility and sharing permissions can also be set at the file level, in the “Permissions” tab. As a default, all files have the same permissions as the containing work. This can be edited in the “Permissions” tab for each file.

## Single-use Links
Single-use links are a way to share individual files from works. Single-use links expire after 24 hours and they can only be used once. When the recipient clicks the single-use link, the file will be downloaded to their desktop. To generate a single-use link, click “Single-Use Link to File” and click “Copy”.

## Transfering Work Ownership
Work ownership can be transferred between users in Hyrax.

- In My Works, click “Select an action” in the Action column next to a work
- Click “Transfer Ownership of Work”
- Find a user by entering two or more characters of their email address
- (optional) Add comments. These comments will only appear on the transfer record -- the work record will not be edited
- Click “OK” to confirm the transfer

You will be redirected to the Transfer of Ownership screen. Here, you can view past and current transfers and their statuses. If you wish to cancel this most recent transfer, click “Cancel” and click “OK” to confirm (transfers can only be canceled before they have been accepted by the recipient). The status of the transfer will be changed to “Canceled”

## Accepting Work Transfers
There are two ways for a recipient of a work transfer to view that transfer.
- In Notifications, there will be a notification about the transfer. Click “Review all transfer requests”
- In the Dashboard, scroll down to “Transfer of Ownership”
- To accept the transfer: in the Status column, click the arrow next to “Accept” and select:
- Allow depositor to retain edit access: Work visibility stays the same, depositor still has edit access
- Remove depositor access: Changes work visibility to “Private” and disables edit access for depositor.
- Authorize depositor as proxy: Work visibility stays the same, depositor still has edit access to work and is authorized as proxy for future deposits
- To reject the transfer: in the Status column, click “Reject” and click “OK” to confirm. The status of the transfer will be changed to “Rejected”
