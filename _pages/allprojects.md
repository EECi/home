---
layout: splash
permalink: /projects/
title: All projects
excerpt: "We can fill this in with an image up here."
header:
  overlay_color: "#58585A"
description: An overview of EECi projects
last_modified_at: 2021-03-29
sidebar:
  title: "Sitemap"
  nav: "docs"
classes: wide
toc_sticky: true
toc_icon: "columns"
excerpt: "Overview of the EECi projects"
projects_current:
  - image_path: /Images/ssenv/ssenv_logo_v2.png
    alt: "Sub-surface Environments Project"
    title: "Subsurface energy"
    excerpt:  "Improving the effective and equitable use of the shallow subsurface as a thermal resource by combining data and modelling."
    url: "/docs/subsurface/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
    
  - image_path: /Images/eplan/eplan_logo.png
    alt: "Urban Energy Planning"
    title: "Energy Planning"
    excerpt: "Exploring the use of data science tools to improve understanding and modelling of urban energy use."
    url: "/docs/energyplanning/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
    
  - image_path: /Images/uag/urbag_logo.png
    title: "Urban agriculture"
    excerpt: "Understanding and modelling the impact of plants on the built environment including greenhouses and building-integrated agriculture"
    url: "/docs/urbanag/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
    
  - image_path: /Images/stoch/DCM_logo.png
    alt: "placeholder image 2"
    title: "Data-centric Energy Modeling"
    excerpt: "Using monitored energy data to understand and model energy demand across diverse spatial and temporal scales"
    url: "/docs/stoch/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
    
projects_past:
  - image_path: /Images/bbem/bbem_content_image.png
    image_caption: "B.bem: the Bayesian building management portal"
    alt: "placeholder image 2"
    title: "B.bem"
    excerpt:  "B.bem project explored transforming conventional energy analysis processes to support the future energy management of existing non-domesting buildings"
    url: "/docs/bbem/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
  - image_path: /Images/cimo/cimo_1.png
    image_caption: "CiMo Model"
    alt: "placeholder image 2"
    title: "CiMo"
    excerpt:  "A bottom-up engineering model of energy demand, supply, and emissions from buildings and surface transport at the city scale."
    url: "/docs/cimo/"
    btn_label: "View this project"
    btn_class: "btn--inverse"
    
---



# Current Projects

{% include feature_row id="projects_current" %}

# Past Projects

{% include feature_row id="projects_past"%}

