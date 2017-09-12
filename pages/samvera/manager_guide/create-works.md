---
title: "Creating a Work"
permalink: create-works.html
folder: samvera/manager_guide/create-works.md
sidebar: home_sidebar
a-z: ['Administration']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [user_resources]
categories: How to use the Administration panel in hyrax
version:
  id: 'hyrax_1.0-stable'
---

# Creating a Work

Works are items in the repository, containing files and metadata. Works are presented as one intellectual object. Example: A single dissertation (PDF and descriptive information), a dataset containing multiple files (spreadsheets, images, text files and descriptive information).

A user must be logged in to create a Work. There are several ways to add a new work:

- On the homepage, click “Share Your Work” ![Creating work](images/screenshots/Creating_work_1.png)
- In the top navigation menu, click “Works”, “New Work”.
- In the Dashboard, click “Create Work” ![Creating work](images/screenshots/Creating_work_2.png)

There four tabs in the Add New Work interface: “Description”, “Files”, “Relationships”, and “Share”. In order to be deposited, a work must minimally have: the required description fields filled out, at least one file uploaded, and the deposit agreement checkbox checked. ![Creating work](images/screenshots/Creating_work_3.png)

Once these required items are completed, the depositor must click “Save” in order to deposit the work. Navigating away from the deposit screen before clicking save causes user to have to redo deposit.

## Description (required)
The “Description” tab is for adding descriptive metadata. Fill out the fields marked “Required”. Clicking “Additional Fields” will show more metadata fields, which are optional. ![Creating work](images/screenshots/Creating_work_4.png)

Customizing fields is possible see bottom section Metadata

## Files (required)
The “Files” tab is for uploading files, either locally or from a cloud service. You can browse local files to upload, or drag and drop files from your desktop. ![Creating work](images/screenshots/Creating_work_5.png)

If your repository is configured to interact with a cloud service such as Dropbox, users can click “Browse cloud files” and securely connect to their own Dropbox. They can then browse cloud files to upload. Files can also be removed from the deposit in the “Files” tab.

## Relationships (optional)
The “Relationships” tab lets you add the work to an Administrative Set or a Collection. ![Creating work](images/screenshots/Creating_work_6.png)  Administrative users can add a work to any Administrative Set or Collection in the repository; other users are only able to add works to Collections that they have created or that they have permission to deposit to. (See settings, admin sets below)

## Sharing works (optional)
The “Share” tab allows you to share the work with other users. Under “Share work with other users”, you can search for users using their email address. ![Creating work](images/screenshots/Creating_work_7.png)

In the “Choose Access” drop down menu, select either “View/Download” or “Edit”. ![Creating work](images/screenshots/Creating_work_8.png)  

“Edit” access gives the selected users all the capabilities of the depositor, including deleting and sharing with other users. Under “Share work with groups of users”, you can select a group of users to assign “View/Download” or “Edit” access to. ![Creating work](images/screenshots/Creating_work_9.png)  

You can also edit or remove sharing settings in this tab. All works deposited are automatically shared with admin users.

## Visibility
On the sidebar, you can select one of five options for visibility: Public, Your Institution, Embargo, Lease, Private. ![Creating work](images/screenshots/Creating_work_10.png)

This setting only controls who can view or download your work -- it does not control edit access (this must be done in the “Share” tab).

- Institution restricts access to works and work metadata to users with login privileges
- Embargo lets you restrict access to Private or Institution until a specified date, when it will be opened to Open Access or Institution
- Lease permits access to the work to the public or Institution until a specified date, when it will be restricted to Private or Institution

## Deposit Agreement (required)
The depositor must check the deposit agreement checkbox in order to deposit. ![Creating work](images/screenshots/Creating_work_11.png)

The agreement can be customized [HERE]

## Depositing as a proxy
Users can designate other users of the system to deposit on their behalf by visiting their dashboard. Once someone has been set as a proxy for another user, the sidebar will offer the option to deposit on behalf of yourself or the other user. If you deposit on behalf of another user, the ownership of the work will automatically be transferred to that user when the deposit completes.
