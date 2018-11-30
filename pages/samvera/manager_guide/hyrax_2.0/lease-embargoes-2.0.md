---
title: "Managing Leases and Embargoes (2.0)"
permalink: lease-embargoes-2.0.html
keywords:
  - "Best Practices"
  - "Managers"
  - "Repository Managers"
  - "Hyrax Administration"
  - "Embargoes"
  - "Leases"
version:
  id: 'hyrax_2.0-stable'
  versions:  
    - label: 'Hyrax 2.0'
      link:  'lease-embargoes-2.0.html'
      selected: 'true'
    - label: 'Hyrax 2.1'
      link:  'lease-embargoes-2.1.html'
---
## Leases

![Manage Leases](/images/screenshots/manage-leases.png)

**Leases do not automatically expire. Leases need to be updated manually.**

To manage leases, go to `repository-url/leases`

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

To manage embargoes, go to `repository-url/embargoes`

The Embargo management page contains three tabs:
- All Active Embargoes: Works where embargoes are current
- Expired Active Embargoes: Works where embargo dates have passed but they are still under embargo status
- Deactivated Embargoes: Works that are currently out of embargo status and access status has been changed

To deactivate embargoes:
- Click the “Expired Active Embargoes” tab
- Select works to release (optionally leave all files in embargo state by unchecking the box “Change all files within work __ to _ status _ )
- Click button “Deactivate Embargoes for Selected” or deactivate individually
