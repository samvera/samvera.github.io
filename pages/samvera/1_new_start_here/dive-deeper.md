---
title: Dive Deeper into Hyrax
keywords: ["Dive Deeper", "Hyrax"]
last_updated: April 16, 2017
sidebar: samvera_sidebar
permalink: /dive-deeper.html
folder: samvera
toc: false
---

## Choose your own adventure
### You're the star of the story! Choose from 2 possible endings

![stonehenge](images/stonehenge.png "Stonehenge")

### [Theory](#slide-2 "Theory")
### [Practice](#slide-39 "Practice")


## Legacy data modeling: 1
![Legacy](images/legacy_modeling.svg "Legacy")
  <img src="images/legacy_modeling.svg">

## Legacy data modeling: 2
![Legacy](images/legacy_HABTM.svg "Legacy")

## Shortcomings of legacy modeling
- Every project has a unique structure
- Lack of ordering
- Resource contention

![PCDM](images/pcdm.png "PCDM")

*History*


## Structural model
![Outdated](images/outdated_hydra_works.png "Outdated")

## Hands On

### VM Only
```
$ vagrant up
$ vagrant ssh
$ cp ~/downloads/solr-5.4.1.zip /tmp
$ cp ~/downloads/fcrepo-webapp-4.5.0-jetty-console.jar /tmp
$ cd /vagrant
```

## Hands On

```
$ rails new demo_works
$ cd demo_works/
```

Then open `Gemfile` in your editor and add these lines:

```ruby
gem 'hydra', '9.1.0'
gem 'hydra-works', '0.7.0'
```

