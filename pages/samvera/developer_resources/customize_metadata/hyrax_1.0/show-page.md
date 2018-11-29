---
title: "Modifying the Show Page"
permalink: customize-metadata-show-page.html
keywords: ["Customize", "Metadata", "Show Page", "Works", "Tutorial"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

## Default properties for the show page

By default, the new properties will **NOT** be displayed on the show page for works of this type.   If you do nothing, which properties will be on the show page is guided by [Hyrax::WorkShowPresenter](https://github.com/samvera/hyrax/blob/master/app/presenters/hyrax/work_show_presenter.rb) class.  Look for the property names delegated to the solr_document near the top of the file.


## Create a custom presenter class.

To add your custom metadata to the show page, first you have to create a custom presenter class.  NOTE: This class is NOT created when you generate the work type.


### The custom presenter class

Create the following as a starting point for the custom presenter class.

```ruby
# app/presenters/generic_work_presenter.rb
class GenericWorkPresenter < Hyrax::WorkShowPresenter
end
```

Assign the presenter class in the generated controller.  Edit `app/controllers/hyrax/generic_work_controller.rb` and add the following line under the curation_concern_type assignment.

```ruby
  self.show_presenter = GenericWorkPresenter
```

### The modified controller class

The controller class now looks like...

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`

module Hyrax
  class GenericWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = GenericWork
    self.show_presenter = GenericWorkPresenter
  end
end
```


## Get the value from Solr

### Delegate retrieval to solr_document

Edit the custom presenter class (e.g. `app/presenters/generic_work_presenter.rb`) and delegate the retrieval of properties to solr_document for each of the properties to be displayed.

```ruby
  delegate :contact_email, :contact_phone, :department, to: :solr_document
```

### The modified presenter class

The full custom presenter class now looks like...

```ruby
# app/presenters/generic_work_presenter.rb
class GenericWorkPresenter < Hyrax::WorkShowPresenter
  delegate :contact_email, :contact_phone, :department, to: :solr_document
end
```

### Create methods to retrieve properties from solr

Edit `app/models/solr_document.rb` and add a method to retrieve each property's value from the solr doc.  NOTE: Use Solrizer.solr_name to generate the solr field name for each property.

```ruby
def contact_email
  self[Solrizer.solr_name('contact_email')]
end

def contact_phone
  self[Solrizer.solr_name('contact_phone')]
end

def department
  self[Solrizer.solr_name('department')]
end
```

## Add the properties to the show page

### Add to set of attributes to display

If this is the first custom property added to the show page, you will need to copy [Hyrax's `app/views/hyrax/base/_attribute_rows.html.erb`](https://github.com/samvera/hyrax/blob/master/app/views/hyrax/base/_attribute_rows.html.erb) to the same directory structure in your app.  NOTE: The link goes to master.  Make sure you copy from the release/branch of Hyrax that your app has installed.

Add the properties to the local copy of `app/views/curation_concerns/base/_attribute_rows.html.erb`
```erb
<%= presenter.attribute_to_html(:contact_email) %>
<%= presenter.attribute_to_html(:contact_phone) %>
<%= presenter.attribute_to_html(:department) %>
```

<!-- TODO: REMOVE THIS SECTION -- I don't think it is necessary anymore to add_show_field in blacklight controller.  -->
<!--
### Configure Blacklight to show the property on the show page

Edit `app/controllers/catalog_controller.rb` and look for the section including `add_show_field` statements.  Add the following:

```ruby
config.add_show_field solr_name("contact_email", :stored_searchable), label: "Contact Email"
config.add_show_field solr_name("contact_phone", :stored_searchable), label: "Contact Phone"
config.add_show_field solr_name("department", :stored_searchable), label: "Department"
```
-->

### Default display behavior

Each value for the property, in this case the single value, will be displayed using a `<span>` tag.  See [Hyrax's default AttributeRenderer](https://github.com/samvera/hyrax/blob/master/app/renderers/hyrax/renderers/attribute_renderer.rb).


## Customizing the property display

Optionally, you can customize the display of the property value on the show page.

### Using an existing renderer

There are a number of common renderers already defined and in use within the Hyrax app.  You can use these existing renderers for your fields.  See [Hyrax's renderers](https://github.com/samvera/hyrax/tree/master/app/renderers/hyrax/renderers) for existing renderers.

To use an existing renderer (e.g. (`FacetedAttributeRender`)[https://github.com/samvera/hyrax/blob/master/app/renderers/hyrax/renderers/faceted_attribute_renderer.rb]) add the attribute to `app/views/hyrax/base/_attribute_rows.html.erb` using `render_as`.

```erb
<%= presenter.attribute_to_html(:contact_email, render_as: :faceted) %>
```

### Write a general reusable custom renderer

A custom renderer can be written for a type of attribute, like an email or phone number, that can be used with multiple properties or a one-off renderer for a specific property.  The process is the same for both.

To define a general renderer for all email properties...
```erb
# app/renderers/email_attribute_renderer.rb
class EmailAttributeRenderer < CurationConcerns::Renderers::AttributeRenderer
  def attribute_value_to_html(value)
    %(<span itemprop="email"><a href="mailto:#{value}">#{value}</a></span>)
  end
end
```

To define a general renderer for all phone properties...
```erb
# app/renderers/phone_attribute_renderer.rb
class PhoneAttributeRenderer < CurationConcerns::Renderers::AttributeRenderer
  def attribute_value_to_html(value)
    %(<span itemprop="telephone"><a href="tel:#{value}">#{value}</a></span>)
  end
end
```

Identify the renderer to use for each property.  Edit the definition in the local copy of `app/views/curation_concerns/base/_attribute_rows.html.erb` and add the `render_as` parameter for the properties.
```erb
<%= presenter.attribute_to_html(:contact_email, render_as: :email) %>
<%= presenter.attribute_to_html(:contact_phone, render_as: :phone) %>
```

NOTES:
* The class name must begin with the renderer name and end with AttributeRenderer.
* To identify a renderer, use the renderer name (everything upto, but not including AttributeRenderer)
* You can use one of the renderers defined in Hyrax.
* You can make more complex renderers.  See Hyrax defined renderers for examples.
* See [Hyrax defined renderers](https://github.com/samvera/hyrax/tree/master/app/renderers/hyrax/renderers).


### Write a property specific custom renderer

For controlled vocabularies, the value for the metadata field is the ID of the term.  If the ID and TERM are the same, then you can use the default display behavior.  Otherwise, you need a renderer that will use the controlled vocabularies service to retrieve the TERM value given the ID.

Define a new renderer to convert the value from the controlled value's ID to its TERM.  The renderer in this case will be specific to the controlled value property.

To define a property specific renderer for the department property...
```erb
# app/renderers/department_attribute_renderer.rb
class DepartmentAttributeRenderer < CurationConcerns::Renderers::AttributeRenderer
  def attribute_value_to_html(value)
    %(<span itemprop="department">#{::DepartmentsService.label(value)}</span>)
  end
end

```

Identify the renderer to use for the property.  Edit the definition in the local copy of app/views/curation_concerns/base/_attribute_rows.html.erb and add the render_as parameter for the property.
```erb
<%= presenter.attribute_to_html(:department, render_as: :department) %>
```

---

<p><a href="customize-metadata-edit-form.html"><button type="button" class="btn btn-primary">Prev: Modifying the Edit Form</button></a>  <a href="customize-metadata-discovery.html"><button type="button" class="btn btn-primary">Next: Configuring Discovery</button></a></p>
