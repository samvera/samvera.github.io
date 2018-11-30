---
title: "Presenters Design Pattern"
permalink: patterns-presenters.html
keywords: ["Design Patterns", "Presenters"]
last_updated:
sidebar: home_sidebar
---

# Understanding the Presenters Design Pattern

<ul class='info'><li><b>Primary Goal: Isolate views from business logic code.</b></li></ul>

## Characteristics:
* Presenters are used to hide implementation details from views.  They serve as a go-between for controllers and views.
* Presenters provide access to controller instance variables.
* `@presenter` should be the only instance variable accessed in the view.
* `@presenter` can be passed as `presenter` to partials rendered from the primary view.
* The same presenter can be shared by multiple views and partials.
* Presenters are _not_ used for new/edit forms. Instead, Form objects are used. Form objects work similarly to Presenters, but include some additional features for dealing with forms, such as specifying which fields should be required.

This documentation uses object show page presenters to highlight some characteristics of presenters.  Show page presenters are the most common to customize with overrides ond extensions.

## A deeper dive into some of the show page presenters methods

Show pages are views that display information for a single object in the repository.  Show page presenters you may want to explore are...

* [app/presenters/hyrax/admin_set_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/admin_set_presenter.rb)
* [app/presenters/hyrax/collection_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_presenter.rb)
* [app/presenters/hyrax/work_show_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/work_show_presenter.rb)
* [app/presenters/hyrax/file_set_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/file_set_presenter.rb)
* [app/presenters/hyrax/presents_attributes.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/presents_attributes.rb)

### Delegate retrieval to solr_document

Access to property values is provided by the solr document.  To allow presenters to surface these values, the metadata access methods are delegated to `solr_document`.  All the show page presenters use delegation in this way.

*Example Default*

