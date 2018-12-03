---
title: "Batch Operations"
permalink: batch-ops-2.1.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Creating Works"
  - "Batch"
  - "Upload"
version:
  id: 'hyrax_2.1-stable'
  versions:
  - label: 'Hyrax 1.0'
    link:  'batch-works-1.0.html'
  - label: 'Hyrax 2.0'
    link:  'batch-works-2.0.html'
  - label: 'Hyrax 2.1'
    link:  'batch-ops-2.1.html'
    selected: 'true'
---
## Uploading Works
Batch upload lets you upload multiple files at once as separate works. This is useful when you have several works, where each work is a single file, and each work has the same descriptive metadata, such as technical reports from a organization or photographs by an artist.

To create works as a batch, go to your Dashboard and click on `Works` in the sidebar. There, you will see a table of your works and options to `Add new work` or `Create batch of works`.

![Create batch of works](/images/screenshots/create-batch-works-1.png)

If you have more than one work type, you will be prompted to select the work type. You can only create a batch of works of the same work type. There is a limit of 100 works per batch.

### Adding Files to Works
The “Files” tab is for uploading files, either locally or from a cloud service. This works in the same way as adding files to a new work. You can upload one file at a time, or select multiple files. There is a limit of 100 files per work.

![Upload files](/images/screenshots/create-batch-works-2.png)

After uploading files, you can edit the `Display Label` and `Resource Type` for each Work. Each work can be assigned its own `Display Label` (i.e. Title) and `Resource Type`, but all other metadata will be applied to all works created in the batch. To change the resource type of all files at once, select the desired resource type for the first file and click “Set all to this Resource Type”

![Setting Display Labels and Resource Types Upon Ingest](/images/screenshots/create-batch-works-3.png)

### Describing Works
The `Descriptions` tab asks for `Creator`, `Keyword`, and `Rights Statement`. You also have the option to apply additional description fields. Each description field you apply will be applied to all works in the batch.

![Descriptions](/images/screenshots/create-batch-works-4.png)

### Relationships, Sharing, and Saving
The  `Relationships` and `Sharing` tabs are identical to the tabs you would see while depositing a work. The process for saving the batch of works is the same as saving a single work. Every selection you make for these options will be applied to all of the works in the batch.

## Adding Works to a Collection
As a Repository Administrator or the owner of works, you have the ability to add one or more works to a collection. From your `Dashboard`, click on `Works` in the sidebar. To the left of each collection title, there is a box that you can click on to select that work. Whenever you select a box, whether it is one or more or all, a red button will appear labelled `Add to collection`. Clicking the button will initiate a dialog box asking you to select a collection. The search box will search for collection titles available to you in the repository.

Alternatively, you can add works to a collection from the collection's edit page. From your `Dashboard`, click on `Collections` in the sidebar. Select a collection to which you would like to add works. Scroll down to the `Works` section of the page, and select either `Deposit new work through this collection` (i.e. add a new work to the repository as a member of this collection) or `Add existing works to this collection` (i.e. select a work that is already in the repository to add as a member of this collection). You have the ability to add multiple existing works to the collection.

## Deleting Works
As a Repository Administrator or the owner of works, you have the ability to delete works in bulk. From your `Dashboard`, click on `Works`, in the sidebar. To the left of each collection title, there is a box that you can click on to select that work. Whenever you select a box, whether it is one or more or all, a red button will appear labelled `Delete Selected`. Clicking the button will initiate a dialog box asking if you are sure. This step is irreversible.

## Deleting Collections
As a Repository Administrator, you have the ability to delete collections in bulk. From your `Dashboard`, click on `Collections`, in the sidebar. To the left of each collection title, there is a box that you can click on to select that collection. Whenever you select a box, whether it is one or more or all, a red button will appear labelled `Delete collections`. Clicking the button will initiate a dialog box asking if you are sure. This step is irreversible. You cannot delete Administrative Sets that contain works. Administrative Sets must be emptied before deletion either by deleting the works or moving them to a different Administrative Set.
