---
layout: single
title: State Space Transformations
tags:
  - data-centric energy modelling
  - state space model
  - eigenstructure
author: "Zack"
excerpt: "Reuse of energy models via state space transformations"
last_modified_at: 2021-05-11
read_time: true
toc: true
toc_sticky: true
---

**Overview**

The project aims to build efficient tools for assisting the decarbonization of buildings. Two main types of energy representations are analytical models such as FEA, which can be computationally demanding, or fully data-driven models such as polynomial regression or neural network, whose fidelity depends heavily on the size of the dataset and additionally, the underlying structure can be difficult to interpret. 

Thus, we are in need of better methods for representing energy behavior of spaces: require less data to build without compromising fidelity and are interpretable. 

This project investigates the resuse of systems
 
{% include figure image_path="/Images/stoch/phaseProfile_sinlgeWall_parametricThickness_3.gif" alt="Phase portrait trajectories at varying wall thicknesses" caption="Phase portrait trajectories at varying wall thicknesses" %}

**Team**

University of Cambridge: [Dr Ruchi Choudhary](http://www.eng.cam.ac.uk/profiles/rc488), head of the Energy Efficient Cities Initiative.
Alan Turing Institute: [Dr Zack Xuereb Conti](https://eeci.github.io/home/docs/people/zack/), postdoctoral researcher.
