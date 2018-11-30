---
title: "Configuring Discovery"
permalink: customize-metadata-discovery.html
keywords: ["Customize", "Metadata", "Configuration", "Discovery", "Tutorial"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

## Configure Blacklight to show the property in search results

Optionally, you can configure a property to be shown in the search results for a work.

Edit `app/controllers/catalog_controller.rb` and look for the section including `add_index_field` statements.  Add the following:

```ruby
config.add_index_field solr_name("contact_email", :stored_searchable), label: "Contact Email"
```

where...

| `config.add_index_field` | tells BlackLight to add this to the search results. |
| `solr_name("contact_email", :stored_searchable)` | tells BlackLight the name of the field in Solr.  The solr_name method generates the solr field name according to the indexing set in the property definition in the model.  The second parameter should match the indexing specified in the model for the property. |
| `label` | tells BlackLight the label to display before the value of the metadata field in search results.  By default, the label is the property name (e.g. Contact_email). |


See [Customizing Blacklight - Metadata Fields](http://jessiekeck.com/customizing-blacklight/metadata_fields/) for a tutorial on using the `add_index_field` method.  NOTE: This page of the tutorial also discusses the `add_show_field` method which is not used in Hyrax show pages.  The `helper_method` which is described in the context of the `add_show_field` method can also be used with the `add_index_field` method.

## Making the property to the All Fields search

By default, once you add a new property, its values will not be searched.  To make sure that your field is searched when the user types a query into a search box, edit `app/controllers/catalog_controller.rb` and look for the section including `add_index_field` statements.  Add the following:

```ruby
config.add_show_field solr_name("contact_email", :stored_searchable)
```

where...

| `config.add_show_field` | tells Blacklight to add this to the qf parameter (list of solr fields searched when the user searches "all fields". |
| `solr_name("contact_email", :stored_searchable)` | tells Blacklight the name of the field in Solr. |

Alternatively, if you know the official name of the field in Solr, including the suffix that indicates how it is indexed, you can add it to the `qf` attribute directly.  To do this, edit `app/controllers/catalog_controller.rb` and look for the section beginning with:

```ruby
config.add_search_field('all_fields', label: 'All Fields') do |field|
```
Add the solr name of your property to the `qf` line, for example:

```ruby
qf: "#{all_names} file_format_tesim all_text_timv",
```
Would become:
```ruby
qf: "#{all_names} file_format_tesim all_text_timv contact_email_tesim",
```

---

<p><a href="customize-metadata-show-page.html"><button type="button" class="btn btn-primary">Prev: Modifying the Show Page</button></a>  <a href="customize-metadata-other-customizations.html"><button type="button" class="btn btn-primary">Next: Other Metadata Customizations</button></a></p>
