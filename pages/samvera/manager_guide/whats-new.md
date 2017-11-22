---
title: "What's New in Hyrax 2?"
permalink: whats-new.html
folder: samvera/manager_guide/whats-new.md
sidebar: home_sidebar
a-z: ['Administration']
keywords: Best Practices, managers, repo mangers, hyrax administration
tags: [user_resources]
categories: What's New
version:
  id: 'hyrax_2.0-master'
---

# What's New in Hyrax 2?

## Dashboard

Administrator and user functions used to be performed though separate dashboards. In Hyrax 2, these are consolidted into a single dashboard with sections: Activity, Reports (Administrator Only), Repository Contents, Tasks, and Configuration (Administrator Only).

![Adminstrator Dashboard](images\screenshots\admin-dashboard-2.png)

The User dashboard no longer contains the Create Work, Create Collection, View Files, and View Collections buttons on the main page of the Dashboard. These functions were moved to the sub-headings of the Repository Contents section in the new sidebar. The Activity, Notifications, Proxies, and Transfer of ownership tables remain. The user profile box was also moved to the Profile sub-heading of the Activity section in the sidebar.

![User Dashboard](images\screenshots\user-dashboard-2.png)

The Administrator dashboard renamed the Statistics page to Reports to reflect new reporting functionalities: Statistics by Date. Administators can query the repository directly on the page to see statistics related to Works and Users.

![Administrator Reports](images\screenshots\admin-reports-2.png)

The Configuration section is also a new addition to the Administrator dashbaord. This allows you to change repository settings and edit user roles for workflows. New settings will allow you to change the colors of the repository's header, background, links, and footer. The Configuration section also enables you to edit the About, Help, Deposit Agreement, and Terms of Use pages with a simple text editor.

## Languages

The user interface can now be translated into seven languages: English, Spanish, German, French, Italian, Portugese, and Chinese. Hyrax 1 only supports English and Spanish.

## Metadata

Licenses and Rights Statements used to be used to be in the required License field. They are now separate. The Rights Statement is required by default.

![Rights Statement](images\screenshots\work-rightstatement-2.png)

By default, the Rights Statement field allows users to select options with [RightStatements.org](http://rightsstatements.org/page/1.0/) URIs.

![License](images\screenshots\work-license-2.png)

While no longer required, the default license options are unchanged in Hyrax 2.

## How do I upgrade?

Please see the [release notes](https://github.com/samvera/hyrax/releases) for Upgrade information.
