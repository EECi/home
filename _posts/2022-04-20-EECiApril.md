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

Any building energy system can be described as dynamic system whose observed behavior can be broken down into components: a) the heat transfer dynamics (e.g. conduction, convection) and b) the influence of external factors such as external ambient temperature. The structure of the energy system is governed by the a), also referred to as the state space. It is in fact the structure of the state space that is of great interest in this work. We view the structure from a geometric perspective by vialusing it as a vector field that describes fully the behaviour of the system for any combination of state values.  phase portrait. The core characteristics driving the comined The structural core governing the system is dominated by the unforced dynamics which we can illustrate geometricaly as a vector field.   



is driven by We view the governing structure of an energy system from a geometric lens where the mathemtical space bound by the states describing the system . 

that leverages the generalizability inate in the governing structure of 

incorporate  mechanistic knowledge about energy behaviour from Physics in buildings to improve the forecasting generalizability. 

The generalizing extent and forecasting range of typical data-driven models used for predicting building energy behaviour depends heavily on the size and system representativeness of the data is trained on. Thus, such models tend to have difficulty generalizing to out-of-sample scenarios that are not represented in the data. 

In our project, we leverage the generalizability inate in mechansitic knowledge  Our project highlights the need of better building energy modelling and forecasting methods whose generalizability and interpretability are not bound to the data-driven fitting and finetuning of hidden structures but rather methods that consider correspondence to governing structures. I.e., they can generalize for out of sample scenarios without depending on extensive datasets while maintain physical interpretability of the underlying dynamics.  

More specifically, our approach incorporates Physics-derived state space models (SSM) into a Domain Adaptation Framework to leverage the generalizability and interpretability innate in the governing structure of the SSM.

