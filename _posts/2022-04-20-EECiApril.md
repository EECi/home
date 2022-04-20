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

As part of the [Physics-based Domain Adaptation project](https://eeci.github.io/home/docs/projects/stoch/statespace/) we are developing a framework to improve energy forecasting in buildings by incorporating mechanistic knowledge about energy behaviour with data-driven methods in a domain adaptation (DA) schema. More specifically, our approach leverages the generalizability inate in the governing structure of mechanistic models such as linear time-invariant (LTI) state space models (SSM), to forecast for out-of-sample scenarios and longer time-frames beyond given building measurement data. By incorporating considerations of the governing structure in the modeling framework, we implcitly work towards global behaviour. 

What does the underlying structure of an energy system look like and what governs it? 

Any building energy system can be described as dynamic system whose observed behavior can be broken down into two main components: a) dynamics of the heat transfer phenomenon (e.g. conduction, convection) and b) the influence of external factors (e.g. external ambient temperature). The core characteristics of an energy system are in fact governed by a), and referred to as the state dynamics. We can think of the state dynamics as a mathematical vector field bound by the thermal states of the system. Thus, given a state space model, we can illustrate this vector field (left figure below) and quickly interpret how the dynamics behave in different state temperature scenarios, revealing the geometric structure of the global system in the process (right figure below). The geometry of the energy system is governed by the eigenvectors and eigevalues of the state dynamics component that explain the direction and rate of energy transfer to reach thermal equilibrium. 

How do we leverage the governing structure to forecast beyond given data?

In our DA approach we project
