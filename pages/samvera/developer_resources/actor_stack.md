---
title: "Working with the Actor Stack"
a-z: ["Actor Stack, Middleware"]
keywords: Actor Stack, Middleware
categories: How to Do All the Things
permalink: actor_stack.html
folder: samvera/actor_stack.md
sidebar: home_sidebar
tags: [development_resources]
toc: false
---

#### *Interview with Mike Giarlo*

### What's the design pattern of Actors and the Actor Stack, can you give an brief introduction to the idea/history of middleware?

Yeah. So, first, I'll be totally honest and disclaim that, this is not something I came up with, and I've had to do some learning myself, to learn how it integrates with the rest of Hyrax. I'd previously had to do a little with middleware, inject a custom middleware into Rack middleware, but not much.

Actors are a frequent source of dismay or fear, so let's talk about why we have them in the first place. And let's acknowledge the term is not the greatest choice; actor means some specific things in other languages and in CS that we may be violating. But anyway. Back in Sufia days, we were building a product and we started with MVC, and we started noticing requests to controllers were taking too long, the app was slow, so we started throwing things in background jobs. The problem was there were parts of code that we wanted to call from both the controller and the job, so where does that code live? If you reach into the controller from a job, that's weird, and the other way around too. What we did was take those operations out into a new kind of object, called Actors. That's why they exist.

Fairly recently, until last year, we weren't using ActionDispatch, we were using our own. [ActionDispatch is the Rails middleware.] So the first thing you need to know is it's a stack, which means each actor executes in order, and they all have the same interface. So there's some complexity there but also some simplicity.

### What's middleware, exactly?

Middleware, so that's some software that wraps the http request/response cycle. The [Rails middleware](http://guides.rubyonrails.org/rails_on_rack.html#configuring-middleware-stack) does stuff like handling caching, setting headers, etc. You might not care about these things until you deploy to production, but it's stuff you expect applications to do. One of the reasons we use the Rails middleware stack is it's very useful - you can very easily customize it. The default Actor Stack you get in a Hyrax project is called DefaultMiddlewareStack, it's based on the ActionDispatch stack. We use Rails' stack and we inject a bunch of other stuff that we want.

Here's a link to the [entire stack](https://github.com/samvera/hyrax/blob/master/app/services/hyrax/default_middleware_stack.rb#L6-L57).


### What's this interface?

The design of the Actor Stack is that there are three things it does: creates, updates and destroys. If you want to have an operation participate in any of those things, that's the method you write in your actor and you chain it into the stack. In order to be a legit actor you have to implement at least one (and up to all three) of those methods and be confident that the actor above you will call you and make sure you're integrated.

### How should developers customize the actor stack for their own applications? What are the best practices or expected ways to do it?

So there are different extension patterns. You could overwrite the whole stack, or you could remove one, or insert one, you don't have to do a wholesale replacement.

### Can you do a walk-through of modifying the stack? Here's an example: I want an actor that backs up my source files before ingesting them.

Okay, you could create a CopyToTape actor -- the only thing that's tricky here is the actor always has to have the information it needs. So you'd want to be sure to insert it before creating derivatives in the stack. You're always passing along an environment, this is the key to the stack functioning as it does. An environment is a hash and you need to make sure it's always got the things it needs in it, when they're needed. For example, if you're uploading files from a remote source, the actor that fetches them needs to have the path to where they are, and needs this before creating derivatives and storing in Fedora. In Hyrax, we have a light wrapper class that has a work, an ability, and the environment hash. [Here's what it looks like](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/environment.rb).


### I'm looking at the documentation for the abstract_actor class, and I see these lines:

```ruby
# act! is contingent on `next_actor` reporting success
next_actor.create(env) && act!(env.curation_concern)
```
But it looks to me as if this is backwards, that we would want our current actor to execute and return true in order to call the next actor. Can you explain a little bit about how the control flow works here, and why it's written this way?

So let's see. I have some examples and some different invocation patterns, because that's only one way to integrate an actor into the stack:

[validate_files(files, env) && next_actor.create(env) && attach_files(files, env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/create_with_files_actor.rb#L10)

[save(env) && next_actor.create(env) && run_callbacks(:after_create_concern, env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/base_actor.rb#L21)

[next_actor.create(env) && add_to_works(env, work_ids)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/add_to_work_actor.rb#L8)


In the last example, one of the last steps that happens, is the work is saved. So in this case, you want to invoke the rest of the stack and attach the works later, because the work hadn't been saved yet. The metaphor is think of the actor stack as, you come in to the top and you call create all the way down, what happens is that request comes right back up through the same actor, so if your actor has all the information it needs up and down can be parallel lines.

### How do you write one of these methods?

It really depends on what you want to do and where you are in the stack. The point of a transaction is to allow you to rollback everything. Here's an example, it's the create actor wrapped in a transaction:

[ next_actor.create(env)](https://github.com/samvera/hyrax/blob/master/app/actors/hyrax/actors/transactional_request.rb#L11)


They want to immediately do a thing, let a bunch of other actors work, and then attach a file, do early validation, --- It's very important for those methods to return a boolean -- the return of these methods will be evaluated as a boolean. So if something goes wrong, the actor should return a false.


Let's say you have an actor that has all the info it needs, you can put that puppy up near the top, in the transactional request, and you can just say do your thing, because it's really self-contained. But if you have an actor that depends upon a workflow having been started, you'd put it after the workflow.

Okay, people have an actor and they have two questions -- where do I put it? and, do I put my create before or after the ampersand? The answer is it depends and would need to be discussed. This is the area where there are gotchas -- how to structure, invoke your methods so they happen at the right time.

Here are a few more links:

[Customizing Actors](https://github.com/samvera/hyrax/wiki/Customizing-Actors)

[ActionDispatch: Rails Middleware](http://guides.rubyonrails.org/rails_on_rack.html#configuring-middleware-stack)
