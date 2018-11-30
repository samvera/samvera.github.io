---
title: "External Binaries"
permalink: external_binaries.html
keywords: ['External Storage', 'Binaries', 'Sufia', 'Customize']
last_updated:
tags: [development_resources]
summary: 'A guide to some custom development in Sufia, related to storing binary content in a filesystem rather than Fedora'
version:
  label: 'Sufia 7 (May apply to Hyrax but YMMV)'
  branch:
    label: 'Sufia 7.4.1'
    link: 'https://github.com/samvera/sufia/tree/v7.4.1'
sidebar: home_sidebar
---

# Storing binaries externally

Some large repositories have found it desirable to store binary content in a
filesystem instead of in Fedora 4. Reasons for this might include ease of migration,
preservation strategy, performance, and horizontal scalability. Unfortunately,
this is not an out-of-the-box feature, and will require some custom development.
This guide was written during the migration of [ScholarSphere](https://scholarsphere.psu.edu/), a Sufia 7 repository
at Penn State University Library. Code examples can be found at the [ScholarSphere github repository](https://github.com/psu-stewardship/scholarsphere).

**Goal:** In a Sufia 7 / Fedora 4 application, store binary content externally to Fedora. The application should continue to function as usual. This general pattern should be applicable to Hyrax applications as well, but has not been tested there.

## Summary of this solution:
  1. Binary content is stored on a filesystem to which the self-deposit application can write. In this case, /opt/heracles/binaries. This location is set via an environment variable, REPOSITORY_FILESTORE
  1. Files are stored in a pair tree directory structure. For example, a FileSet with id `ht722h861h` would be stored on the filesystem at `/opt/heracles/binaries/ht/72/2h/86/ht722h861h/`
  1. Within the pairtree, files are stored in a `bagit` format with a sha256 checksum
  1. Binary content in the expected directory is available via a web server. Our above example would be available at `https://dce-fedora.vmhost.psu.edu/binaries/ht/72/2h/86/ht722h861h/data/world.png`. The address and port of the webserver are set via an environment variable, `REPOSITORY_FILESTORE_HOST`
  1. External filestore functionality is controlled by an environment variable, `REPOSITORY_EXTERNAL_FILES`, and only enabled if that variable is set to ‘true’.
  1. Fedora objects use [Fedora’s External Content feature](https://wiki.duraspace.org/display/FEDORA45/External+Content). When the Fedora object is created, it stores a URL in the `mime-type` field. When the object is retrieved, it delivers a 307 redirect to the file’s URL.
  1. A one-time data migration is required. In order to store all content (including previous versions) externally, leaving no binary content in Fedora, we loop through all objects, store the binary content of each file version in a local tempfile, delete each file version in fedora, and re-create each file version with external content.
  1. SHA1 checksums (as calculated by Fedora) are recorded before migration, and after migration are compared to re-calculated checksums of the file as written to disk. Note that the fedora checksum service will not work against externally managed files, so once you've converted to external binary storage you need to have another way of tracking fixity.
  1. We do not attempt to migrate objects that have already been migrated
  1. We rescue any errors that happen in the migration process and add them to a log that can be re-processed


## How to do it
A writeup of this work is available at [https://docs.google.com/document/d/13RXoWPvBfsaKsI-miFXjcbduVQ-SbKANN0yHGBVatB8](https://docs.google.com/document/d/13RXoWPvBfsaKsI-miFXjcbduVQ-SbKANN0yHGBVatB8)
