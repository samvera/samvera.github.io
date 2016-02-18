---
title: "Dive Deeper into Hydra"
---

# Dive Deeper into Hydra

1. Legacy Data modeling
  1. What modeling looked like in "Dive into Hydra"
    * `has_many/belongs_to` or `has_and_belongs_to_many`
  1. Shortcomings
    * Every project has a unique structure
    * Lack of ordering
    * Resource contention
1. PCDM
  1. History
  1. Structural model
  1. Hands on
  1. Projection onto LDP
    * LDP Containers
    * ORE Aggregation
    * List node
  1. Problems
    * Lots of writes
    * Resource contention
      * Explain multiple process writing to a linked list.
      * Redlock
1. Curation Concerns
  1. Structure
    * Model
    * Actor
    * Indexer
    * Presenter
    * Form
