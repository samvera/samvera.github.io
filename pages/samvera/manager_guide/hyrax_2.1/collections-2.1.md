---
title: "Collections (2.1)"
permalink: collections-2.1.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Collection"
  - "Managing Collections"
  - "Admin Set"
  - "Creating Works"
version:
  id: 'hyrax_2.1-stable'
  versions:  
  - label: 'Hyrax 2.0'
    link:  'collections-2.0.html'
  - label: 'Hyrax 2.1'
    link:  'collections-2.1.html'
    selected: 'true'
---
Hyrax 2.1 comes with a suite of new options for creating and configuring collection types to satisfy a number of use cases for cultural heritage and research institutions. Two types of User Collections are included by default in Hyrax - User Collections and Administrative Sets. This page focuses on the basics of an end user creating a collection. For a detailed overview of collection types and configurations, please visit the [Collections and Admin Sets](http://samvera.github.io/collection-overview.html) section of this website.

## Create a User Collection

Login to the repository, navigate to the Dashboard, click on Collections in the sidebar:

![Collections Dashboard](/images/screenshots/collections-2.1.png)

Click on the `New Collection` button at the top of the screen. If the repository contains more than one collection type, then a dialog box will pop up, giving you the option to select a collection type for the new collection. Depending on the settings defined for the collection types within a repository, some collection types may not be available to all users of the system. Users will only see choices for collection types they have permissions to create.

Once you have selected a collection type, you will be required to name your new collection. You will also have the option to add additional metadata fields for your collection.

![Collections Dashboard](/images/screenshots/new-collection-2.1.png)

You can only set visibility and sharing AFTER the collection is created.

## Adding Works to Collections

There are several ways to add works to collections:

- From the Dashboard, click “Works” and select one or more works. Click “Add to Collection”. To add the works to a new collection, click “Add to new Collection” at the bottom of the dialog box. To add the works to an existing collection, select the collection in the dialog box, then click “Save Changes.”
- In the Browse view of a work, click “Edit” and select a collection in the “Relationships” tab. Click “Add.”  To select more than one collection, hold Control while selecting.
- When creating a new work, select a collection in the “Relationships” tab.

The visibility of a collection does not affect the visibility of a work. For example, if an Open Access work is added to a Private collection, the work will remain Open Access, but a link to the collection itself can not be discovered.

## Editing Collections

- To edit metadata for a collection, click on the “Collections” link in the Dashboard and click on the collection.  Click the “Edit” button.
- To change collection visibility, click on the “Collections” link in the Dashboard and click on the collection. Click the “Edit” button. Select the “Discovery” tab at the top of the page.  
- Collections can be either public, limited to institution only, or private.
- To remove works from a collection, click on the “Collections” link in the Dashboard and click on the collection. Navigate to the “Works” heading. Click “Remove” next to the work that you would like to delete.
- To delete a collection, click on the “Collections” link in the Dashboard.  Select “Delete Collection” from the “Actions” dropdown menu next to the collection that you would like to delete. Deleting a collection does not affect the works that are members of the collection. The collection can be deleted and the works will continue to exist in the repository.

## Sharing Collections with Other Users

- To share a collection, click on the “Collections” link in the Dashboard and click on the collection. Click the “Edit” button. Select the “Sharing” tab at the top of the page.
- To share a work with a single user at a time, search for them in the “Add user” search box, then select the appropriate level of access. Click the “Add” button to add the new user to the “Currently Shared With” list. The “Currently Shared With” list is grouped by access level. When you are finished adding users, click “Save changes” at the bottom of the page.
- To share a work with multiple users, make sure that they are assigned to a group. Select the group from the “Add group” drop down menu, then select the appropriate level of access. Click the “Add” button to add the new group of users to the “Currently Shared With” list. Click “Save changes.”
