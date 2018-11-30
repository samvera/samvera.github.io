---
title: "Workflow and Mediated Deposit in Hyrax 1.x"
permalink: workflow_and_mediated_deposit.html
keywords: ["Mediated Deposit", "Workflow", "Sipity"]
last_updated:
sidebar: home_sidebar
---

Note: This page borrows heavily, and hopes to update, the information contained on [the Sufia Mediated Deposit page](https://github.com/samvera/sufia/wiki/Mediated-Deposit-Workflow).

## Why mediated deposit?

In the Samvera community, there are many people who would like to be able to ingest an item and make sure it doesn't go live until the item and its metadata have been thoroughly reviewed. This is where *mediated deposit* comes in. In Hyrax, a user can describe groups of steps they want to take to have an item "properly" reviewed. Hyrax uses *workflows* to describe these groups of steps to review an item that was ingested.

## What is a workflow?

In Hyrax, a workflow is a state machine generated pragmatically by utilizing work done in a gem called [Sipity](https://github.com/ndlib/sipity). Each workflow can look different depending on who has designed it. By taking this info into account, it is now possible to generate any workflow a user would like by describing it in a JSON format.

## How do I use the mediated deposit workflow that ships with Hyrax?

Hyrax comes with a one step approval workflow. You can see the file in `config/workflows/mediated_deposit_workflow.json`.

Make sure you've imported all of the files in the workflows directory:
```ruby
rake hyrax:workflow:load
```
In order to use the mediated deposit workflow, you first need to create a new Admin Set and and assign it to use the workflow. You can do this either via the UI, or programatically.

### Via the UI

  Make sure you have an admin user. Look at your `config/role_map.yml` file and ensure that the user you want to have admin priviliges is defined under an `admin` section, like this:

  ```
  development:
    archivist:
      - archivist1@example.com
    admin:
      - admin@example.com
  ```

  Now, if you log in via the admin user, you should see an menu called "Administration" in the top left corner. Under it, you should see a menu item on the left called "Administrative Sets." Under that menu, you can create a new administrative set. Give it a name and description and click save. Now you can assign it a workflow under the "Workflow" tab that will appear. You will also need to give it participants under the `participants` tab.

  You will also need to use the `workflow --> roles` menu to add users as approvers for the workflow.

### Programatically

Here is a console walk through of how to set up workflow programatically. This is a good idea if you have many workflows, or complex setup, that you need to re-create over and over again and don't want to make a person do it manually.

#### Make a new AdminSet, tell it to use the `one_step_mediated_deposit` workflow
```ruby
  a = AdminSet.new
  a.title = ["Emory ETDs"]
  a.save
  Hyrax::AdminSetCreateService.call(admin_set: a, creating_user: User.first!)

  # this will tell you what workflow was assigned. Probably the default.
  a.active_workflow

  # Get all the workflows available for this AdminSet's permission_template
  available_workflows = a.permission_template.available_workflows

  => #<ActiveRecord::Associations::CollectionProxy [#<Sipity::Workflow id: 1, name: "default", label: "Default workflow", description: "A single submission step, default workflow", created_at: "2017-04-25 18:21:41", updated_at: "2017-04-25 18:21:43", permission_template_id: 1, active: true, allows_access_grant: true>, #<Sipity::Workflow id: 2, name: "one_step_mediated_deposit", label: "One-step mediated deposit workflow", description: "A single-step workflow for mediated deposit in whi...", created_at: "2017-04-25 18:21:41", updated_at: "2017-04-25 18:21:43", permission_template_id: 1, active: nil, allows_access_grant: false>]>

  mediated_workflow = a.permission_template.available_workflows.where(name: "one_step_mediated_deposit").first

  Sipity::Workflow.activate!(permission_template: a.permission_template, workflow_id: mediated_workflow.id)

  # Now calling #active_workflow should give you the mediated deposit workflow
  a.active_workflow

  => #<Sipity::Workflow id: 2, name: "one_step_mediated_deposit", label: "One-step mediated deposit workflow", description: "A single-step workflow for mediated deposit in whi...", created_at: "2017-04-25 18:21:41", updated_at: "2017-04-25 18:44:48", permission_template_id: 1, active: true, allows_access_grant: false>
```
The AdminSet will be visible on the "relationships" tab of the deposit form. If you only have one admin set, it will be set by default. In order for it to work, a non-admin user must deposit a work, and an admin user must approve it.

#### Add a user to a workflow

```ruby
# First, you need a user
u = ::User.find_or_create_by(email: approver_email)
u.password = "123456"
u.save

# Then, you need to transform your User object into a Sipity::Agent
approving_agent = u.to_sipity_agent

workflow = a.active_workflow

# Get the Sipity::Role for approving
approval_role = Sipity::Role.find_by!(name: 'approving')

# Grant this one user the approving role for the EmoryETDs AdminSet
workflow.update_responsibilities(role: approval_role, agents: approving_agent)

```
<ul class="warning"><li>Calling `#update_responsibilities` on a workflow will add any agents you pass in the agents parameter, but it will also REMOVE any agents who are not in the agents parameter.</li></ul>

## How can an application set up workflow programatically?
 One pattern being used successfully is to put your workflow setup into its own class (e.g., `lib/workflow_setup.rb`) and give it a method (e.g., `setup`) that will configure everything as expected. That way you can follow best practice and make sure you are writing tests for it. Then, put something like this in `db/seeds.rb`:
```ruby
require 'workflow_setup'
w = WorkflowSetup.new
w.setup
```
Putting this code in `db/seeds.rb` means it will be called at the end of `bin/setup`, and you can call it anytime via `rake db:seed`

## How do I assign reviewers for a deposited work (e.g. ETDs) without creating lots of AdminSets?

Create a [Sipity::Method][sipity_method] to assign a reviewer based on some property of the deposited work (e.g. reviewers based on the work's department).

Before getting into the specifics of how to do this, let's do a quick overview of some key workflow concepts for this problem.

### Quick Overview of Workflow

For this particular issue, there are three primary concepts that you may want to reference:

1) Permissions are assigned at two levels:
  1) [Sipity::WorkflowResponsibility][sipity_workflow_responsibility] - A person has permissions to all things using this workflow
  1) [Sipity::EntitySpecificResponsibility][sipity_entity_specific_responsibility] - A person has permissions to only the work/entity
