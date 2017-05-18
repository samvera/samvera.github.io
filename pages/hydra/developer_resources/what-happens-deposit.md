---
title: "What Happens When I Deposit Something?"
keywords: Characterization, Derivatives, File Attachments
categories: How to Do All the Things
permalink: what-happens-deposit.html
folder: hydra/how-to/
sidebar: home_sidebar
tags: [development_resources]
---


1. I'm on the form to create a new work and I click the submit.
1. The data is submitted to the controller for the correct work type.  This controller was generated when you did `bin/rails generate hyrax:work <type>`.  For example the `app/controllers/hyrax/generic_works_controller.rb` if you generated a work type of `GenericWork`.
1. This controller is including `Hyrax::WorksControllerBehavior`, so the `create` method is run: https://github.com/projecthydra-labs/hyrax/blob/master/app/controllers/concerns/hyrax/works_controller_behavior.rb#L57-L69
1. The `create` method initializes the actor https://github.com/projecthydra-labs/hyrax/blob/master/app/controllers/concerns/hyrax/works_controller_behavior.rb#L139 and calls create on it.
1. The actor is a stack built of functions that take parts of the form data and act upon them.  The actor is customizable in your local application, but by default the steps of the pipeline are defined here: https://github.com/projecthydra-labs/hyrax/blob/master/app/services/hyrax/default_middleware_stack.rb#L4-L21
1. When create is called, each frame of this stack is called, and passed a Hyrax::Environment object which contains the new work, the current user and the data from the HTML form.  
1. one of the frames in the stack is the https://github.com/projecthydra-labs/hyrax/blob/master/app/actors/hyrax/actors/model_actor.rb. It calls the generated actor specific for the work type we're making. In this case `app/actors/hyrax/actors/generic_work_actor.rb`.  This generated actor extends `Hyrax::Actors::BaseActor`, which is responsible for persisting the object by calling the `ActiveFedora::Base#save` method.
1. Another frame in the stack was the `Hyrax::Actors::InitializeWorkflowActor`.  This actor creates a workflow entity proxy for the object. This proxy tracks where the work is in the workflow.
1. If this object was deposited to an AdminSet that uses the default workflow, then the object is immediately available to be discovered in the search (given the searching user has appropriate on access controls)
1. If this object was deposited to an AdminSet that uses the one-step mediated deposit workflow, then the object is marked as suppressed in solr and it's not available for discovery.  The approvers for the admin set were notified that they must take action to review this work.
