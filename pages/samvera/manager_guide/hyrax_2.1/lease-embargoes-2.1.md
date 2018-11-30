---
title: "Managing Leases and Embargoes (2.1)"
permalink: lease-embargoes-2.1.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Embargoes"
  - "Leases"
version:
  id: 'hyrax_2.1-stable'
  versions:  
    - label: 'Hyrax 2.0'
      link:  'lease-embargoes-2.0.html'
    - label: 'Hyrax 2.1'
      link:  'lease-embargoes-2.1.html'
      selected: 'true'
---
To manage leases, as a repository administrator, go to the Dashboard. Beneath the 'Tasks' heading you have the option to manage Leases and Embargoes.

**Manage Leases:**

![Manage Leases](/images/screenshots/admin-tasks-leases.png)

**Manage Embargoes:**

![Manage Leases](/images/screenshots/admin-tasks-embargoes.png)

## Leases

![Manage Leases](/images/screenshots/manage-leases.png)

**Leases do not automatically expire. Leases need to be updated manually.**

The Manage Leases page contains three tabs:
- All Active Leases: Works where leases are current
- Expired Active Leases: Works where leases are expired but they are still available and access status has not been changed
- Deactivated Leases: Works that are out of lease and access status has been changed

To deactivate leases:
- Click the “Expired Active Leases” tab
- Select works to release (optionally leave all files in lease state by unchecking the box “Change all files within work _ to _ status _ )
- Click button “Deactivate Leases for Selected” or deactivate individually.

## Embargoes

![Manage Embargoes](/images/screenshots/manage-embargoes.png)

**Embargoes do not automatically expire. Embargoes need to be updated and deactivated manually.**

The Embargo management page contains three tabs:
- All Active Embargoes: Works where embargoes are current
- Expired Active Embargoes: Works where embargo dates have passed but they are still under embargo status
- Deactivated Embargoes: Works that are currently out of embargo status and access status has been changed

To deactivate embargoes:
- Click the “Expired Active Embargoes” tab
- Select works to release (optionally leave all files in embargo state by unchecking the box “Change all files within work __ to _ status _ )
- Click button “Deactivate Embargoes for Selected” or deactivate individually. Deactivating an embargo before the original embargo date has passed requires an additional step of manually updating the work's visibility in order for the work's visibility status to change.
