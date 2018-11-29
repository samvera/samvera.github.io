---
title: "Understanding the Controller"
permalink: customize-metadata-controller.html
keywords: ["Controller", "Customize", "Metadata", "Tutorial"]
last_updated:
version:
  id: 'hyrax_1.0-stable'
sidebar: home_sidebar
---

<ul class='info'><li>This tutorial assumes that you generated a work type name GenericWork.  If you used a different name, substitute that name for all occurrences of GenericWork and generic_work.</li></ul>

The GenericWorksController class is generated with some default behaviors.  It is located at `app/controllers/curation_concerns/generic_works_controller.rb`

```ruby
# Generated via
#  `rails generate hyrax:work GenericWork`

module Hyrax
  class GenericWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = GenericWork
  end
end
```

As usual, you can add code for special processing to the controller.  The controller's main purpose is to connect it to other classes that define the model, set up forms, and display show pages.


## Files defined by the controller...

### Model class

The model class, which is part of the standard Rails Model-View-Controller, has its name determined by Rails convention.

`model_name = controller_name minus 'Controller'` (e.g. GenericWork)


### Form class

The form class is used to control how metadata appears on the new/edit work form.  A form class is created for each work type when the work type is generated.  The controller knows about this class through the [work_form_service.rb form_class](https://github.com/samvera/hyrax/blob/master/app/services/hyrax/work_form_service.rb) method.

Default: form_class = model_name.name + Form (e.g. GenericWorkForm)

Modifying: You can change the class that is used as the form class by setting it in the controller.

```ruby
    self.form_class = GenericWorkExtForm # UNCOMMON, see note below.
```

NOTE:
- It is uncommon to set self.form_class as the form class is already generated (e.g. GenericWorkForm) and can hold your extensions.



### Presenter class

The presenter class is used to control how metadata appears on the work show page.  This class is NOT generated.  See [Modifying the Show Page](customize-metadata-show-page.html) for more information on creating a presenter class.  The default presenter class is defined in [works_controller_behavior.rb](https://github.com/samvera/hyrax/blob/master/app/controllers/concerns/hyrax/works_controller_behavior.rb)

Default: show_presenter = Hyrax::WorkShowPresenter

Modifying: You can change the class that is used as the presenter class by setting it in the controller.

```ruby
    self.show_presenter = GenericWorkPresenter
```

---

<p><a href="customize-metadata-labels.html"><button type="button" class="btn btn-primary">Prev: Labels and Help Text</button></a>  <a href="customize-metadata-model.html"><button type="button" class="btn btn-primary">Next: Defining Metadata in the Model</button></a></p>
