---
title: "Understanding Collections Types"
permalink: collection-types.html
keywords: ["Collection", "Collection Type"]
last_updated:
version:
  id: hyrax_2.1-stable
  label: 'Hyrax v2.1 (also applies to Hyrax v2.0.x)'
sidebar: home_sidebar
---

## Understanding Collection Types

It was recognized that not all sites veiw collections the same way.  Some may want collections to be unchanged.  Others may want some new features.  Others may want new features for some kinds of collections and not others.  

To address this, the concept of a collection type was added and most of the new features can be turned on or off through settings in the collection type.  

### Use Cases

What is your use case for collecting together works?  The Collection Extensions Requirements Working Group identified several use cases.  The first two of the following use cases are provided by Hyrax for backward compatibility.  The others are examples of collection types you could choose to create.

**Admin Sets** (preconfigured)

An administrative grouping of works that an administrative unit is ultimately responsible for managing. The set itself helps to manage the items within it. (See [Admin Sets as Collections FAQ](admin-sets-as-collections-faq.html) for more information.)

**User Collections** (preconfigured)

An intellectual grouping of works, primarily used by individual users to create groups of items or favorites.

**Exhibits**

A grouping of existing works into an exhibit oriented toward display of content to end users.

**General Nested**

Provide the ability to nest collections for the purpose of organizing content.  Several use cases fall into this category and have significant overlap of requirements.  These include DSpace migrated content (i.e. Community → Collection), organization unit based collections (e.g. University → School → Department; Agency → Sub-agency; etc.), and general nesting for organizing materials.  


Don’t see your use case?  That’s ok, because Collection Types allow you to define and configure your own type.

### Configuring a Collection Type

You can add as many collection types as you need for your system.<sup>1</sup>  Before we start configuring types, let's look at the configuration options that define the behaviors of a collection type.

**Basic configurations:**

* NESTABLE Allow collections to be nested (a collection can contain other collections)
* MULTIPLE MEMBERSHIP Allow a work to belong to multiple collections
* DISCOVERY Allow collections to be discoverable
* SHARING Allow users to assign collection managers, depositors, and viewers for collections they manage
* REQUIRE MEMBERSHIP<sup>2</sup> A work must belong to at least one collection of this type

**Advanced configurations:<sup>3</sup>**

* WORKFLOW Allow collections of this type to assign workflow to a new work
* VISIBILITY  Allow collections of this type to assign initial visibility settings to a new work

**Proposed but not implemented**

* CONTROL VISIBILITY  Visibility of works in collections of this type are controlled by the settings in the collection


**Collection Participants:**

* assign Collection Managers (groups or users) who can edit collections other users have created, including adding to and removing works from a collection, modifying collection metadata, and deleting collections
* assign Collection Creators (groups or users) who can create and manage their own collections


<font color="gray">Footnotes:</font>

<sup>1</sup>  Based on use cases identified so far, it is expected that the number of collection types will be less than 5.  There isn't a limit on the number of collection types you can create, but you might want to consider this in your application design.

<sup>2</sup>  The only use case identified for required membership is Admin Sets.  At this point in time, you cannot set this option for collection types you create.

<sup>3</sup>  General use of the advanced configurations are not part of the collection extensions except for Admin Sets.  You cannot set these options for collection types you create.


----
### Basic Configuration Process

The process for defining and configuring a collection type is quite simple.  Note that only admin users can create and configure collection types.

**Step 1:  Create a new collection type from Dashboard -> Settings -> Collection Types -> Create new collection type**

**Step 2:  Set type name, type description, and click Save**  

Note:
* Users will see the type name and description when selecting a type of collection to create.  The information provided should help them decide the appropriate collection type to create.
* The collection type name be used in filters and as a collection type badge in a number of places in the UI.  It is generally best to keep the collection type name short.

**Step 3:  Define configuration settings**

![Collection Type Settings](images\screenshots\collection_type_settings.png)

**Step 4:  Set participants serving as managers and creators for collections of this type**

![Collection Type Participants](images\screenshots\collection_type_participants.png)

See [Understanding Collection Type Participants](collection-type-participants.html) for more information.


### Example Configurations - User Collections and Exhibits

The current implementation of collections in Hyrax is the User Collection.  This implementation has worked well for some sites, but may be limiting for others.  In this example, we will look at several configurations. 1) a configuration that matches the current implementation of user collections, 2) user collections as they might be defined in a self-deposit site, 3) user collections as they might be defined in a staff curated site, and 4) exhibit collections that are curated by staff.

