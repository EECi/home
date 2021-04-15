---
layout: single
title: Greenhouse Energy Simulator
tags:
  - urban farming
  - digital twin
author: "Rebecca"
excerpt: "Modelling physics of Greenhouse"
last_modified_at: 2021-03-09
toc: true
toc_sticky: true
---

# Ongoing research

## Growing Underground

Monitoring is currently under way at the Growing Underground facility in Clapham, London, to record temperature, humidity and CO2 levels. This visionary facility aims to bring edible crop production to the heart of the city, using the disused WW2 Deep Shelter sites, thereby minimising the carbon impact of food transportation. The monitored data is being used to develop and validate a Greenhouse Energy Simulation model for the prediction of the energy consumption of the site.

## Greenhouse energy simulation

The GES code simulates heat, mass and CO2 exchange in an unheated, ventilated single-zone greenhouse for a simple test case. The heat transfer processes simulated include convection, conduction and radiation, together with plant transpiration for simulation of heat and mass exchange due to evaporation of water from the leaf surface. Simple models of photosynthesis and crop growth for tomatoes are included in order to simulate CO2 exchange. The model is based on the GDGCM (Pieters, J. and Deltour, J., 'The Gembloux Dynamic Greenhouse Climate Model - GDGCM', 2000 ) and on the thesis by Vanthoor (Vanthoor, B.H.,'A model-based greenhouse design method', PhD Thesis, Wageningen University, 2011).

The MATLAB code can be accessed [here](https://github.com/EECi/GES).  The code is currently being translated into Python and will be uploaded shortly.

# Completed research

## Royal Botanic Gardens, Kew
A retrofit study of the buildings at the [Royal Botanic Gardens, Kew](https://www.kew.org/), highlighted the need to incorporate the heat and mass transfer associated with plant transpiration into the dynamic building energy simulation for the ornamental glasshouses. A simulation tool was developed for the analysis of the glasshouses and was used in conjunction with DELORES and DENO to complete a district energy analysis of the RBG Kew site, incorporating building retrofit in addition to optimisation of district energy supply options.

This study was supported by the [Royal Academy of Engineering](https://www.raeng.org.uk/) and the [Daphne Jackson Trust](https://daphnejackson.org/). 

## Model development
An [EPSRC](https://epsrc.ukri.org/) funded Impact Acceleration grant enabled the simulation model used at RBG Kew to be extended to the case of edible crops, where crop yield is an important outcome, directly affected by the indoor environment of the greenhouse. This work was supported by [APS Salads](https://apsgroup.uk.com/), who provided extensive data for validation of the model.

A TRNSYS module was developed in order to enable dynamic building energy simulation of building-integrated agriculture systems such as the Rooftop Greenhouse at [Seawater Greenhouse](https://seawatergreenhouse.com/) headquarters in Hackney, London.
