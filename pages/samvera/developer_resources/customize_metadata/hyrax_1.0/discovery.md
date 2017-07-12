---
title: "Configuring Discovery"
keywords: Customize Metadata
categories: How to Do All the Things
permalink: customize-metadata-discovery.html
folder: samvera/how-to/customize_metadata/hyrax_1.0/discovery.md
sidebar: home_sidebar
tags: [development_resources]
version: 
  id: 'hyrax_1.0-stable'
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

---

<p><a href="customize-metadata-show-page.html"><button type="button" class="btn btn-primary">Prev: Modifying the Show Page</button></a>  <a href="customize-metadata-other-customizations.html"><button type="button" class="btn btn-primary">Next: Other Metadata Customizations</button></a></p>
