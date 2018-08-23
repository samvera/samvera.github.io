---
title: "Metadata Application Profile"
keywords: metadata
categories: metadata
permalink: metadata_application_profile.html
folder: samvera/how-to/metadata_application_profile/hyrax_2.1/metadata_application_profile.md
sidebar: home_sidebar
tags: [development_resources]
a-z: ['Metadata Application Profile']
version:
  label: 'Hyrax v2.1.0 (also applies to Hyrax v2.0.x)'
---

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

## Basic Metadata

Basic metadata properties are defined in [app/models/concerns/hyrax/basic_metadata.rb](https://github.com/samvera/hyrax/blob/2.0-stable/app/models/concerns/hyrax/basic_metadata.rb)

| Field | Predicate | Rdf-vocab Predicate | Recommendation | Expected Value (data type) | Expected Value (Controlled Source) | Multiple | Obligation |
| -------- | --------- | -------- | -------- | -------- |-------- |-------- |-------- |
| creator | dce:creator | ::RDF::Vocab::DC11.creator | MUST (Required) | xsd:string (Literal) | n/a | TRUE | {0,n} |
| keyword | dce:relation | ::RDF::Vocab::DC11.relation | MUST (Required) | xsd:string (Literal) | n/a | TRUE | {0,n} |
| rights_statement | edm:rights | ::RDF::Vocab::EDM.rights | MUST (Required) | xsd:anyUri | Rights statements menu as YAML | FALSE | {0,n} |
| contributor | dce:contributor | ::RDF::Vocab::DC11.contributor | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| description | dce:description | ::RDF::Vocab::DC11.description | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| license | dct:rights | ::RDF::Vocab::DC.rights | MAY | xsd:anyURI | License menu as YAML | TRUE | {0,n} |
| publisher | dce:publisher | ::RDF::Vocab::DC11.publisher | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| date_created | dct:created | ::RDF::Vocab::DC.created | MAY | xsd:date or xsd:dateTime xsd:string (Literal) | n/a | TRUE | {0,n} |
| subject | dce:subject | ::RDF::Vocab::DC11.subject | MAY | xsd:string (Literal) | n/a (but existing vocab encouraged) | TRUE | {0,n} |
| language | dce:language | ::RDF::Vocab::DC11.language | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| identifier | dct:identifier | ::RDF::Vocab::DC.identifier | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| based_near | foaf:basedNear | ::RDF::Vocab::FOAF.based_near | MAY | xsd:anyURI | GeoNames web service | TRUE | {0,n} |
| related_url | rdfs:seeAlso | ::RDF::RDFS.seeAlso | MAY | xsd:string or xsd:anyURI | n/a | TRUE | {0,n} |
| source | dct:source | ::RDF::Vocab::DC.source | MAY | xsd:string (Literal) | n/a | TRUE | {0,n} |
| resource_type | dct:type | ::RDF::Vocab::DC.type | MAY | xsd:string (Literal) | Type menu as YAML | TRUE | {0,n} |