Then uncomment this line (unless you're on MacOS)

`gem 'therubyracer', platforms: :ruby`

Next, save the file and exit the editor.

## Hands On

```
$ bundle install
$ rails generate hydra:install
```

## Hands On

### Not on a VM

`$ rake hydra:server`

## Hands On

### VM Only
```
$ vagrant ssh
$ solr_wrapper -p 8983 -d /vagrant/demo_works/solr/config/ --collection_name hydra-development -i ~/services/solr-5.4.1
```

## Hands On

### VM Only
```
$ vagrant ssh
$ fcrepo_wrapper -p 8984 -d ~/services/fcrepo-data -i ~/services/fcrepo-4.5.0
```

## Hands On

### VM Only

Now open a new terminal window and run:

`$ rails console`

## Hands on
``` ruby
# app/models/collection.rb
class Collection < ActiveFedora::Base
  include Hydra::Works::CollectionBehavior
  property :title, predicate: ::RDF::Vocab::DC.title
end
```

## Hands on
```ruby
# app/models/bibliographic_work.rb
class BibliographicWork < ActiveFedora::Base
  include Hydra::Works::WorkBehavior
  property :title, predicate: ::RDF::DC.title
  property :author, predicate: ::RDF::DC.creator
  property :abstract, predicate: ::RDF::DC.abstract
end
```

## Hands on
```ruby
# app/models/file_set.rb
class FileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior
  property :title, predicate: ::RDF::DC.title
end
```

## Hands on
```ruby
col = Collection.create(
        id: 'col-1',
        title: ["Works by Edgar Allan Poe"])
col.uri
=> #<RDF::URI:0x3ffb2941693c URI:http://127.0.0.1:8984/rest/dev/col-1>
```

## Hands on
```ruby
bw = BibliographicWork.create(
       id: 'work-1',
       title: ["The Raven"],
       author: ["Poe, Edgar Allan"])
bw.uri
=> #<RDF::URI:0x3ffb2941693c URI:http://127.0.0.1:8984/rest/dev/work-1>
```

## Hands on
``` ruby
fs = FileSet.create(
       id: 'fileset-1',
       title: ["The PDF"])
fs.uri
=> #<RDF::URI:0x3ffb2941693c URI:http://127.0.0.1:8984/rest/dev/work-1>
```

## Hands on

``` ruby
col.members << bw
col.save
bw.members << fs
bw.save

```

## Hands on
``` ruby
col.works
=> [#<BibliographicWork id: "work-1", title: "The Raven", author: "Poe, Edgar Allan", head_id: nil, tail_id: nil>]

bw.in_collections
=> [#<Collection id: "col-1", title: "Works by Edgar Allan Poe", head_id: nil, tail_id: nil>]

bw.file_sets
=> [#<FileSet id: "fileset-1", title: "The Raven pdf", head_id: nil, tail_id: nil>]

fs.in_works       ### TODO in_works returns []
=> [#<BibliographicWork id: "work-1", title: "The Raven", author: "Poe, Edgar Allan", abstract: "A lonely man tries to ease his 'sorrow for the lost Lenore', by distracting his mind with old books of 'forgotten lore'.", head_id: nil, tail_id: nil>]
```


## Projection onto LDP

## LDP Containers

## LDP Basic Container
```ruby
</blog/entry1> a ldp:Container .
</blog/entry1> dc:title "First blog entry" .
```
``` ruby
</blog/entry1/comment1> a ldp:RDFSource .
</blog/entry1/comment1> dc:title "this is a new comment" .
```

## LDP Basic Container
```ruby
</blog/entry1> a ldp:Container .
</blog/entry1> dc:title "First blog entry" .
</blog/entry1> ldp:contains
</blog/entry1/comment1> .
```

## LDP Direct Container
``` ruby
</book1/files> a ldp:DirectContainer .
</book1/files> ldp:membershipResource </book1> .
</book1/files> ldp:hasMemberRelation pcdm:hasFile .
</book1/files> ldp:contains </book1/files/file1> .

```

## LDP Direct Container
```ruby
</book1> pcdm:hasFile </book1/files/file1> .
```

## LDP Indirect Container
```ruby
</collection1/members> a ldp:IndirectContainer .
</collection1/members> ldp:membershipResource </collection1> .
</collection1/members> ldp:hasMemberRelation pcdm:hasMember .
</collection1/members> ldp:insertedContentRelation ore:proxyFor .
</collection1/members> ldp:contains </book1> .
```

## LDP Indirect Container
  `</collection1> pcdm:hasMember </book1> .`
  `</collection1/members/proxy1> ore:proxyFor </book1> .`

#### Let's investigate...
## ORE Aggregation
![ORE Aggregation](images/ore_proxy.jpg "Ore Aggregation")


## List node

Allows us to reorder a whole list in a single HTTP request

    <book1/list_source> | iana:first | <book1/list_source#g1234>

    <book1/list_source> | iana:last | <book1/list_source#g5678>

    <book1/list_source#g1234> | ore:proxyFor | <page1>
    <book1/list_source#g1234> | ore:proxyIn	 | <book1>
    <book1/list_source#g1234> | iana:next | <book1/list_source#g5678>
    <book1/list_source#g5678> | ore:proxyFor | <page1>
    <book1/list_source#g5678> | ore:proxyIn | <book1>
    <book1/list_source#g5678> | iana:prev | <book1/list_source#g1234>


## Problems
- Lots of writes
- Resource contention

## The responsibilities of Samvera

For each class of objects in the repository, map from...

- repository representation to object properties
- object properties to repository representation
- object properties to an index representation
- index representation to an HTML show page
- object properties to an HTML form
- HTML form output to object properties
- index search results to an HTML page

## Curation Concerns

## Hands On
`$ rails new demo_repo
$ cd demo_repo/`

Then open `Gemfile` in your editor and add this line:
`gem 'curation_concerns', '~> 0.10.0'`
Then save the file and exit the editor.

## Hands On

`$ bundle install
$ rails generate curation_concerns:install`

Say "Y" when it asks if you want to overwrite `catalog_controller.rb`.

## Hands On

`$ rake db:migrate`

In `config/application.rb` set up the queuing backend

`config.active_job.queue_adapter = :resque`

## Hands On

We will generate a kind of work called a Book:

`$ rails generate curation_concerns:work Book`

## Hands On

### Not on a VM
`$ rake hydra:server`

## Hands On

### VM Only
```
$ vagrant ssh
$ solr_wrapper -p 8983 -d /vagrant/demo_repo/solr/config/ --collection_name hydra-development -i ~/services/solr-5.4.1
```

## Hands On

### VM Only
```
$ vagrant ssh
$ fcrepo_wrapper -p 8984 -d ~/services/fcrepo-data -i ~/services/fcrepo-4.5.0
```

## Hands On

### VM Only

```
$ vagrant ssh
$ cd /vagrant/demo_repo
$ rails server -b 0.0.0.0
```
When you see `WEBrick::HTTPServer#start: pid=5962 port=3000` the server is ready to visit at http://localhost:3000/

## Hands On

Open a new terminal window to start resque-web

`resque-web -N curation_concerns:development`

Open http://localhost:5678/

Open a new terminal window to start the workers
`$ QUEUE=* rake resque:work`

## Model

The model is responsible for maping the repository representation to object properties.

```ruby
class Book < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  validates :title,
            presence: { message: 'Your work must have a title.' }
end
```

## Model
```ruby
book = Book.new(title: ["The Captain's Daughter"]) do |b|
  b.apply_depositor_metadata('Tabatha')
end
book.creator = ['Pushkin, Alexander']
book.save!
=> #<Book id: "n870zr08h", head: [], tail: [], depositor: "Tabatha", title: ["The Captain's Daughter"], date_uploaded: nil, date_modified: nil, owner: nil, label: nil, relative_path: nil, import_url: nil, part_of: [], resource_type: [], creator: ['Pushkin, Alexander'], contributor: [], description: [], tag: [], rights: [], publisher: [], date_created: [], subject: [], language: [], identifier: [], based_near: [], related_url: [], bibliographic_citation: [], source: [], representative_id: nil, thumbnail_id: nil, embargo_id: nil, lease_id: nil>

other_book = Book.find('1r66j140x')
=> #<Book id: "1r66j140x", head: [], tail: [], depositor: "Justin", title: ["Anna Karenina"], date_uploaded: nil, date_modified: nil, owner: nil, label: nil, relative_path: nil, import_url: nil, part_of: [], resource_type: [], creator: ["Tolstoy, Leo"], contributor: [], description: [], tag: [], rights: [], publisher: [], date_created: [], subject: [], language: [], identifier: [], based_near: [], related_url: [], bibliographic_citation: [], source: [], representative_id: nil, thumbnail_id: nil, embargo_id: nil, lease_id: nil>
```

## Indexer

The indexer is responsible for mapping an object properties to a document in the Solr index


### Indexer
```ruby
book = Book.create(title: ["The Captain's Daughter"]) do
  |b| b.apply_depositor_metadata('Justin')
end

indexer = CurationConcerns::WorkIndexer.new(book)

indexer.generate_solr_document
# indexer.generate_solr_document.except('object_profile_ssm')
```

## Indexer

Let's customize the indexer to add a count of all the associated FileSets

## Indexer
```ruby
# app/indexers/book_indexer.rb
class BookIndexer < CurationConcerns::WorkIndexer
end

# app/models/book.rb
class Book < ActiveFedora::Base
  ...
  def self.indexer
    BookIndexer
  end
end
```

## Indexer
```ruby
# app/indexers/book_indexer.rb
class BookIndexer < CurationConcerns::WorkIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      Solrizer.set_field(solr_doc,
                         'number_of_files',
                         object.file_sets.count,
                         :displayable)
    end
  end
end
```

## Presenter

The presenter is responsible for translating values from the model to a presentable form.

## Customize the Presenter

Display a new field: `:restrictions`

### Create a presenter
```ruby
# app/presenters/book_presenter.rb
class BookPresenter < CurationConcerns::WorkShowPresenter
  delegate :restrictions, to: :solr_document
end
```

### Update the solr document
```ruby
# app/models/solr_document.rb
class SolrDocument
  ...
  def restrictions
    fetch('restrictions_tesim', [])
  end
  ...
end
```

### Update the controller
```ruby
# app/controllers/cu.../books_controller.rb
class CurationConcerns::BooksController < ApplicationController
  include CurationConcerns::CurationConcernController
  set_curation_concern_type Book

  # Gives the class of the show presenter. Override this if you want
  # to use a different presenter.
  def show_presenter
    # CurationConcerns::WorkShowPresenter
    ::BookPresenter
  end
end
```

### Update the view partial
```
copy <CurationConcerns path>/app/views/curation_concerns/base/_attribute_rows.html.erb to
app/views/curation_concerns/books/_attribute_rows.html.erb
```

### Update the view partial

```
#app/view/curation_concerns/books/_attribute_rows.html.erb
<%= presenter.attribute_to_html(:description) %>
<%= presenter.attribute_to_html(:creator, catalog_search_link: true ) %>
<%= presenter.attribute_to_html(:contributor, label: 'Contributors', catalog_search_link: true) %>
<%= presenter.attribute_to_html(:subject, catalog_search_link: true) %>
<%= presenter.attribute_to_html(:publisher) %>
<%= presenter.attribute_to_html(:language) %>
<%= presenter.attribute_to_html(:restrictions) %>

```

## Customize the Form
Replace the "rights" field with "copyright_status"

```ruby
# app/forms/curation_concers/book_form.rb
module CurationConcerns
  class BookForm < CurationConcerns::Forms::WorkForm
    self.model_class = ::Book
    delegate :copyright_status, to: :model

    self.terms -= [:rights]
    self.terms += [:copyright_status]
  end
end
```

## Customize the Form

Update the model
```ruby
# app/models/book.rb
class Book < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  validates :title, presence: { message: 'Your work must have a title.' }

  property :copyright_status, predicate: ::RDF::URI('http://example.com/copyright')
end
```

### Customize the Form
```ruby
params = ActionController::Parameters.new(
           copyright_status: ['All Rights Reserved'])
=> {"copyright_status"=>["All Rights Reserved"]}

CurationConcerns::BookForm.model_attributes(params)
=> {"copyright_status"=>["All Rights Reserved"]}
```

## Actor

```ruby
# app/actors/curation_concerns/book_actor.rb
module CurationConcerns
  class BookActor < CurationConcerns::BaseActor
    include ::CurationConcerns::WorkActorBehavior
  end
end
```

## Actor
Customize such that a librarian is notified when a new item is added.

### Actor
``` ruby
#app/actors/curation_concerns/book_actor.rb
module CurationConcerns
  class BookActor < CurationConcerns::BaseActor
    include ::CurationConcerns::WorkActorBehavior

    def create
      result = super
      NewDepositMailer.book_created(curation_concern).deliver_now
  end
end
```

# Fin
### More information
- [Curation Concerns](https://github.com/samvera/curation_concerns "Curation Concerns")
- [Hydra Works](https://github.com/samvera/hydra-works "Hydra Works")
- [Sufia](https://github.com/samvera/sufia "Sufia")
