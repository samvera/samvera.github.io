---
title: "Workflow Cheat Sheet"
keywords: Mediated Deposit, Workflow, Sipity
categories: Workflow
permalink: workflow_cheat_sheet.html
folder: hydra/developer_resources/workflow_and_mediated_deposit/hyrax_1.0/workflow_cheat_sheet.md
sidebar: home_sidebar
tags: [development_resources]
---

# Handy commands

### Get the active workflow for a given admin set
```ruby
a = AdminSet.first
workflow = a.active_workflow
 => #<AdminSet id: "g732d8963", title: ["Laney Graduate School"], description: [], creator: ["redacted@fake.edu"], access_control_id: "ea6d2579-2f17-4e05-a348-f36716b783e5", representative_id: nil, thumbnail_id: nil>
```

### Get the workflow roles in a given workflow
```ruby
workflow_roles = workflow.workflow_roles
=> #<ActiveRecord::Associations::CollectionProxy [#<Sipity::WorkflowRole id: 12, workflow_id: 3, role_id: 1, created_at: "2017-06-19 16:49:09", updated_at: "2017-06-19 16:49:09">, #<Sipity::WorkflowRole id: 6, workflow_id: 3, role_id: 2, created_at: "2017-06-19 16:49:09", updated_at: "2017-06-19 16:49:09">, #<Sipity::WorkflowRole id: 5, workflow_id: 3, role_id: 3, created_at: "2017-06-19 16:49:08", updated_at: "2017-06-19 16:49:08">, #<Sipity::WorkflowRole id: 4, workflow_id: 3, role_id: 4, created_at: "2017-06-19 16:49:08", updated_at: "2017-06-19 16:49:08">]>
workflow_roles.map { |workflow_role| workflow_role.role.name }
 => ["managing", "depositing", "reviewing", "approving"]
```

### Print out all the users and their roles for a given workflow (useful for debugging)
```ruby
workflow = AdminSet.where(title: ["Laney Graduate School"]).first.active_workflow
User.all.each do |user|
  puts "-----"
  puts user.user_key
  roles = Hyrax::Workflow::PermissionQuery.scope_processing_workflow_roles_for_user_and_workflow(user: user, workflow: workflow).pluck(:role_id)
  puts roles.map { |r| Sipity::Role.where(id: r).first.name }
end
```

### Get the workflow states in a given workflow
```ruby
workflow_states = workflow.workflow_states.pluck(:name)
 => ["approved", "changes_required", "pending_approval", "pending_review"]
```
