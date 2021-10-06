---
title: "Manage Proxies (3.0)"
permalink: manage-proxies-3.0.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Collections"
---
# User Collections

This page focuses on the basics of an end user creating a collection. For a detailed overview of collection types and configurations, please visit the Collection configuration and [Admin Sets](https://samvera.github.io/administrative-sets-3.x.html) section of this website.

Collections can be displayed under the "Explore Collections" tab on the Hyrax homepage. Currently, repository administrators cannot configure which collections display in this tab. The list consists of the first five results of the collections that the user has permission to see, ordered by ascending timestamp. Therefore, the oldest untouched collections will appear.

#Create a User Collection

To access the Collections list:

1. Navigate to the Dashboard
2. Click on Collections in the sidebar


![screenshot of collections page](\images\screenshots\collections-2.1.png)

To create a new collection:

1. Click on the "New Collection" button at the top of the screen 
2. If the repository contains more than one collection type, then a dialog box will pop up, giving you the option to select a collection type for the new collection. Depending on the settings defined for the collection types within a repository, some collection types may not be available to all users of the system. Users will only see choices for collection types that they have permissions to create.
3. Select a collection type and click "Create Collection"
4. Enter a title for the collection and additional metadata if desired.
5. Click "Save"

![screenshot of new collections page](\images\screenshots\new-collection-2.1.png)

You can only set visibility and sharing AFTER the collection is created.

## Adding Works to Collections
The visibility of a collection does not affect the visibility of a work. For example, if a Public work is added to a Private collection, the work will remain Public, but a link to the collection itself can not be discovered. Additionally, if the user does not have permission to view a restricted work in a shared collection, they will not be able to see the work in the collection edit page.

There are several ways to add works to collections. Note that all of these options require the collection to have already been created. 

### Adding Works to Collections from the Dashboard
1. From the Dashboard, click"Works"
2. Select one or more works
3. Click the "Add to Collection" button
4. Select the collection in the dialog box, then click "Save Changes"

![screenshot of works page with two items selected. The add to collection button is displayed above](\images\screenshots\add_to_collection.PNG)

### Adding Works to Collections in Browse view

1. On a work page, click "Edit" 
2. Select the "Relationships" tab
3. Search for the collection in the "Add to collection" box
4. Click "Add"

![detail of relationships tab on the work page, showing collections section with search box and add button](\images\screenshots\collections_browse.PNG)

### Adding New Works to a Collection

1. When creating a new work, click the "Relationships" tab 
2. Search for the collection in the "Add to collection" box
3. Click "Add"

## Editing Collections
### Edit Collection Description

1. Click on the "Collections" link in the Dashboard
2. Click on the collection 
3. Click the "Edit collection" button

![detail of collections edit page, showing title and description text boxes](\images\screenshots\collection_edit.PNG)

### Edit Collection Branding
Users have the option to add a custom banner or logo to their collections. 

1. Click on the "Collections" link in the Dashboard 
2. Click on the collection 
3. Click the "Edit Collection" button 
4. Select the "Branding" tab at the top of the page 

![detail of collections branding, showing banner and logo upload sections](\images\screenshots\collection_branding.PNG)

### Edit Collection Visibility

1. Click on the "Collections" link in the Dashboard 
2. Click on the collection 
3. Click the "Edit Collection" button 
4. Select the "Discovery" tab at the top of the page 

Collections can be either public, limited to institution only, or private.

![detail of collections visibility, showing public, institution and private visibility selections. Private is selected](\images\screenshots\collection_visibility.PNG)

### Sharing Collections with Other Users
1. Click on the "Collections" link in the Dashboard
2. Click on the collection 
3. Click the "Edit Collection" button. 
4. Select the "Sharing" tab at the top of the page

![detail of collections sharing, showing add group and add user search boxes](\images\screenshots\collection_sharing.PNG)

To share with a group: 
1. Search for the group name in the "Add group" box 
2. Choose the desired level of access from the "Select a role" drop down menu. The options are: "Viewer", which will grant viewer permissions to restricted works, "Depositor", which will allow users from the group to deposit to the collection and "Manager", which will grant the user permission to change the collection's settings. 
3. Click "Add" to add the group to the list of users in the "Currently Shared With" list

To share with a single user: 
1. Search for their username in the "Search for a user" box. Note that this box will only search for users registered with your repository. 
2. Choose the desired level of access from the "Select a role" drop down menu. The options are: "Viewer", which will grant viewer permissions to restricted works, "Depositor", which will allow users from the group to deposit to the collection and "Manager", which will grant the user permission to change the collection's settings. 
3. Click "Add" to add the group to the list of users in the "Currently Shared With" list

## Removing Works from a Collection
Removing works from a collection will only remove the association between the work and the collection and will not delete the work.

1. Click on the "Collections" link in the Dashboard
2. Click on the collection 
3. Navigate to the "Works" heading 
4. Click "Remove" next to the work 

![detail of works on collections page, title, date added, owner, visibility and action headings](\images\screenshots\collection_works.PNG)

## Deleting a Collection
Deleting a collection does not affect the works that are members of the collection. The collection can be deleted and the works will continue to exist in the repository.

1. Click on the "Collections" link in the Dashboard
2. Click on the collection 
3. Click on the "Delete Collection" button

![detail of collections page, showing edit collection, add to collection and delete collection buttons](\images\screenshots\collection_delete.PNG)












