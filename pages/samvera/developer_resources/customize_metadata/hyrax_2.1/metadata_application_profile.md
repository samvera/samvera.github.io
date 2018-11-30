---
title: "Metadata Application Profile"
permalink: metadata_application_profile.html
keywords: ['Metadata', 'Customize']
last_updated:
version:
  id: 'hyrax_2.1-stable'
  label: 'Hyrax v2.1'
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

Distinction: The [MUST out of the box](https://github.com/samvera/hyrax/blob/master/app/forms/hyrax/forms/work_form.rb#L33) is a slightly different set of things from what is in Core.

Reference: Local controlled vocabularies and forms pulled in here: [https://github.com/samvera/hyrax/blob/4fd8d9ad3c32db7deffc3b5246af5d1459a4b046/lib/generators/hyrax/config_generator.rb](https://github.com/samvera/hyrax/blob/4fd8d9ad3c32db7deffc3b5246af5d1459a4b046/lib/generators/hyrax/config_generator.rb)

## Basic Metadata

Basic metadata properties are defined in [app/models/concerns/hyrax/basic_metadata.rb](https://github.com/samvera/hyrax/blob/2.0-stable/app/models/concerns/hyrax/basic_metadata.rb)

| Property (Field) | Predicate | Rdf-vocab Predicate | Recommendation | Expected Value (Data Type) | Expected Value (Controlled Source) | Multiple | Obligation |
| ---------------- | --------- | -------- | -------- | -------- | -------- | -------- | -------- |
| creator          | dce:creator | ::RDF::Vocab::DC11.creator | MUST (Required) | xsd:string (Literal) | n/a | TRUE | {1,n} |
| keyword          | dce:relation | ::RDF::Vocab::DC11.relation | MUST (Required) | xsd:string (Literal) | n/a | TRUE | {1,n} |
| rights_statement | edm:rights | ::RDF::Vocab::EDM.rights | MUST (Required) | xsd:anyUri | Rights statements menu as YAML | **FALSE** | {1} |
| contributor      | dce:contributor | ::RDF::Vocab::DC11.contributor | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| description      | dce:description | ::RDF::Vocab::DC11.description | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| license          | dct:rights | ::RDF::Vocab::DC.rights | MAY | xsd:anyURI | License menu as YAML | TRUE | {0,n} |
| publisher        | dce:publisher | ::RDF::Vocab::DC11.publisher | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| date_created     | dct:created | ::RDF::Vocab::DC.created | MAY | xsd:date or xsd:dateTime xsd:string (Literal) | n/a | TRUE | {0,n} |
| subject          | dce:subject | ::RDF::Vocab::DC11.subject | MAY | xsd:string (Literal) | n/a (but existing vocab encouraged) | TRUE | {0,n} |
| language         | dce:language | ::RDF::Vocab::DC11.language | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| identifier       | dct:identifier | ::RDF::Vocab::DC.identifier | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| based_near | foaf:basedNear | ::RDF::Vocab::FOAF.based_near | MAY | xsd:anyURI | GeoNames web service | TRUE | {0,n} |
| related_url      | rdfs:seeAlso | ::RDF::RDFS.seeAlso | MAY | xsd:string or xsd:anyURI | n/a | TRUE | {0,n} |
| source           | dct:source | ::RDF::Vocab::DC.source | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| resource_type    | dct:type | ::RDF::Vocab::DC.type | MAY | xsd:string (Literal) | Type menu as YAML | TRUE | {0,n} |

## Core Metadata

Core metadata properties (**_that should never be removed_**) are defined in [app/models/concerns/hyrax/core_metadata.rb](https://github.com/samvera/hyrax/blob/2.0-stable/app/models/concerns/hyrax/core_metadata.rb)


| Property (Field) | Predicate | Rdf-vocab Predicate | Recommendation | Expected Value (Data Type) | Expected Value (Controlled Source) | Multiple | Obligation |
| -------- | --------- | -------- | -------- | -------- | -------- | -------- | -------- |
| title | dct:title | ::RDF::Vocab::DC.title | MUST (Required) | xsd:string (Literal) | n/a | TRUE | {1,n} |
| depositor | mrel:dpt | ::RDF::URI.new('http://id.loc.gov/vocabulary/relators/dpt') | MUST (Required) | user | n/a | **FALSE** | {1} |
| date_uploaded | dct:dateSubmitted | ::RDF::Vocab::DC.dateSubmitted | MUST (Required) | Literal | n/a | **FALSE** | {1} |
| date_modified | dct:modified | ::RDF::Vocab::DC.modified | MUST (Required) | Literal | n/a | **FALSE** | {1} |
