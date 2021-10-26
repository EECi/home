---
layout: single
title: State Space Transformations
tags:
  - data-centric energy modelling
  - physics-enhanced maching learning
  - state space modeling
  - eigenanalysis
author: "Zack"
excerpt: "Reuse of energy models via state space transformations"
feature_row:
  - image_path: /Images/stoch/phase_plot.png
    alt: "Phase Space Transformations"
last_modified_at: 2021-10-26
read_time: true
toc: true
toc_sticky: true
---

**Overview**

The project aims to build efficient tools for assisting the decarbonization of buildings. 

Typical energy model representaions are categorised into analytical models such as FEA, or fully data-driven models such as polynomial regression or neural network. Analytical models offer full interpretability but can be computationally demanding to compute. On the other hand, data-driven models are typically not interpretable and data-intensive. These factors impede on the practicality of such models in real-world engineering applications. 

Thus, we are in need of better building energy modeling methods that are: **data-efficient**, and **interpretable**. 

In response, this project adopts a Physics-enhanced Machine Learning approach (Phi-ML), where knowledge about the structure of observed phenomenon (eg. ODE, PDE, etc.) is supplied as a basis of a Machine learning framework. The marriage of the two implies less data needed to capture struture from data, while maintaining interpretability of such structure. In more detail, we represent the structure of energy transfer in building components in the form of State Space Models (SSM), which is a method from control theory, to simplify the representation of dynamic behavior as a set of lienar equations. Despite simplification, an SSM contains all the necessary information to describe all possible trajectories within the state space. In other words, SSMs provide data-effiency while, preserve the structure of the dynamic phenomenon hence, interpretability.

{% include figure image_path="/Images/stoch/phaseProfile_sinlgeWall_parametricThickness_3.gif" alt="Phase portrait trajectories at varying wall thicknesses" caption="Phase portrait trajectories at varying wall thicknesses" %}


The project aims to identify linear transformation maps between SSMs of independent building components as a way to reuse the structure of dynamic systems.

**Team**

University of Cambridge: [Dr Ruchi Choudhary](http://www.eng.cam.ac.uk/profiles/rc488), head of the Energy Efficient Cities Initiative.
Alan Turing Institute: [Dr Zack Xuereb Conti](https://eeci.github.io/home/docs/people/zack/), postdoctoral researcher.
