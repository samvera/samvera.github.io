---
title: "Collection Nesting FAQ"
permalink: collection-nesting-faq.html
keywords: ["Nesting", "Collection", "FAQ"]
last_updated:
version:
  id: hyrax_2.1-stable
sidebar: home_sidebar
---

### What is collection nesting?

Collections that have collections as members.

### Can a collection have collections and works as members?

Yes.  A collection can have all sub-collections, all works, or a combination of both.

### How do I setup a collection type that can be nested?

* Dashboard -> Settings -> Collection Types
* click Create new collection type, set title and description, save  (or edit a type that doesn't yet have any collections created)
* click Settings tab (visible after saving a new collection)
* check the box beside NESTABLE
* save changes

### Is there a limit to how deep the nesting can go?

The depth of nesting is limited. By default the limit is set to 5.  It is defined in the hyrax engine in `config/initializers/samvera-nesting_indexer_initializer.rb` by config `config.maximum_nesting_depth = 5`.  You can override this to set a different maximum_nesting_depth.

### Can a collection be its own descendant?

No. An ancestor validation is performed when a collection is added to another collection to prevent circular chains.

### Can collections of different types be nested?

No.  At this time, nesting is limited to collections of the same type.  For example, you can nest a User Collection in a User Collection AND you can nest an Organizational Collection in an Organization Collection, but you can NOT nest a User Collection in an Organizational Collection.

In the future, this could be relaxed to allow a configuration that identifies which collection types can be nested in which, if this is determined to be a priority.

### Where do I manage collection nesting relationships?

There are two places in the UI for managing nesting.

* Collection show page at Dashboard -> Collections -> click title of collection
* Collection edit form at Dashboard -> Collections -> click action menu beside collection -> Edit collection -> Relationship tab

### How can I see what collections are nested?

Right now, there are two place to see nesting relationships and in both places, they only shows the immediate parents and subcollections.

* Collection show page at Dashboard -> Collections -> click title of collection
* Collection edit form at Dashboard -> Collections -> click action menu beside collection -> Edit collection -> Relationship tab

We hope to update the Dashboard -> Collections index page in later releases to include the ability to view nesting hierarchies, but there is extensive UI/UX design work required before implementation can happen.

### Can admin sets be nested?

No.  The Admin Set collection type come preconfigured with nesting turned off.
