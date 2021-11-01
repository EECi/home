---
layout: single
title: Towards data-efficient and interpretable predictive energy modeling via State Space Adaptation
tags:
  - data-centric energy modelling
  - physics-enhanced maching learning
  - state space modeling
  - subspace alignment
  - dynamic mode decomposition
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
## Challenge
**_generalisability and interpretability_**

Machine learning-based methods have grown significantly popular across predictive-modeling communities mainly because they show promise in approximating complex relationships underlying data, with no understanding of the observed phenomenon required. However, it is an established caveat that ML-based models suffer a) from generalisability beyond the bounds of the dataset and b) from physical interpretability due to their black box nature. As a result, the combination of such factors often impedes on the implementability of ML-based prediction models for practical real-world engineering applications such as energy forecasting in model predictive control, what-if energy analysis and building design optimisation. 

## Hypothesis
**_recovering governing global dynamics_**

This research highlights that model generalisability and interpretability may be improved by focusing modeling effort towards recovering the global dynamics underlying the observed system behaviour. A common approach is to construct models from large exhaustive datasets in an indirect attempt to capture governing dynamics, but the latter often depends on the size and quality (noise) of the dataset, which is not always feasible to guarantee, especially in the case of empirical scenarios where experimental conditions are not always easy to control. So, how can we improve model generalisability in a data-efficient and interpretable manner? 

## Research Objective
**_a Physics-informed data-driven approach_**

This research works towards a Physics-informed data-driven approach which involves incorporating mechanistic models into the data-driven framework. Mechanistic models are derived from laws of Physics (in the form of ODEs, PDEs, etc.) and thus, their incorporation into the data-driven framework aims to bypass the need for exhaustive datasets while preserve physical interpretability of the underlying dynamics. 

## Technical Approach
**_state space modeling meets dynamic mode decomposition (DMD)_**

More specifically, the research marries low-rank (global) mechanistic models in the form of physcis-based State Space Models with unsupervised data-driven spectral-decomposition methods such as Dynamic Mode Decomposition, in a Subspace-alignment transfer learning framework. The goal is to adapt the interpretable mechanistic structure of the physics-based state space model (source) to the measured data (target) by aligning their respective underlying subspaces. Ultimately, we aim to recover the full governing state space field by adapting known physics knowledge-driven global state space fields to available data. 

**_State Space_**

The State Space can be described as a vector field whose vector coordinates guide the fundamental trajectories underlying the behaviour of the physical system under observation. State spaces can be mathematically represented by state space models (SSM), which are an algebraic system of linear equations for mechanistically representing any dynamic system that can be described by ordinary differential equations. Thus, focusing efforts towards recovering the vector field underlying a thermal system, contributes towards achieving prediction generalisability for any combination of state initial conditions because any trajectory in the state space is described by the governing model, while preserving physical interpretability of the governing dynamics. A state space can also be described as a subspace, whose boundaries are defined by the state vectors. 

{% include figure image_path="/Images/stoch/phaseProfile_sinlgeWall_parametricThickness_3.gif" alt="Phase portrait trajectories at varying wall thicknesses" caption="Overlayed state space trajectories of transient heat transfer through external walls of varying thicknesses." %}

**_Dynamic Mode Decomposition_**


## Team

University of Cambridge: [Dr Ruchi Choudhary](http://www.eng.cam.ac.uk/profiles/rc488), head of the Energy Efficient Cities Initiative.
Alan Turing Institute: [Dr Zack Xuereb Conti](https://eeci.github.io/home/docs/people/zack/), postdoctoral researcher.

## Collaborators

Alan Turing Institute, Imperial: [Dr Luca Magri](https://www.imperial.ac.uk/people/l.magri), Reader in data-driven Fluid mechanics.
