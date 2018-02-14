---
title: "Nested Indexing"
keywords: Indexing, Collection
categories: How to Do All the Things
permalink: nested-indexing.html
folder: samvera/how-to/collections/hyrax_2.1/nested-indexing.md
sidebar: home_sidebar
tags: [development_resources]
a-z: ['Nested Indexing', 'Collections - Indexing']
version:
  label: 'targeted for Hyrax v2.1.0'
  branch:
    label: 'master'
    link: 'https://github.com/samvera/hyrax'
---

### Collections In Fedora and Solr
In Hyrax, a child (work or collection) is stored as a member of a parent collection. Fedora includes an LDP container “member_of_collections” and a memberOf relationship.

The collection relationship is indexed in Solr into "member_of_collection_ids_ssim" and “member_of_collections_ssim” as part of the standard to_solr method. Four additional fields (as defined in the configuration settings) are added to Solr via an after_update_index callback.

### In the Model
Nested Indexing is added to Hyrax via the inclusion of Hyrax::CollectionNesting in the Collection and Work models.

### Nested Indexing Details
Hyrax::CollectionNesting extends ActiveSupport::Concern to add an after_update_index callback. This calls the Samvera::NestingIndexer via Hyrax’s nesting_index_adapter.

The nesting indexer updates the Solr document of the object with four additional fields which are used for displaying the nested collections and validating which collections are valid for new creating nested relationships. This indexing is based on the object's "member_of_collections" attribute stored in ActiveFedora.

A call to the indexer reindexes the object itself, as well as all of its descendant collections and works, making this an expensive transaction. For this reason, the to_solr method does not load these fields.

The additional fields added to the Solr document are:
- ancestors: an array of the pathnames to each ancestral node of the given node (e.g. pathname to my parent, pathname to my grandparent)
- parent_ids: the ids for of the parents of the given document
- pathnames: an array of each path to traverse from a root document to the given document
- deepest_nested_depth: the count of ids in this document's longest pathname

These fields are more fully explained in the [Samvera::NestingIndexer gem's documentation](https://github.com/samvera-labs/samvera-nesting_indexer).

Pathnames and deepest_nested_depth  are indexed for all collections and works, regardless of whether or not they are a member of a collection. When there is no membership relationship, the pathname array will contain only the object's id, and the depth will be 1.

Hyrax contains a config file (hyrax/config/initializers/samvera-nesting_indexer_initializer.rb) specifically for setting up the allowed nesting depth and the Solr field names used for indexing. An additional  field name for indexing the deepest nested depth is defined in the nesting_index_adapter.

### Potential Pitfalls
Nested indexing is triggered by an after_update_index callback, and is based on the current data saved in Fedora. This differs from ActiveFedora's indexing which uses caching, so the sequence of saves and indexing may occasionally cause data to not be indexed as expected.

An example: When a collection's visibility settings are updated, the nested reindexing of the Collection happens immediately after the Collection is indexed, and before Hydra::AccessControls::Permission is actually saved. Because the nested indexing is based on the content in Fedora, it removes the permissions which were added during the initial indexing from the collection's Solr document. A subsequent update_index was added to Hyrax which fixes this situation.

### How does this relate to nested works?
A nested work can be added to a nested collection. However, nested works are implemented separately from and indexed differently than nested collections. Adding one nested work to a collection does not affect the indexing of its contained works, as they will not contain the member_of_collections attribute unless they are also independently added to the collection.

### Re-Indexing
In Hyrax, ActiveFedora::Indexing.reindex_everything is overridden to actually call `Samvera::NestingIndexer.reindex_all!`. ActiveFedora reindexes using only to_solr, which does not include the indexed fields that were added by Samvera::NestingIndexer from collections and works.

The Samvera::NestingIndexer method `reindex_all!` uses the `each_perservation_document_id_and_parent_ids` method defined in Hyrax's nesting_index_adapter to process each object in the repository. It uses ActiveFedora to retrieve the repository objects with priority models first, and then branches the indexing between the nesting indexer and to_solr, depending on whether or not the model includes the "CollectionNesting" module.
