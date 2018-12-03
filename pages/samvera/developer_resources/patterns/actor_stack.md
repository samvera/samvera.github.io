---
title: "Working with the Actor Stack"
permalink: actor_stack.html
keywords: ["Actor Stack", "Middleware", "Design Patterns"]
last_updated:
sidebar: home_sidebar
toc: false
---

#### *Content provided by an interview with Mike Giarlo*

### Middleware

- _Definition_: Middleware is software that wraps the http request/ response cycle. The Rails middleware (ActionDispatch) handles caching and sets headers, among other things, and the Rails middleware stack is particularly useful because you can very easily customize it.


### Actors and Actor Stack Pattern

- _Need for actors:_ While building a product with Sufia, developers realized requests to controllers were taking too long and the app was slow. Parts of code need to be called both from the controller and the job, and this code needs a place to live so that it doesn’t have to be awkwardly accessed from within the controller into a job and vice versa. The developers took these operations out into a new kind of object: Actors.
 
- _Design:_ Each actor executes in order, which means it’s a stack. All these actors have the same interface and can perform 3 actions: create, update and destroy. If you want an operation that participates in any of these actions, you would write that particular method in your actor and chain it into the stack. In order to be a legit actor, you have to implement at least one (and up to all three) of those methods. The actor stack design ensures that the actor above will call your actor and that you are integrated.

- The _default_ actor stack in a Hyrax project is called DefaultMiddlewareStack (it is based on the ActionDispatch stack).  Here's a link to the [entire stack](https://github.com/samvera/hyrax/blob/master/app/services/hyrax/default_middleware_stack.rb).  

### Customizing Actor Stacks


- _Modification:_ There are different extension patterns. You can overwrite the whole
stack, or remove/ insert one so you don't have to do a wholesale replacement.


- _Example:_ If you want an actor that backs up your source files before ingesting them.
You can create a CopyToTape actor — but remember, the actor always has to
have the information it needs. Insert it before creating derivatives in the stack.
The key to keep the stack functioning is to be always passing along an
environment (an environment is a hash and you need to make sure it's always got
the things it needs in it, when they're needed). For example, if you're uploading
files from a remote source, the actor that fetches them needs to have the path to
where they are, and needs this before creating derivatives and storing in Fedora.
In Hyrax, we have a light wrapper class that has a work, an ability, and the
environment hash. Here's what it [looks like](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/environment.rb).

### Control Flow Examples and Invocation Patterns

- _Examples of Invocation Patterns:_ There are different ways to integrate the actor into
the stack. Here are some examples and some different invocation patterns.
 - [validate_files(files, env) && next_actor.create(env) && attach_files(files, env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/create_with_files_actor.rb#L10)
 - [save(env) && next_actor.create(env) && run_callbacks(:after_create_concern, env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/base_actor.rb#L21)
 - [next_actor.create(env) && add_to_works(env, work_ids)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/add_to_work_actor.rb#L8): Here, the work is saved. In this case, invoke the rest of the stack and attach
the works later, because the work hadn't been saved yet. Think of it this way: you
come in to the top and you call create all the way down, and then the request
comes right back up through the same actor. So, if your actor has all the
information it needs, up and down can be parallel lines.

 - [ next_actor.create(env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/transactional_request.rb#L11): This is a create actor wrapped in a transaction. The point
of a transaction is to allow you to rollback everything. It is important for these
methods to return a boolean. So if something goes wrong, the actor should return
a false. You put an actor that has all the info it needs up near the top, in the
transactional request, and you can just let it do its thing, because it's self-
contained. But if you have an actor that depends upon a workflow having been
started, you'd put it after the workflow.


* Where to put an actor and whether to put the create actor before or after the ampersand depends on the context.  This is the area where there are gotchas -- how to structure, invoke your methods so they happen at the right time.


## Other helpful links

[Customizing Actors](https://github.com/samvera/hyrax/wiki/Customizing-Actors)

[ActionDispatch: Rails Middleware](http://guides.rubyonrails.org/rails_on_rack.html#configuring-middleware-stack)
