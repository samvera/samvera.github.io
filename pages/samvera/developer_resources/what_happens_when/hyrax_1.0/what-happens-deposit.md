---
title: "What Happens When I Deposit Something? (1.0)"
permalink: what-happens-deposit-1.0.html
keywords: [ "Characterization", "Derivatives", "File Attachments", "Deposit", "Save Work", "Actor Stack" ]
last_updated:
version:
  id: 'hyrax_1.0-stable'
  versions:  
    - label: 'Hyrax 1.0'
      link:  'what-happens-deposit-1.0.html'
      selected: 'true'
    - label: 'Hyrax 2.0'
      link:  'what-happens-deposit-2.0.html'
sidebar: home_sidebar
---

1. I'm on the form to create a new work and I click the `Save` button.
1. The data is submitted to the controller for the correct work type.  This controller was generated when you did `bin/rails generate hyrax:work <type>`.  For example the `app/controllers/hyrax/generic_works_controller.rb` if you generated a work type of `GenericWork`.
1. This generated controller includes [Hyrax::WorksControllerBehavior](https://github.com/samvera/hyrax/blob/1-0-stable/app/controllers/concerns/hyrax/works_controller_behavior.rb#L5) which includes [Hyrax::CurationConcernController](https://github.com/samvera/hyrax/blob/1-0-stable/app/controllers/concerns/hyrax/curation_concern_controller.rb), which defines the [create](https://github.com/samvera/hyrax/blob/1-0-stable/app/controllers/concerns/hyrax/curation_concern_controller.rb#L44-L56) method that is run when saving.
1. The `create` method initializes the [actor](https://github.com/samvera/hyrax/blob/1-0-stable/app/controllers/concerns/hyrax/curation_concern_controller.rb#L125) and calls create on it.
1. The actor is a stack built of functions that take parts of the form data and act upon them.  The actor is customizable in your local application with the default steps of the pipeline defined by [Hyrax::ActorFactory's stack_actors](https://github.com/samvera/hyrax/blob/1-0-stable/app/services/hyrax/actor_factory.rb#L3-L20) method.
1. When create is called, each frame of this stack is called, and expects to have access to curation_concern, attributes, and user which contains the new work, the data from the HTML form, and the current user, respectively.
1. One of the frames in the stack is the [model_actor](https://github.com/samvera/hyrax/blob/1-0-stable/app/services/hyrax/actor_factory.rb#L28-L31). It calls the generated actor specific for the work type we're making. In this case `app/actors/hyrax/actors/generic_work_actor.rb`.  This generated actor extends [Hyrax::Actors::BaseActor](https://github.com/samvera/hyrax/blob/1-0-stable/app/actors/hyrax/actors/base_actor.rb), which is responsible for persisting the object by calling the `ActiveFedora::Base#save` method.
1. Another frame in the stack is the [Hyrax::Actors::InitializeWorkflowActor](https://github.com/samvera/hyrax/blob/1-0-stable/app/actors/hyrax/actors/initialize_workflow_actor.rb).  This actor creates a workflow entity proxy for the object. This proxy tracks where the work is in the workflow.
1. If this object was deposited to an AdminSet that uses the default workflow, then the object is immediately available to be discovered in the search (given the searching user has appropriate on access controls)
1. If this object was deposited to an AdminSet that uses the one-step mediated deposit workflow, then the object is marked as suppressed in solr and it's not available for discovery.  The approvers for the admin set were notified that they must take action to review this work.
