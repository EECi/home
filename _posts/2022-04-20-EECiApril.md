---
layout: single
title: EECinsights - Physics-based Domain Adaptation for Building Energy Forecasting
last_modified_at: 2022-04-20
author: "Zack"
author_profile: true
read_time: true
comments: true
share: true
related: true
excerpt: "A Physics-based domain adaptation framework for energy modeling and forecasting in buildings."
---

As part of the [Physics-based Domain Adaptation project](https://eeci.github.io/home/docs/projects/stoch/statespace/) we are developing a framework to improve energy forecasting in buildings by incorporating mechanistic knowledge about energy behaviour with data-driven methods, in a domain adaptation (DA) schema. DA is an emerging subfield of Transfer Learning where knowledge is transferred across domains. In our project we present a novel DA approach that leverages the generalizability innate in the governing structure of mechanistic models such as linear time-invariant (LTI) state space models (SSM), to forecast for out-of-sample scenarios and longer time-frames beyond given building measurement data. By incorporating considerations of the governing structure in the modeling framework, we implicitly work towards global behaviour. 

**_What does the underlying structure of an energy system look like and what governs it?_**

Any building energy system can be described as dynamic system whose observed behavior can be broken down into two main components: A) the dynamics of the heat transfer phenomenon (e.g. conduction, convection) and B) the influence of external factors (e.g. external ambient temperature). The core characteristics of an energy system are in fact governed by A, and referred to as the state dynamics. We can think of the state dynamics as a mathematical vector field bound by the thermal states of the system. Thus, given a state space model, we can illustrate this vector field (left figure below) and quickly interpret how the dynamics behave in different state temperature scenarios, revealing the geometric structure of the global system in the process (right figure below). The geometry of the state space is governed entirely by the eigenvectors and eigevalues of the state dynamics component. In thermal dynamics, the eigenvectors and eigenvalues represent the direction and rate of energy trajectories in the state space to reach thermal equilibrium. 

{% include figure image_path="/Images/EECi_April_ssfield_w=0.2.png" alt="Phase portrait trajectories at varying wall thicknesses" caption="State space vector field" %}
{% include figure image_path="/Images/EECi_April_vecfield_w=0.2.png" alt="Phase portrait trajectories at varying wall thicknesses" caption="State space vector field"%}

**_How do we leverage the governing structure to forecast beyond given data?_**

In our Physics-based DA approach we seek for geometric transformations between the Physics-derived sysem and measurment data by seeking for geomtric transformations between the Physics-derived eigenvectors and 
