---
title: "Modifying the Edit Form"
permalink: customize-metadata-edit-form.html
keywords: ["Customize", "Metadata", "Tutorial", "Forms"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

The inclusion of properties in the new/edit form is controlled by the GenericWorkForm class.  The GenericWorkForm class is generated with the basic set of properties (aka terms, aka metadata fields) to include.  The generated version of the file looks like...

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  class GenericWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GenericWork
    self.terms += [:resource_type]
  end
end
```

NOTE:
- As generated, model_class is the generated model class
- As generated, terms includes basic work terms defined in [Hyrax's work_form.rb](https://github.com/samvera/hyrax/blob/master/app/forms/hyrax/forms/work_form.rb).
- A controller class was also generated and configures form_class to be the one described here, e.g., `self.form_class = Hyrax::Forms::GenericWorkForm`


## Notable WorkForm methods

This class inherits from [Hyrax::Forms::WorkForm](https://github.com/samvera/hyrax/blob/master/app/forms/hyrax/forms/work_form.rb) which has several methods of note.

| Method | Description | Overridden? |
| ------ | ----------- | ----------- |
| terms | Returns an array of all terms that will be displayed on the form. | Common |
| required_fields | Returns an array of terms that are required and will be displayed at the top of the form (above the fold).  They will be visible when the new/edit form is initially displayed. | Common |
| primary_terms | Returns the required_fields array. | NO |
| secondary_terms | Returns the array of terms that are optional and will be displayed at the bottom of the form (below the fold).  These fields are hidden until the user clicks `Additional fields` button.  This method also removes fields that are not filled in by a user for various reasons (e.g. populated by the system, displayed on another tab, set based on data in other fields, etc.). | Sometimes |
| multiple? | Given a field, return true if it is multi-value.  This is sometimes overridden to force a basic multi-value metadata field provided by the system to be single-value. | Sometimes |
| sanitize_params | Clean up params passed back from the form.  This is sometimes overridden to put a single-value into the format of a multi-value metadata field for basic multi-value metadata that was forced to be single-value. | Sometimes |

See [Other Metadata Customizations](customize-metadata-other-customizations.html) in section [Making a default property single-value](customize-metadata-other-customizations.html#making-a-default-property-single-value) for an example of when you would override `multiple?` and `sanitize_params`.


## Adding the properties to the work-type's new/edit form

Now we want to update GenericWorkForm to include each of the new properties.  Edit `app/forms/hyrax/generic_work_form.rb` and modify `self.terms` to include all the new properties on the new/edit form.  See [Defining Metadata in the Model](customize-metadata-model.html) in section [The modified model](customize-metadata-model.html#the-modified-model) to see which properties were added as part of this tutorial.

```ruby
    self.terms += [:resource_type, :contact_email, :contact_phone, :department]
```

Optionally, you can add properties to the set of required fields.  In this example, we will require the department and contact email.
```ruby
    self.required_fields += [:department, :contact_email]
```

Optionally, you can also remove one of the basic properties defined by Hyrax from the set of required fields.  See [Other Metadata Customizations](customize-metadata-other-customizations.html) in section [Remove a default property from the set of required fields](customize-metadata-other-customizations.html#remove-a-default-property-from-the-set-of-required-fields) for an example of removing a basic metadata property from the set of required properties.


### The modified work class

The full class after the changes looks like...

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  class GenericWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GenericWork
    self.terms += [:resource_type, :contact_email, :contact_phone, :department]
    self.required_fields += [:department, :contact_email]
  end
end
```

### Default form field behavior

Default behavior:
- By adding the property to self.terms, it will be added to the new/edit form.
- Without additional customization, the field will be a text input field.  (See [Sufia's app/views/records/edit_fields/_default.html.erb](https://github.com/samvera/sufia/blob/master/app/views/records/edit_fields/_default.html.erb)
- For contact_email and department, because we did NOT set multiple: true in the model, there will be only a single value set for this property.
- For contact_phone, because we DID set multiple: true in the model, there will be an `Add another` link below these fields allowing for multiple values to be set.
- Because we added contact_email to the required_fields set, it will be displayed as required on the initial display of metadata fields on the form.
- Because we did NOT add contact_phone and department to the required_fields set, they will only display in the form when you click the `Additional Fields` button.


## Customizing the form field

To customize a form field, you create a partial with the property name under `app/views/records/edit_fields`.  Add form code to display the form as desired.  If this is the first form field customization you have made, you will need to create the `records/edit_fields` directories under `app/views`.

You can see [more examples](https://github.com/samvera/hyrax/tree/master/app/views/records/edit_fields) by exploring those created for the default fields in Sufia.

### For a single-value field (optional)

Use something similar to...
```erb
<% # app/views/records/edit_fields/_contact_email.html.erb %>
<%= f.input :contact_email, as: :email, required: f.object.required?(key),
  input_html: { class: 'form-control', multiple: false }
%>
```

### For a multi-value field (optional)

Use something similar to...
```erb
<% # app/views/records/edit_fields/_contact_phone.html.erb %>
<%= f.input :contact_phone, as: :tel, required: f.object.required?(key),
    input_html: { class: 'form-control', multiple: true }
%>
```

### For a controlled vocabulary field (required)

You must customize the creation of the form field to use autocomplete with a controlled vocabulary.  You can use one of the external authorities with access provided through the [Questioning Authority](https://github.com/samvera/questioning_authority) gem.  Or you can create your own controlled vocabulary.  This tutorial includes instructions for [defining a simple local controlled vocabulary](customize-metadata-controlled-vocabulary.html).


For a controlled-value field, you can use something similar to...

```erb
# app/views/records/edit_fields/_department.html.erb
<%= f.input :department, as: :select,
    collection: DepartmentsService.select_all_options,
    include_blank: true,
    item_helper: method(:include_current_value),
    input_html: { class: 'form-control' }
%>
```

For additional instructions, see [Hyrax Autocomplete](https://github.com/samvera/hyrax/wiki/Autocomplete-in-Hyrax).

---

<p><a href="customize-metadata-model.html"><button type="button" class="btn btn-primary">Prev: Defining Metadata in the Model</button></a>  <a href="customize-metadata-show-page.html"><button type="button" class="btn btn-primary">Next: Modifying the Show Page</button></a></p>
