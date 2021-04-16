---
layout: single
title: FDA
tags:
  - data-centric energy modelling
  - internal loads
author: "Rebecca"
excerpt: "Internal load modelling using Functional Data Analysis"
last_modified_at: 2021-03-09
read_time: true
toc: true
toc_sticky: true
---

# Ongoing research

## Stochastic internal loads for building energy simulation

This app generates example stochastic internal loads for input into Building Energy Simulation packages.

The required input is an estimate of the median expected hourly base load and load range (in units of Wh/m²/h), together with an estimate of the expected variability of the data on a scale of 1 to 4, where 1 corresponds to fairly regular demand and 4 corresponds to highly variable demand.

Clicking on 'Submit' will generate an hourly time history of demand for a period of 1 year, with weekends and bank holidays corresponding to the year 2019. This can be downloaded as the file 'SampleData.csv' by clicking on the 'Download' button.


 <iframe src="https://rmw61.pythonanywhere.com/" title="FDA design tool" width="800" height="400"> 
  
