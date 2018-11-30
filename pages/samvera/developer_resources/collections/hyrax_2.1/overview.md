---
title: "Understanding Collections in Hyrax"
permalink: collection-overview.html
keywords: ["Collection", "Hyrax"]
last_updated:
version:
  id: hyrax_2.1-stable
  label: 'Hyrax v2.1 (also applies to Hyrax v2.0.x)'
sidebar: home_sidebar
---

## History

Prior to Hyrax 2.1, there was one type of collection referred to as a User Collection.  They had the following characteristics.

* any user could create their own collections
* collections could be shared for edit or read access with other users
* collections could be discoverable if visibility is set to Public

## Collection Extensions

With Hyrax 2.1, there was an effort to extend collections functionality to provide new features, extend some of the existing features, and to provide control over some of the existing features.  The following is a brief description of the collection extensions functionality.

### Collection Types

It was recognized that not all sites veiw collections the same way.  Some may want collections to be unchanged.  Others may want some new features.  Others may want new features for some kinds of collections and not others.  

To address this, the concept of a collection type was added and most of the new features can be turned on or off through settings in the collection type.  For example, exhibit collection types can be configured to be created by only library staff, while user collections can continue to be creatable by all users.

By default, two collection types are defined to provide backward compatibility.

* Admin Set - configured with the same characteristics as admin sets have in Hyrax 2.0 and earlier
* User Collections - configured with the same characterics as described under the History section above.

For more information on Collection Types, see [Understanding Collection Types](collection-types.html) and [Understanding Collection Type Participants](collection-type-participants.html).

### Nesting

With collection nesting, a collection can be a member of another collection.  See [Collection Nesting FAQ](collection-nesting-faq.html) for more information.

### Sharing

Sharing has been extended to include manager, depositor, and viewer roles.  Managers have full edit access to the collection.  Depositors and viewers can view a collection even when visibility is set to private.  A depositor can add items to the collection.

There is an additional option that allows the same permissions to be granted on works when works are created directly in the collection.  See [Understanding Collection Sharing](collection-sharing.html) for more information.

### Discovery

The discovery setting controls which collection types allow collections to be discoverable by the public and which do not.  See [Collection Discovery FAQ](collection-discovery-faq.html) for more information.

### Multiple Membership

Collection types can be set to disallow multiple membership of works within collections of the same type.  FAQ TBA

### Branding

Branding provides the means to upload a banner image and logos that can give each collection a distinctive presence.  FAQ TBA