2) [Sipity::Method][sipity_method] - Something we `.call` when we take a Sipity::Action.
3) [Hyrax::Workflow::PermissionGenerator][hyrax_workflow_permission_generator] - Responsible for assigning permissions. **This could be bettern named as Hyrax::Workflow::PermissionAssigner**

### How to Do This

Referencing the [default workflow][template_workflows] there is a method object that is called when a user deposits a work: One method object, [Hyrax::Workflow::GrantEditToDepositor][hyrax_workflow_grant_edit_to_depositor], grants the user depositing rights for the deposit worked (eg. Sipity::EntitySpecificResponsibility).

You'll need to modify your workflow (an exercise left up to the reader) to include a method for the appropriate action. You may want to reference the [JSON workflow schema][json_workflow_schema] for proper syntax.

Then create (and test) your method object.

```ruby
module Hyrax::Workflow::AssignReviewerByDepartment
   def self.call(target:, **)
     reviewer = find_reviewer_for(department: target.department)
     # This assigns database permissions, but does not grant permissions on the Fedora object.
     Hyrax::Workflow::PermissionGenerator.call(entity: target, agent: reviewer, role: 'Reviewer')
     # Do you want to update the Fedora object? Then you'll need to make adjustments.
   end

   def self.find_reviewer_for(department:)
     # You do the work
   end
end

# Make sure to test that your method conforms to the Hyrax workflow method interface
RSpec.describe Hyrax::Workflow::AssignReviewerByDepartment do
  let(:workflow_method) { described_class }
  it_behaves_like "a Hyrax workflow method"

  # Don't forget to write specs for the business logic of this method
end
```

[sipity_method]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/models/sipity/method.rb
[sipity_entity_specific_responsibility]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/models/sipity/entity_specific_responsibility.rb
[sipity_workflow_responsibility]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/models/sipity/workflow_responsibility.rb
[json_workflow_schema]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/services/hyrax/workflow/workflow_schema.rb#L57
[hyrax_workflow_grant_edit_to_depositor]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/services/hyrax/workflow/grant_edit_to_depositor.rb
[templates_workflow]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/lib/generators/hyrax/templates/workflow.json.erb#L14
[hyrax_workflow_permission_generator]:https://github.com/samvera/hyrax/blob/b64ea8e0d20a60327c2e7a37a919d6daef8d9f00/app/models/sipity/method.rb

## How do I set up an app to use a given workflow by default?

coming soon...

## How do I diagram and configure a new workflow?

coming soon ...

## How do I test that all of this is working correctly?

coming soon ...