**User Collections for a self-deposit site**

In this case, general users who self-register for the system are providing all the content.  They are building collections that may have value to the public.  These user collections are discoverable by the public.

**User Collections in a staff curated site**

In this case, the content that is discoverable by the public are Exhibit type collections.  Staff curate the content that goes into exhibits.  User Collections in this site are used by staff to organize work they are responsible for in what ever way makes their work easier.  These personal collections are not exhibits for public view and are not discoverable.

**Exhibit**

In this definition of Exhibit type, Exhibit collections create a grouping of items for display to public users.


| Default User Collection<br>(backward compatible) | User Collections<br>for a self-deposit site | User Collections<br>in a staff curated site | Exhibit             |
| ------------------------------------------------ | ---------------------------------------- | ---------------------------------------- | ------------------- |
| <font color='red'>X</font> <font color='gray'>NESTABLE</font>               | <font color='green'>√</font> NESTABLE                                       | <font color='green'>√</font> NESTABLE                                       | <font color='red'>X</font> <font color='gray'>NESTABLE</font>            |
| <font color='green'>√</font> MULTIPLE MEMBERSHIP                            | <font color='green'>√</font> MULTIPLE MEMBERSHIP                            | <font color='green'>√</font> MULTIPLE MEMBERSHIP                            | <font color='green'>√</font> MULTIPLE MEMBERSHIP |
| <font color='green'>√</font> DISCOVERY (public by default)                  | <font color='green'>√</font> DISCOVERY                                      | <font color='red'>X</font> <font color='gray'>DISCOVERY</font>              | <font color='green'>√</font> DISCOVERY           |
| <font color='green'>√</font> SHARING                                        | <font color='green'>√</font> SHARING                                        | <font color='green'>√</font> SHARING                                        | <font color='green'>√</font> SHARING             |
| <font color='red'>X</font> <font color='gray'>SHARE APPLIES TO WORKS</font> | <font color='red'>X</font> <font color='gray'>SHARE APPLIES TO WORKS</font> | <font color='red'>X</font> <font color='gray'>SHARE APPLIES TO WORKS</font> | <font color='green'>√</font> SHARE APPLIES TO WORKS             |
| <font color='red'>X</font> <font color='gray'>REQUIRE MEMBERSHIP</font>  | <font color='red'>X</font> <font color='gray'>REQUIRE MEMBERSHIP</font>  | <font color='red'>X</font> <font color='gray'>REQUIRE MEMBERSHIP</font>  | <font color='red'>X</font> <font color='gray'>REQUIRE MEMBERSHIP</font>  |


Self-deposit site vs. Curated site...
* For a self-deposit site, there may be only one collection type defined, that is, the User Collections for a self-deposit site.
* For a curated site, there may be both User Collections in a staff curated site and Exhibit collections.

Exhibits
* You may want to choose to apply share permissions to works if works are created as the exhibit collections are being built.
* You may want to choose NOT to apply share permissions to works if the exhibit collections are mostly built from existing works.

NOTE:  Your site may define User Collections and Exhibits different than what is presented here.



### Can I change a collection type's settings?

Yes and no.

You can change the setting (i.e. Nestable, Discovery, Sharing, Multiple Membership, Require Membership, Workflow, and Visibility) until a collection of that type is created.  Once a collection of a type exists, the checkable configurations can no longer be changed.

Why Not?  If we allowed these to change, existing collections of that type would require transmogrification.  This is not currently allowed for work types and is not planned for collection types due to the complexity of handling this on the fly.

You can continue to update Managers and Creators.  And you can continue to add a new collection type, if needed.

### Can I change the configurations of the preconfigured User Collection?

The short answer is NO.  But if you are asking this, then presumably you want to have your User Collections behave differently.

Here are some strategies.

* If your application is new and you do not have any collections being migrated from Hyrax 2.0 or earlier, then you can
  * change the name of the preconfigured User Collection to UNUSED and remove all participants from the creator role (you can use something like rails console to delete it)
  * create a new type called User Collection, which you can configure to meet you needs

* If you migrated collections from Hyrax 2.0, you could
  * rename User collection to something like Legacy User Collection.  Migrated user collections will have this type.
  * create a new type called User Collection, which you can configure to meet you needs.  New user collection will have this type.
