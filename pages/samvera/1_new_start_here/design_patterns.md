---
title: Touring the design patterns in Hyrax
keywords: ["Design Patterns"]
last_updated: April 16, 2017
sidebar: samvera_sidebar
permalink: /design_patterns.html
folder: samvera
toc: false
---

![touring bicycles](images/touring.jpg "Logo Title Text 1")

[8barbikes](https://flic.kr/p/gHzsqC)


### Where are we? What are we doing here?

- Working code wins
- Go far together
- Scratch your own itch
- "The Rails Way"
- The Model-View-Controller (MVC) Pattern


#### Where are we going? What are our goals? Where to next?


### Maintainable software

- Well defined interfaces
- Fewer included modules
- Customize without contortions to override controller/helper methods
- Keep it working

![uncle bob](https://cleancoders.com/assets/images/authors-robert-martin-v0.jpg "uncle bob")


![agile](/images/agile_software_development.jpg "agile")

### SOLID: The first five principles

- Single responsibility
- Open for extension, closed for modification
- Liskov substitution
- Interface Segregation
- Dependency Inversion


### Anti-pattern: Rails Helpers

![touring bicycles](images/anti-pattern.jpg "touring bicycles")

[Edmund White](https://flic.kr/p/8sp6Y4)


### Multiple responsibilities:

[FacetsHelperBehavior](https://github.com/projectblacklight/blacklight/blob/c57262d10f415b1661fa7860cc920b793a7af2bf/app/helpers/blacklight/facets_helper_behavior.rb)


### Solution: Presenter

![track bicycles](images/paceline.jpg "track bicycles")

[Steve McFarland](https://flic.kr/p/7tpXgx)

### a.k.a.: Decorator or View-Model

The presenter is responsible for translating values from the model to a presentable form.


## Presenter

``` ruby
class BookPresenter
  def initialize(book)
    @book = book
  end

  delegate :title, :creator, to: :@book

  def glitter_title
    '★' + @book.title + '☆'
  end
end
```

### Presenter usage
``` ruby
class BooksController < ApplicationController
  def show
    book = Book.find(params[:id])
    @presenter = BookPresenter.new(book)
  end
end
```

### In real code
  [https://github.com/samvera/hyrax/blob/ac57f4a931459f8f9b15cccd838d29307627dff5/app/controllers/concerns/hyrax/curation_concern_controller.rb#L56](https://github.com/samvera/hyrax/blob/ac57f4a931459f8f9b15cccd838d29307627dff5/app/controllers/concerns/hyrax/curation_concern_controller.rb#L56)


### Hands on exercise

![crash test dummy](images/dummy.jpg "crash test dummy")

[Timmy_L](https://flic.kr/p/nmV7A9)

- Start up the VM
- Log into Hyrax

Display a new field 'restrictions'

### Start up the VM
```
$ vagrant up
$ vagrant ssh

```

### Change directory to the Hyrax sample application

` cd hyrax-sample `


### Generate Hyrax application

**If you're using the provided VM, this is already done. You can skip this step.**

If you don't already have Rails 5+ installed

`$ gem install rails -v 5.0.0.1
$ rails new hyrax-sample -m `

https://raw.githubusercontent.com/samvera/hyrax/master/template.rb



### Generate a book
` $ rails generate hyrax:work Book `


### Start up the services

Open 3 more terminal windows. In each window:
` $ vagrant ssh
$ cd hyrax-sample `


#### Start up the services

Start Solr:

` $ solr_wrapper `

Start Fedora:

` $ fcrepo_wrapper `

Start Rails:

` $ rails server -b 0.0.0.0 `

### Create an account

When you see `Listening on tcp://0.0.0.0:3000` the server is ready to visit at http://localhost:3000/

*If you're using Rails 4, you'll see `WEBrick::HTTPServer#start: pid=5962 port=3000` instead.*

### Create a presenter
*Task:* Display a new field 'restrictions'

in the fourth terminal window:
`$ mkdir app/presenters
$ nano app/presenters/book_presenter.rb`

### Create a presenter
``` ruby
# app/presenters/book_presenter.rb
class BookPresenter &lt; Hyrax::WorkShowPresenter
  delegate :restrictions, to: :solr_document
end
```
*You need to restart your rails server*


### Update the solr document
``` ruby
# app/models/solr_document.rb
class SolrDocument
  ...
  def restrictions
    fetch('restrictions_tesim', ['nothing'])
  end
  ...
end
```

### Update the controller
``` ruby
# app/controllers/hyrax/books_controller.rb
module Hyrax
  class BooksController &lt; ApplicationController
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = Book

    # Set our custom presenter
    self.show_presenter = ::BookPresenter
  end
end
```

### Update the view partial
```
$ cp `bundle show hyrax`/app/views/hyrax/base/_attribute_rows.html.erb
      app/views/hyrax/books/

$ nano app/views/hyrax/books/_attribute_rows.html.erb
```

### Update the view partial

``` ruby
# app/view/hyrax/books/_attribute_rows.html.erb

<%= presenter.attribute_to_html(:description) %>
<%= presenter.attribute_to_html(:creator, render_as: :linked ) %>
...
<%= presenter.attribute_to_html(:source) %>

<%= presenter.attribute_to_html(:restrictions) %>

```

### View your work

Now, if you create a book, you should see the "restrictions" row display in the metadata.

### Update the presenter

``` ruby
# app/presenters/book_presenter.rb
class BookPresenter < Hyrax::WorkShowPresenter
  # delegate :restrictions, to: :solr_document

  def restrictions
    if solr_document.restrictions.first == 'nothing'
     "There are no restrictions on this object"
    else
      solr_document.restrictions
    end
  end
end
```

### Presenters in conclusion

- A pattern to encapsulate helpers that work on a particular model
- Also called decorators or view-models
- You can find them in hydra-editor and hyrax
- In Hydra the Presenter is delegating to a SolrDocument


### Forms

Like a presenter but backed by a ActiveFedora object, not a SolrDocument
*Task:* Add 'restrictions' to the create/edit page.


### Customize the model
``` ruby
# app/models/book.rb
class Book &lt; ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }
  property :restrictions, predicate: ::RDF::Vocab::DC.accessRights do |index|
    index.as :stored_searchable
  end
  self.human_readable_type = 'Book'
end
```

### Customize the form

```ruby
# app/forms/hyrax/book_form.rb
module Hyrax
  class BookForm &lt; Hyrax::Forms::WorkForm
    self.model_class = ::Book

    self.terms += [:resource_type, :restrictions]
  end
end
```


### Maybe make the property single value?
``` ruby
# app/models/book.rb
  ...
  property :restrictions, predicate: ::RDF::Vocab::DC.accessRights, multiple: false do |index|
    index.as :stored_searchable
  end
  ...
  ```

### Forms in conclusion

- Just like a presenter, but with an ActiveFedora object instead of a SolrDocument
- Follows the decorator/view-model pattern
- You can find them in hydra-editor and hyrax



### Anti-pattern: Bloated Services

![creash](images/anti-pattern2.jpg "crash")

[Rob Lucas](https://flic.kr/p/9J5nCV)


#### Multiple responsibilities:
[GenericFile::Actor](https://github.com/samvera/sufia/blob/6.x-stable/sufia-models/app/actors/sufia/generic_file/actor.rb#L32-L43)


### Solution: Stack

![stacked](images/stacked.jpg "stacked")
[Mark B. Schlemmer](https://flic.kr/p/oc8g1c)


Flow from one stack frame at a time, with each frame having a single responsibility.

[Hyrax::ActorFactory](https://github.com/samvera/hyrax/blob/f1dd22484163b776ec73907b5e39756d2a62924c/app/services/hyrax/actor_factory.rb#L3-L17)

### Actor Stack
![actor stack](images/actor_stack.png "actor stack")

### Actor Stack: In the wild
```ruby
# app/actors/hyrax/actors/add_as_member_of_collections_actor.rb
class AddAsMemberOfCollectionsActor < AbstractActor
  def create(attributes)
    collection_ids = attributes.delete(:member_of_collection_ids)
    add_to_collections(collection_ids) && next_actor.create(attributes)
  end

  def update(attributes)
    collection_ids = attributes.delete(:member_of_collection_ids)
    add_to_collections(collection_ids) && next_actor.update(attributes)
  end
  private
  ...
end
```

### Create actor
``` ruby
# app/actors/hyrax/actors/metadata_enrichment_actor.rb
module Hyrax
  module Actors
    class MetadataEnrichmentActor &lt; Hyrax:Actors:BaseActor
      def create(attributes)
        enrich_metadata(attributes) && next_actor.create(attributes)
      end

      private
        def enrich_metadata(attributes)
          if attributes.fetch('creator').include?("Carla Hayden")
            attributes['description'] &lt;&lt; "She's the Librarian of Congress"
          end
          true
        end
    end
  end
end
```

### Add actor to the stack
```
$ mkdir -p app/services/hyrax
  $ cp `bundle show hyrax`/app/services/hyrax/actor_factory.rb app/services/hyrax/
```
```ruby
# app/services/hyrax/actor_factory.rb
module Hyrax
  class ActorFactory
    def self.stack_actors(curation_concern)
      [MetadataEnrichmentActor,
        CreateWithRemoteFilesActor,
        CreateWithFilesActor,
        Hyrax::Actors::AddAsMemberOfCollectionsActor,
        Hyrax::Actors::AddToWorkActor,
        Hyrax::Actors::AssignRepresentativeActor,
        Hyrax::Actors::AttachFilesActor,
         ....
       model_actor(curation_concern),
       # Initialize workflow after model is saved
       Hyrax::Actors::InitializeWorkflowActor]
    end
  end
end
```

### Add actor to the stack

Since we just changed an initializer, we'll need to restart the Rails server. Now try it out!

### Actor stack in conclusion

- An ordered collection of classes that implement create and update
- The create/update methods return true to continue  and false to abort
- Inspired by Rack middleware
- Still needs work to be more configurable by end users


### Anti-pattern: Bloated Controller

  ![crash](images/anti-pattern3.jpg "crash")

  [Brad Hammonds](https://flic.kr/p/pv5B1d)

#### Multiple responsibilities:
[RequestBuilders](https://github.com/projectblacklight/blacklight/blob/v5.2.0/lib/blacklight/request_builders.rb#L7)  (included onto CatalogController)

### Search Builders

- Build a query for the index (Solr)
- Decouples the controller from the index implementation
- Allows us to build queries outside of the Controller
- Blacklight generates one for you: `app/models/search_builder.rb`


### Search Builder: In the wild
``` ruby
# hyrax: app/search_builders/hyrax/catalog_search_builder.rb
class Hyrax::CatalogSearchBuilder < ::SearchBuilder
  self.default_processor_chain += [
    :add_access_controls_to_solr_params,
    :show_works_or_works_that_contain_files,
    :show_only_active_records
  ]
  ...
end
```

### Search Builder: In the wild (cont.)

```ruby
  # hyrax: app/search_builders/hyrax/catalog_search_builder.rb
class Hyrax::CatalogSearchBuilder < ::SearchBuilder
  ...
  # show both works that match the query and works that contain files that match the query
    def show_works_or_works_that_contain_files(solr_parameters)
        return if blacklight_params[:q].blank? || blacklight_params[:search_field]
        solr_parameters[:user_query] = blacklight_params[:q]
        solr_parameters[:q] = new_query
    end

    # show works that are in the active state.
    def show_only_active_records(solr_parameters)
      solr_parameters[:fq] ||= []
      solr_parameters[:fq] &lt;&lt; '-suppressed_bsi:true'
    end
    ...
end
```

### Search Builder: In the wild (cont.)
``` ruby
# hyrax: app/search_builders/hyrax/filter_by_type.rb
module FilterByType
  ...
  # Add queries that excludes everything except for works and collections
  def filter_models(solr_parameters)
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] &lt;&lt; "{!terms f=has_model_ssim}#{models_to_solr_clause}"
  end
  ...
  protected
  ...
    # Override this method if you want to filter for a different set of models.
      # @return [Array<Class>] a list of classes to include
    def models
      work_classes + collection_classes
    end
  private
  ...
    def models_to_solr_clause
      # to_class_uri is deprecated in AF 11
      [ActiveFedora::Base.respond_to?(:to_rdf_representation) ? models.map(&:to_rdf_representation) : models.map(&:to_class_uri)].join(',')
    end
  ...
end
```

### Exercise

Create a search builder that finds books by a particular person

  ``` ruby
  # app/models/created_by_search_builder.rb
class CreatedBySearchBuilder &lt; Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior
  include Hydra::AccessControlsEnforcement
  include Hyrax::SearchFilters

  self.default_processor_chain = [:for_users]
  def for_users(solr_parameters)
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] &lt;&lt; "{!field f=creator_tesim v=#{blacklight_params[:q][:creator]}}"
  end
end
```

### Exercise
``` ruby
builder = CreatedBySearchBuilder.new(nil).with(creator: 'Carla
  Hayden')
builder.query
  => {"facet.field"=>[], "facet.query"=>[], "facet.pivot"=>[],
      "fq"=>["{!field f=creator_tesim v=Carla Hayden}"], "hl.fl"=>[]}
```

### Exercise

Create a search builder that finds books by a particular person

``` ruby
repository = CatalogController.new.repository
builder = CreatedBySearchBuilder.new(nil).where(creator: 'Carla Hayden')
response = repository.search(builder)
response.documents
```

## Fin
![track bicycles](images/victory.jpg "track bicycles")

[Brandon O'Connor](https://flic.kr/p/9QKXEf)
