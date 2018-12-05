---
title: "Admin Sets as Collections FAQ"
permalink: admin-sets-as-collections-faq.html
keywords: ["Admin Set", "Collection", "FAQ"]
last_updated:
tags: [development_resources]
summary: "A comparison of the similarities and differences between Administrative Sets and Collections in Hyrax 2.1"
version:
  id: hyrax_2.1-stable
  label: 'Hyrax v2.1 (also applies to Hyrax v2.0.x)'
sidebar: home_sidebar
---

### Are Admin Sets a type of collection?

An Admin Set is a pseudo collection.  There is a collection type called Admin Set with predetermined configurations that match the existing behaviors of Admin Sets in Hyrax 2.0 and earlier.  For the initial implementation of collection extensions, it was decided to keep the existing code that manages Admin Sets.  In the user interface, Admin Sets are presented to the user as if they were collections.  

### How are Admin Sets treated in the UI?

The Admin Set configurations are consistent with the concept of Collections allowing Admin Sets to be presented to the user in the UI as though they were just another collection.  The UI adjustments include...

* REMOVED Dashboard Menu → Repository Content → Administrative Sets
* ADDED Dashboard Menu → Repository Content → Collections
  * Lists collections of all types including Admin Sets.
  * Clicking an Admin Set will go to the current UI for managing an Admin Set.
  * When creating a new collection, if the collection type is selected to be Admin Set, it will go to the existing New form for Admin Sets.  
  * When editing an Admin Set, it will go to the existing Edit for for Admin Sets.
  * All Admin Sets will have a `Private` visibility badge. This badge does not represent the visibility settings for the works associated with the Admin Set. The visibility badge is set to `Private` because Admin Sets do not have public landing pages and cannot themselves be discoverable to end-users.

### Can the configuration for Admin Sets collection type be changed?

You cannot change...
* Type name
* Checkbox settings on the Collection Type Settings tab

You can change...
* Description
* Participants (i.e., managers and creators)

### What is the configuration for Admin Sets?

The Hyrax 2.0 behaviors for Admin Sets determine the settings.  Effectively, the configuration is...

| | Admin Sets (effective) configuration |
| --- | ------------------------------------ |
| Basic: | <font color='red'>X</font> <font color='grey'>NESTABLE</font><br><font color='red'>X</font> <font color='grey'>MULTIPLE MEMBERSHIP</font><br><font color='red'>X</font> <font color='grey'>DISCOVERY</font><br><font color='green'>√</font> SHARING |
| Advanced: | <font color='green'>√</font> REQUIRE MEMBERSHIP<br><font color='green'>√</font> WORKFLOW<br><font color='green'>√</font> VISIBILITY |

### Why not just go ahead and switch Admin Sets to be a Collection Type?

* Changes at this level to Admin Sets would require significant changes to existing sites.
* There is a lot of work required to create the extended functionality for collections. Due to time limitations, that work was not part of the initial implementation.
* There are outstanding questions about the functional split between Admin Sets and Collections and what it would mean for more than one collection type to have some of the advanced settings.

Ultimately, there was a conscious choice to minimize churn for those already moving toward production with Hyrax using the current definition of Admin Sets.
