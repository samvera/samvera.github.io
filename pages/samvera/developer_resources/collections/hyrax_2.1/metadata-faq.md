---
title: "FAQ - Collection Metadata"
keywords: Metadata, Collection, FAQ
categories: How to Do All the Things
permalink: collection-metadata-faq.html
folder: samvera/how-to/collection_extensions/hyrax_2.1/metadata-faq.md
sidebar: home_sidebar
tags: [development_resources]
a-z: ['FAQ - Collection Metadata', 'Collections - Metadata', 'Metadata for Collections']
version:
  label: 'Hyrax v2.1.0.beta1'
  branch:
    label: 'master'
    link: 'https://github.com/samvera/hyrax/tree/master'
---

### What metadata is included in collections by default?

* Core: [Hyrax::CoreMetadata](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/core_metadata.rb)
* Basic: [Hyrax::BasicMetadata](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/basic_metadata.rb)

### How can I change the metadata fields used for collections?

The Collection class is generated in your app at `/app/models/collection.rb` when you install Hyrax.  This class...
 * includes [Hyrax::CollectionBehavior](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/collection_behavior.rb) which includes [Hyrax::CoreMetadata](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/core_metadata.rb).  The core metadata can not be removed or changed.
 * includes [Hyrax::BasicMetadata](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/basic_metadata.rb).  You can optionally remove this include.
 * is the location to add your custom metadata property definitions for collections

### Can I specify different metadata for each collection type?

No, all collections of all types have the same metadata fields defined.

There were requests for having type specific metadata.  It was identified as a lower priority than other functionality.  For the initial implementation of collection extensions, changes to metatata were not addressed.  If this is determined to be a priority, it can be part of a future release.
