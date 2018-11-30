---
title: "Technology Stack"
permalink: our_technology_stack.html
keywords: [ "Hyrax", "Front End", "Blacklight", "Rails", "Hydra Editor", "Search",
            "Persistence", "Solr", "Fedora", "Middleware", "Hydra Head", "Ldp", "Plugins" ]
last_updated:
tags: [getting_started]
summary: "An introduction to the technologies used in Samvera"
folder: samvera/getting_started/
---

![Architecture Diagram](https://wiki.duraspace.org/download/attachments/87460044/hydra_9_architecture_2016.png?version=1&modificationDate=1497776440777&api=v2)

## Hyrax

If you are starting a new Samvera project, we strongly recommend you start with [Hyrax](http://hyr.ax/about/).

At the top of our architecture diagram is "Samvera Applications." Broadly, these are [Ruby on Rails](http://rubyonrails.org/) based applications that follow Samvera conventions. While it is possible to create your own Samvera application by assembling the right components, and this has been a common practice in the Samvera community in the past, ongoing maintenance of home grown solutions will be more expensive than sharing maintenance costs with the rest of the community. We are in the process of focusing our community development efforts on Hyrax, and that will be the code base we are best able to support and maintain.

## Fedora 4

We use [Fedora 4](http://fedorarepository.org/) as our persistence layer. This is where the actual content and its associated metadata (or pointers to them) are stored. Interaction with Fedora happens via an HTTP API. Fedora 4 stores content as linked data.

## Solr

We use [Apache Solr](http://lucene.apache.org/solr/) for our search. Content from Fedora is indexed into solr via [ActiveFedora](https://github.com/samvera/active_fedora), one of our middleware gems. Interaction with solr also happens via an HTTP API.

## Middleware

### hydra-head

[Hydra-Head](https://github.com/samvera/hydra-head) is a Ruby-on-Rails gem containing the core code for a web application using the full stack of samvera building blocks.

### active_fedora

Ruby on Rails usually follows the [Active Record](http://guides.rubyonrails.org/active_record_basics.html) pattern to persist objects to a database. We instead use [ActiveFedora](https://github.com/samvera/active_fedora) to persist objects to Fedora.

### ldp

We use a ruby gem called [ldp](https://github.com/samvera/ldp) to implement the LDP ([Linked Data Platform](http://www.dataversity.net/introduction-linked-data-platform/)) interaction patterns for interaction with Fedora 4.

You can read more about how we use LDP containers [here](https://github.com/samvera/hydra/wiki/LDP-Containers-for-the-perplexed).

### rsolr

[Rsolr](https://github.com/rsolr/rsolr) is a ruby client for solr.

### blacklight

Much of our search and display behavior is inherited from [Blacklight](http://projectblacklight.org/). Many Samvera institutions also run Blacklight applications separately from Samvera, to provide search and discovery for their collections. The Blacklight Project also has many of its own plugins, such as [Spotlight](http://spotlight.projectblacklight.org/), for building virtual exhibits, and [GeoBlacklight](http://geoblacklight.org/), which enhances Blacklight for use with geospatial data.

## Plugins

### derivatives

A gem to create [derivatives](https://github.com/samvera/hydra-derivatives) for uploaded content. This might include, for example, generating thumbnails for large images, down-sampled audio and video for web steaming, or thumbnail snapshots of PDF documents.

### editor

[Hydra-editor](https://github.com/samvera/hydra-editor) is a basic editor for samvera objects.

### browse-everything

[Browse-everything](https://github.com/samvera/browse-everything) is a rails engine providing access to files in cloud storage. Currently there are drivers implemented for Dropbox, Skydrive, Google Drive, Box, and a server-side directory share.

### file-characterization

[hydra-file_characterization](https://github.com/samvera/hydra-file_characterization) uses [fits](https://github.com/harvard-lts/fits) to characterize files and extract metadata about them. It might tell you what kind of image encoding an image uses, along with it's height and width for example.