[actual default for works](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/work_show_presenter.rb#L38-L42)

```ruby
    # Metadata Methods
    delegate :title, :date_created, :description,
             :creator, :contributor, :subject, :publisher, :language, :embargo_release_date,
             :lease_expiration_date, :license, :source, :rights_statement, :thumbnail_id, :representative_id,
             :rendering_ids, :member_of_collection_ids, to: :solr_document
```

*Example Extension*

The original delegations still exist.  The following is an example of adding more delegations for custom metadata fields.

```ruby
  # Custom Metadata Methods
  delegate :contact_email, :contact_phone, :department, to: :solr_document
```

### Specify which properties to show

For works, this is not determined by the presenter.  It is determined by [app/views/curation_concerns/base/_attribute_rows.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/hyrax/base/_attribute_rows.html.erb).  For more information on updating `_attribute_rows.html.erb`, see the Customizing Metadata tutorial's lesson on <a href="customize-metadata-show-page.html">Modifying the Show Page</a>.

For collections, this is determined by the `terms` method in the presenter.

*Example Default*

[actual default for collections](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_show_presenter.rb#L41-L46)

```ruby
    # Terms is the list of fields displayed by
    # app/views/collections/_show_descriptions.html.erb
    def self.terms
      [:total_items, :size, :resource_type, :creator, :contributor, :keyword, :license, :publisher, :date_created, :subject,
       :language, :identifier, :based_near, :related_url]
    end
```

*Example Override*

In this case, the `terms` method is completely overridden and only the terms defined in this `self.terms` will be displayed. In this example, a few of the default properties are included and custom properties are added.  Any default property not included in this list will not be shown on the collection show page.

```ruby
    # Terms is the list of fields displayed by
    # app/views/collections/_show_descriptions.html.erb
    def self.terms
      [:total_items, :size, :contact_email, :contact_phone, :department, :keyword]
    end
```

### Hiding terms with blank values

By default, terms with blank values are hidden.

* For works, I do not know if you can change this.
* For collections, the hiding of terms with blank values is controlled by the `terms_with_values` method.

*Example Default*

The default code for object presenters excludes display of terms with `nil` values in method...

[actual default for collections](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_show_presenter.rb#L48-L50)

```
  def terms_with_values
    self.class.terms.select { |t| self[t].present? }
  end
```

*Example Override*

If you want terms without values to be displayed, override this method with...

```
  def terms_with_values
    # Return all terms even if they don't have values
    self.class.terms
  end
```

If your data has blank strings, you can ignore the blank string values too by overriding this method with...

```
  def terms_with_values
    # Ignore missing and blank values
    self.class.terms.select { |t| self[t].present? && self[t] != [""] }
  end
```

## Example methods designed to isolate view from business logic code

### Example work presenter method

*Method in work presenter*

[app/presenters/hyrax/work_show_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/work_show_presenter.rb#L136-L138)

```
    def work_featurable?
      user_can_feature_works? && solr_document.public?
    end
```

*Used in view*

[app/views/hyrax/base/_show_actions.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/hyrax/base/_show_actions.html.erb#L32-L40)

```
  <% if presenter.work_featurable? %>
      <%= link_to "Feature", hyrax.featured_work_path(presenter, format: :json),
          data: { behavior: 'feature' },
          class: presenter.display_unfeature_link? ? 'btn btn-default collapse' : 'btn btn-default' %>

      <%= link_to "Unfeature", hyrax.featured_work_path(presenter, format: :json),
          data: { behavior: 'unfeature' },
          class: presenter.display_feature_link? ? 'btn btn-default collapse' : 'btn btn-default' %>
  <% end %>
```

[Additional work presenter methods used to isolate business logic](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_presenter.rb#L63-L85)


### Example collection presenter method

*Method in collection presenter*

[app/presenters/hyrax/collection_presenter.rb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_presenter.rb#L83-L85)

```
    def collection_type_badge
      content_tag(:span, collection_type.title, class: "label", style: "background-color: " + collection_type.badge_color + ";")
    end
```

*Used in view*

* [app/views/hyrax/dashboard/collections/_collection_title.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/hyrax/dashboard/collections/_collection_title.html.erb#L18)

```
    <div class="collection-title-row-content">
      <h3 class="collection-title">
        <% # List multiple titles %>
        <% presenter.title.each_with_index do |title, index| %>
          <span><%= title %></span>
        <% end %>
      </h3>
      <%= presenter.permission_badge %>
      <%= presenter.collection_type_badge %>
    </div>
```

*Also used in views...*

* [app/views/catalog/_index_header_list_collection.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/catalog/_index_header_list_collection.html.erb#L3)
* [app/views/hyrax/my/collections/_list_collections.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/hyrax/my/collections/_list_collections.html.erb#L60)
* [app/views/hyrax/collections/show.html.erb](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/views/hyrax/collections/show.html.erb#L14)

[Additional collection presenter methods used to isolate business logic](https://github.com/samvera/hyrax/blob/v2.1.0.rc3/app/presenters/hyrax/collection_presenter.rb#L63-L85)

## Overriding and Custom Presenter Methods

<ul class='warning'><li><b>To limit future refactoring of customized code, it is recommended that you use the Module#Prepend pattern to override and extend presenter classes.  The examples here use this approach.</b></li></ul>

On occasion you may want to change the behavior of an existing presenter method.  For example, in a local app, we wanted to limit the `total_items` method to return a count of a specific type of work only.  We used class prepending to make the override, so our changed looks like...

```
# Based on the Module#prepend pattern in ruby which is used in some Hyrax.
# Uses the to_prepare Rails hook in application.rb to inject this module to override Hyrax::AdminSetPresenter module
module PrependedPresenters::AdminSetPresenter
  # Override Hyrax::AdminSetPresenter#total_items method
  # and filter query to only include publications in count
  def total_items
    ActiveFedora::SolrService.count("{!field f=isPartOf_ssim}#{id}", fq: "has_model_ssim:Publication")
  end
end
```

You may also want to add custom methods to presenters.  This is also done by adding the new method to the presenter prepend class and then adjusting the view to use the new presenter method.

## Presenters used in context

See Customizing Metadata tutorial's lesson on <a href="customize-metadata-show-page.html">Modifying the Show Page</a> which covers changes required beyond modifying presenters to customize how data is shown on an object's show page.
