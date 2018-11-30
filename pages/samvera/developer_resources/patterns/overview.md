---
title: "Overview of Design Pattern"
permalink: patterns-overview.html
keywords: ["Design Patterns"]
last_updated:
sidebar: home_sidebar
---

<ul class="info"><li><b>Best practice for classes is for each class to have a single responsibility.</b></li></ul>

Models, Views, and Controllers (MVC) are the basic patterns provided by Rails.  To adhere to the goal of single responsibility, we do not want to include code beyond the minimum required for these classes.  Additional processing and business logic are addressed in classes outside the MVC classes.  Design patterns are used to organize business logic that falls beyond the basic MVC pattern.

| Pattern | Primary Goal |
| ------- | ------------ |
| <a href="actor_stack.html">Actors</a> | Single responsibility classes that each address one action that is part of the create/update process for objects. |
| Forms | Isolate new/edit form views from business logic code. Primarily used to control which and how data fields are displayed in the forms. |
| Indexers | Creates solr documents for objects. |
| Inputs | Custom processing of input fields in forms. Used to with controlled vocabularies and when the input of one field effects options for another field. |
| Jobs | Background jobs. |
| <a href="patterns-presenters.html">Presenters</a> | Isolate views from business logic code related to showing information. Primarily used for constructing object show pages. |
|  <a href="building-searches.html">Search Builders</a> | Used to construct solr queries. |
| Services | Handle processing that falls outside of other patterns. Characterized by each service having a single responsibility. |
