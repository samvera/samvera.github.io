---
title: "Hyku vs Hyrax?"
permalink: hyku-vs-hyrax.html
sidebar: home_sidebar
last_updated:
keywords: ["Hyku", "Hyrax"]
toc: false
tags: [getting_started]
summary: "What is the difference between Hyku and Hyrax? Which should I use?"
folder: samvera/getting_started/
---

## Where do I start Hyku or Hyrax?

Hyrax is a [Rails Engine](http://guides.rubyonrails.org/engines.html) that you can use to generate an application that you will deploy at your institution.  This application is the place for you to customize layouts, styles and behaviors so that it suits your purposes.  You will have to make some implementation decisions on your own (e.g. database, authentication, workers).  It should be easy to upgrade your application from one Hyrax version to the next.

Hyku is a pre-generated application built using Hyrax. It comes with some choices already made for you (database, authentication, workers) and we recommend you stick with these defaults.  Hyku offers some basic customization in the UI (text blocks, banner, colors) and we are working to expand the scope of these customizations. If you fork Hyku and start customizing, you should expect a painful upgrade process.
Hyku is build to support multi-tenancy to power the Hyku Direct service from Duraspace. Hyku comes with scripts for deploying using [Docker](https://www.docker.com/) and the [Amazon cloud services](https://aws.amazon.com/).  It should also be possible to deploy this locally, although you must set up all the [services](/service-stack.html) yourself.
