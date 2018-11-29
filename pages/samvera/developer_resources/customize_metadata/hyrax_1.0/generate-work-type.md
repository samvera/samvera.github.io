---
title: "Prereq: Generating a Work Type"
permalink: customize-metadata-generate-work-type.html
keywords: ["Customize", "Metadata", "Work Types", "Tutorial"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

## Generating a new work type

We'll begin by generating a new Hyrax work-type for Hyrax for use in the tutorial.  We'll call our work type `GenericWork` although you could use any name you choose (e.g. `Image`, `ETD`, etc).  The first step is to run this generator:

```
$ bin/rails generate hyrax:work GenericWork
```

This will generate a number of files into your application.  Now we can update these files to handle our customized metadata.

---

<p><a href="customize-metadata-controlled-vocabulary.html"><button type="button" class="btn btn-primary">Next: Prereq: Defining a Controlled Vocabulary</button></a></p>
