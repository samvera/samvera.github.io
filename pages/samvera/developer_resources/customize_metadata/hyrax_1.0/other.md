---
title: "Other Metadata Customizations"
permalink: customize-metadata-other-customizations.html
keywords: [ "Customize", "Metadata", "Properties", "Multi-value",
            "Single-value", "Display", "Tutorial" ]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

## Modifying default Hyrax fields

### Remove a default property from the set of required fields

Edit app/forms/generic_work_form.rb  (substitute your work-type name for generic_work) and make add the following to make keyword and rights optional fields.  NOTE: This also moves these fields below all required fields and they only display on the form when the Additional Fields button is clicked.

```ruby
    self.required_fields -= [:keyword, :rights]
```

| ![warning32](https://cloud.githubusercontent.com/assets/6855473/13064700/3f18cd1a-d423-11e5-9c1e-9c52cc0024fb.png) | WARNING: Do not remove any of the core metadata fields.  Works will not save correctly without these fields.  Core metadata fields are defined as properties in [Hyrax's core_metadata.rb](https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/core_metadata.rb) |

### Making a default property single-value

By default all fields in Hyrax are repeatable. If you'd like to change this behavior for a field that Hyrax provides out of the box, you can do the following.  This example makes title, description, and publisher fields single-value.

Edit app/forms/generic_work_form.rb  (substitute your work-type name for generic_work) and make the following changes

* Override `self.multiple?(field)` and return false for any default fields you want to be single value.
* Override `self.model_attributes(_)` to cast back to multi-value when saving
* Add methods to return the field value as single-value for populating the form fields during editing

The form class after making these changes looks like...

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  class GenericWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GenericWork

    def self.multiple?(field)
      if [:title, :description, :publisher].include? field.to_sym
        false
      else
        super
      end
    end

    def self.model_attributes(_)
      attrs = super
      attrs[:title] = Array(attrs[:title]) if attrs[:title]
      attrs[:description] = Array(attrs[:description]) if attrs[:description]
      attrs[:publisher] = Array(attrs[:publisher]) if attrs[:publisher]
      attrs
    end

    def title
      super.first || ""
    end

    def description
      super.first || ""
    end

    def publisher
      super.first || ""
    end
  end
end
```


---
## Creating a Default Deposit Agreement

By default, Hyrax will ask you to accept a deposit agreement each time you upload a file. You can make this implicit by having a passive agreement instead. To do this, change the `app/config/initializers/hyrax.rb` to:

``` ruby
  config.active_deposit_agreement_acceptance = false
```

Create custom translations in your `hyrax.en.yml` locales file:

``` yml
en:
  hyrax:
    passive_consent_to_agreement: "By clicking the Save button, I am agreeing to etc..."
    deposit_agreement: "Institutional Agreement"
```

Lastly, create your own `app/views/static/agreement.html.erb` page with the content of your deposit agreement.


---
## Customizing display of Collection properties

The collection properties do not use the renderer process to control the display of properties.

To modify the display of a colleciton property...
* add a partial with the property's name to app/views/records/show_fields  (e.g. _department.html.erb)
* in that file, include markup to control the display of the field

NOTE: See [Hyrax's show_fields](https://github.com/samvera/hyrax/tree/master/app/views/records/show_fields) for examples.


---

<p><a href="customize-metadata-discovery.html"><button type="button" class="btn btn-primary">Prev: Configuring Discovery</button></a></p>
