---
layout: single
title: EECinsights - Progress on thermal archetypes
last_modified_at: 2022-03-28
author: "Monika"
author_profile: true
read_time: true
comments: true
share: true
related: true
excerpt: "Development of archetypes-based framework to model ground temperatures under cities"
---
As part of the [Monitoring and Modelling of Urban Underground Climate Change project](https://eeci.github.io/home/docs/subsurface/) we are developing a method to model large regions of ground beneath urban centres, such as central London.
Dense urban areas can be particularly difficult to model as these often have large amounts of infrastructure embedded in the ground, some of which can act as heat sources, such as basements, train tunnels, sewage networks, etc., ejecting heat into the surrounding ground.
Higher ground temperatures can give rise to 

{% include figure image_path="/Images/EECi_March_RegTree.png" alt="Regression tree for features in central London" %}

To help us determine underground temperature we use regression trees to cluster together thermal behaviours within small regions, incorporating features such as the presence and depth of besements and tunnels, hydrological parameters, and geological characteristics, to create 'archetypes'. 
We then model only these archetypes to approximate the temperautre disctribution undeground.

{% include figure image_path="/Images/ssenv/EECi_March_gif_TempDist.gif" alt="Subsurface temperature variations below RBKC and CoW" caption="Subsurface temperature variations below the boroughs of Kensington and Chelsea and City of Westminster" %}

The next stages of the work will include incorporating the presence of ground heat exchangers to enable us to do large scale shallow geothermal capacity modelling and explore how the presence of anthropogenic infrastructure in the ground can affect how much thermal energy can be usefully harnessed under cities.
