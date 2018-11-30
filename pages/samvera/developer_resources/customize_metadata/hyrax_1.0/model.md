---
title: "Defining Metadata in the Model"
permalink: customize-metadata-model.html
keywords: ["Customize", "Metadata", "Work Type", "Model", "Tutorial"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

The GenericWork class is generated with some default metadata, but we want to update it with our own metadata.  The generated version of the file looks like...

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`
class GenericWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }
end
```

## Basic and Core metadata

### Basic metadata

Basic metadata properties are defined in [app/models/concerns/hyrax/basic_metadata.rb](https://github.com/samvera/hyrax/blob/1-0-stable/app/models/concerns/hyrax/basic_metadata.rb)

| Property | Predicate | Multiple |
| -------- | --------- | -------- |
| label | ActiveFedora::RDF::Fcrepo::Model.downloadFilename | **FALSE** |
| relative_path | ::RDF::URI.new('http://scholarsphere.psu.edu/ns#relativePath') | **FALSE** |
| import_url | ::RDF::URI.new('http://scholarsphere.psu.edu/ns#importUrl') | **FALSE** |
| part_of | ::RDF::Vocab::DC.isPartOf | TRUE |
| resource_type | ::RDF::Vocab::DC.type | TRUE |
| creator | ::RDF::Vocab::DC11.creator | TRUE |
| contributor | ::RDF::Vocab::DC11.contributor | TRUE |
| description | ::RDF::Vocab::DC11.description | TRUE |
| keyword | ::RDF::Vocab::DC11.relation | TRUE |
| rights | ::RDF::Vocab::DC.rights | TRUE |
| rights_statement | ::RDF::Vocab::EDM.rights | TRUE |
| publisher | ::RDF::Vocab::DC11.publisher | TRUE |
| date_created | ::RDF::Vocab::DC.created | TRUE |
| subject | ::RDF::Vocab::DC11.subject | TRUE |
| language | ::RDF::Vocab::DC11.language | TRUE |
| identifier | ::RDF::Vocab::DC.identifier | TRUE |
| based_near | ::RDF::Vocab::FOAF.based_near | TRUE |
| related_url | ::RDF::RDFS.seeAlso | TRUE |
| bibliographic_citation | ::RDF::Vocab::DC.bibliographicCitation | TRUE |
| source | ::RDF::Vocab::DC.source | TRUE |

### Core metadata

Core metadata properties (**_that should never be removed_**) are defined in [app/models/concerns/hyrax/required_metadata.rb](https://github.com/samvera/hyrax/blob/1-0-stable/app/models/concerns/hyrax/required_metadata.rb)

| Property | Predicate | Multiple |
| -------- | --------- | -------- |
| depositor | ::RDF::URI.new('http://id.loc.gov/vocabulary/relators/dpt') | **FALSE** |
| title | ::RDF::Vocab::DC.title | TRUE |
| date_uploaded | ::RDF::Vocab::DC.dateSubmitted | **FALSE** |
| date_modified | ::RDF::Vocab::DC.modified | **FALSE** |

## Extend the model

### To add a new single-value property

To define a property that has a single text value, add the following to the GenericWork model.
```ruby
  property :contact_email, predicate: ::RDF::Vocab::VCARD.hasEmail, multiple: false do |index|
    index.as :stored_searchable
  end
```

- It will be limited to a single value (set multiple: true  or leave off for multi-value, which is the default behavior)
- If included in the new/edit form, it will have `input type=text`  (There is a bit more configuration under section [Add the new single-value property to the new/edit form](#add-the-new-single-value-property-to-the-newedit-form) to have this included in the form.)
- By setting `index.as :stored_searchable`, values will be added to the solr_doc as contact_email_tesi indicating this field is English text (te), stored (s), indexed (i)
  - See [Solr Schema](https://github.com/samvera/hydra-head/wiki/Solr-Schema) documentation for more information on dynamic solr field postfixes.
  - See [Solrizer::DefaultDescriptors](http://www.rubydoc.info/gems/solrizer/3.4.0/Solrizer/DefaultDescriptors) documentation for more information on values for `index.as`


| ![QUESTION](https://cloud.githubusercontent.com/assets/6855473/13064236/f2f04cbe-d41e-11e5-9674-e9a56a6326e6.png) | Are all values described in Solrizer::DefaultDescriptors supported within Hyrax property definitions? |


### To add a new multi-value property

To define a property that has multiple text values, add the following to the GenericWork model.

```ruby
  property :contact_phone, predicate: ::RDF::Vocab::VCARD.hasTelephone do |index|
    index.as :stored_searchable
  end
```

Expected behaviors for this property:
- Can have one or more values assigned.  NOTE: By default properties are multi-value.  You can also explicitly state this by adding `, multiple: true` before `do |index|`
- The remaining basic behaviors are the same as for single-value properties.  See more information under [Add the new single-value property to the model](#add-the-new-single-value-property-to-the-model) Expected behaviors.


### To add a new controlled vocabulary property

The process for adding a propery whose value comes from a controlled vocabulary is identical to that of the single and multi-value properties.  We will add a single-value controlled vocabulary field here so that it is available for use in later examples.

```ruby
  property :department, predicate: ::RDF::URI.new("http://lib.my.edu/departments"), multiple: false do |index|
    index.as :stored_searchable, :facetable
  end
```

Expected behaviors for this property:
- The behaviors are the same as for single-value properties because we set the property up to be single-value.  If this were multi-value, it would follow the behaviors of a multi-value field.


## The modified model

With all three properties added, the GenericWork now looks like:

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`
class GenericWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :contact_email, predicate: ::RDF::Vocab::VCARD.hasEmail, multiple: false do |index|
    index.as :stored_searchable
  end

  property :contact_phone, predicate: ::RDF::Vocab::VCARD.hasTelephone do |index|
    index.as :stored_searchable
  end

  property :department, predicate: ::RDF::URI.new("http://lib.my.edu/departments"), multiple: false do |index|
    index.as :stored_searchable, :facetable
  end
end
```

---

<p><a href="customize-metadata-controller.html"><button type="button" class="btn btn-primary">Prev: Understanding the Controller</button></a>  <a href="customize-metadata-edit-form.html"><button type="button" class="btn btn-primary">Next: Modifying the Edit Form</button></a></p>
