---
title: "FAQ - Collection Nesting"
keywords: Nesting, Collection, FAQ
categories: How to Do All the Things
permalink: collection-nesting-faq.html
folder: samvera/how-to/collection_extensions/hyrax_2.1/nesting-faq.md
sidebar: home_sidebar
tags: [development_resources]
a-z: ['FAQ - Collection Nesting', 'Collections - Nesting', 'Nesting of Collections']
version:
  label: 'Hyrax v2.1.0.beta1'
  branch:
    label: 'master'
    link: 'https://github.com/samvera/hyrax/tree/master'
---

### What is collection nesting?

Collections that have collections as members.

### Can a collection have collections and works as members?

Yes.  A collection can have all sub-collections, all works, or a combination of both.

### Is there a limit to how deep the nesting can go?

The depth of nesting is limited. By default the limit is set to 5.  You can modify the limit by...  

<b style='padding-left: 30px; color: purple; font-size: 1.3em;'>TODO: how to change limit?</b>

### Can a collection be its own descendant?

No. An ancestor validation is performed when a collection is added to another collection to prevent circular chains.

### Can collections of different types be nested?

No.  At this time, nesting is limited to collections of the same type.  For example, you can nest a User Collection in a User Collection AND you can nest an Organizational Collection in an Organization Collection, but you can NOT nest a User Collection in an Organizational Collection.

In the future, this could be relaxed to allow a configuration that identifies which collection types can be nested in which, if this is determined to be a priority.

### Where do I set collection nesting?

There are two places in the UI for managing nesting.

* Collection show page at Dashboard -> Collections -> click title of collection
* Collection edit form at Dashboard -> Collections -> click action menu beside collection -> Edit collection -> Relationship tab

### How can I see what collections are nested?

Right now, there is only one place to see nesting and it only shows the immediate parents and subcollections.

* Collection show page at Dashboard -> Collections -> click title of collection

We hope to update the Dashboard -> Collections index page in later releases to include the ability to view nesting hierarchies, but there is extensive UI/UX design work required before implementation can happen. 

### Can admin sets be nested?

No.  The Admin Set collection type come preconfigured with nesting turned off.
