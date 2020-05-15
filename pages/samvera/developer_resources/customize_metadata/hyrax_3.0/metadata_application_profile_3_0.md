---
title: "Metadata Application Profile"
permalink: metadata_application_profile_3_0.html
keywords: ['Metadata', 'Customize']
last_updated:
version:
  versions:
    - id: 'hyrax_2.1-stable'
      label: 'Hyrax v2.1'
      link: 'metadata_application_profile.html'
    - label: 'Hyrax v3.0'
      link: 'metadata_application_profile_3_0.html'
      selected: 'true'
tags: [development_resources]
summary: "Describes the metadata properties provided in Hyrax upon default installation, and the core properties required for Hyrax to function correctly"
sidebar: home_sidebar
---

<style>
  table {
    white-space: nowrap;
  }
</style>


The following Metadata Application Profile lists properties provided by Hyrax by default upon installation. Core Metadata are properties required for Hyrax to function correctly. Basic Metadata properties listed as Required are configured for validation. Basic Metadata properties can be modified within Hyrax but Core Metadata properties cannot be modified. This profile also applies to Hyrax v2.0. More details and links to code available below.

A list of fields is provided below for both Basic and Core metadata. An expanded version of this documentation is linked providing more information per field than can be readily shown on this page. New fields for Hyrax 3 are indicated with _italics_. Fields are listed in the order they appear in the Hyrax Work form by default.

## Namespaces

| Predicate Prefix | Rdf-vocab Predicate Prefix | Namespace |
| -------- | --------- | -------- |
| dce: | DC11: | http://purl.org/dc/elements/1.1/ |
| dct: | DC: | http://purl.org/dc/terms/ |
| edm: | EDM: | http://www.europeana.eu/schemas/edm/ |
| foaf: | FOAF: | http://xmlns.com/foaf/0.1/ |
| rdfs: | RDFS: | http://www.w3.org/2000/01/rdf-schema# |
| xsd: | | http://www.w3.org/2001/XMLSchema# |
| mrel: | | http://id.loc.gov/vocabulary/relators/ |
| schema: | SCHEMA: | https://schema.org/ |

Distinction: The [MUST out of the box](https://github.com/samvera/hyrax/blob/master/app/forms/hyrax/forms/work_form.rb#L33) is a slightly different set of things from what is in Core.

Reference: Local controlled vocabularies and forms pulled in here: [https://github.com/samvera/hyrax/blob/4fd8d9ad3c32db7deffc3b5246af5d1459a4b046/lib/generators/hyrax/config_generator.rb](https://github.com/samvera/hyrax/blob/4fd8d9ad3c32db7deffc3b5246af5d1459a4b046/lib/generators/hyrax/config_generator.rb)

## Basic Metadata

Basic metadata properties are defined in [app/models/concerns/hyrax/basic_metadata.rb](https://github.com/samvera/hyrax/blob/2.0-stable/app/models/concerns/hyrax/basic_metadata.rb)

[Expanded documentation for Hyrax Basic Metadata](https://docs.google.com/spreadsheets/d/1yZZvoQG6lANyqinMlxuOWT4W4ZIIyBJVrSii5laxEm4/edit?usp=sharing)

| Property (Field) | Predicate | Rdf-vocab Predicate | Recommendation | Expected Value (Data Type) |
| ---------------- | --------- | -------- | -------- | -------- | 
| creator          | dce:creator | ::RDF::Vocab::DC11.creator | MUST (Required) | xsd:string (Literal) |
| rights_statement | edm:rights | ::RDF::Vocab::EDM.rights | MUST (Required) | xsd:anyUri |
| contributor      | dce:contributor | ::RDF::Vocab::DC11.contributor | MAY | xsd:string (Literal) |
| description      | dce:description | ::RDF::Vocab::DC11.description | MAY | xsd:string (Literal) |
| _abstract_         | dct:abstract | ::RDF::Vocab::DC.abstract | MAY | xsd:string (Literal) |
| keyword          | schema:keywords | ::RDF::Vocab::SCHEMA.keywords | MAY | xsd:string (Literal) |
| license          | dct:license | ::RDF::Vocab::DC.license | MAY | xsd:anyURI |
| _access_right_     | dct:accessRights | ::RDF::Vocab::DC.accessRights | MAY | xsd:string (Literal) |
| _rights_notes_     | dct:rights | ::RDF::Vocab::DC.rights | MAY | xsd:string (Literal) |
| publisher        | dce:publisher | ::RDF::Vocab::DC11.publisher | MAY | xsd:string (Literal) |
| date_created     | dct:created | ::RDF::Vocab::DC.created | MAY | xsd:date or xsd:dateTime xsd:string (Literal) |
| subject          | dce:subject | ::RDF::Vocab::DC11.subject | MAY | xsd:string (Literal) |
| language         | dce:language | ::RDF::Vocab::DC11.language | MAY | xsd:string (Literal) |
| identifier       | dct:identifier | ::RDF::Vocab::DC.identifier | MAY | xsd:string (Literal) |
| based_near       | foaf:basedNear | ::RDF::Vocab::FOAF.based_near | MAY | xsd:anyURI |
| related_url      | rdfs:seeAlso | ::RDF::RDFS.seeAlso | MAY | xsd:string or xsd:anyURI |
| source           | dct:source | ::RDF::Vocab::DC.source | MAY | xsd:string (Literal) |
| resource_type    | dct:type | ::RDF::Vocab::DC.type | MAY | xsd:string (Literal) |
| alternative_title* | dct:alternative | ::RDF::Vocab::DC.alternative | MAY | xsd:string (Literal) |
| bibliographic_citation* | dct:bibliographicCitation | ::RDF::Vocab::DC.biliographic_citation | MAY | xsd:string (Literal) |

Asterisks(*) indicate fields that are included as defined metadata properties but are not shown in the Hyrax Work form by default.

## Core Metadata

Core metadata properties (**_that should never be removed_**) are defined in [app/models/concerns/hyrax/core_metadata.rb](https://github.com/samvera/hyrax/blob/2.0-stable/app/models/concerns/hyrax/core_metadata.rb)

[Expanded documentation for Hyrax Core Metadata](https://docs.google.com/spreadsheets/d/1yZZvoQG6lANyqinMlxuOWT4W4ZIIyBJVrSii5laxEm4/edit#gid=1559174934)


| Property (Field) | Predicate | Rdf-vocab Predicate | Recommendation | Expected Value (Data Type) |
| -------- | --------- | -------- | -------- | -------- |
| title | dct:title | ::RDF::Vocab::DC.title | MUST (Required) | xsd:string (Literal) |
| depositor | mrel:dpt | ::RDF::URI.new('http://id.loc.gov/vocabulary/relators/dpt') | MUST (Required) | user |
| date_uploaded | dct:dateSubmitted | ::RDF::Vocab::DC.dateSubmitted | MUST (Required) | Literal |
| date_modified | dct:modified | ::RDF::Vocab::DC.modified | MUST (Required) | Literal |
