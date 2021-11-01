---
layout: single
title: Digital Twin of Growing Underground
tags:
  - urban farming
  - digital twin
author: "Melanie"
excerpt: "Digital Twin of Growing Underground"
author_profile: false
read_time: true
last_modified_at: 2021-03-09
toc: true
toc_sticky: true
---

# Growing Underground

The <a href = "https://growing-underground.com/">Growing Underground (GU) farm </a> lies 33m below ground in previously disused London Underground Tunnels in Clapham. The farm grow microsalads for distribution across London, focussing on clean, sustainable and hyper-local nutritious crops. We have been working together with the farm developers (now <a href = "https://zerocarbonfarms.co.uk/"> Zero Carbon Farms </a>) since the initial pilot project, to monitor the internal environment of the tunnels and analyse energy and environment data to help understand the unique tunnel environment and thereby improve crop yields. In conjunction with <a href= "https://www.turing.ac.uk/"> the Alan Turing Institute </a> we are developing the world's first bespoke digital twin of an urban agricultural space.

# Digital twin concept

While controlled environment agriculture and vertical farming can be energy intensive, we are interested to find ways of making the farm operate more energy efficiently by better understanding the farm environment and giving advice in real-time. Combining GU's innovative and open to learn growing methods with regular data analysis, we found that GU's yield efficiency increased on average by 57% over five years.  

Having learned what makes crops grow better as a function of the environment and developed models to forecast internal environmental conditions, we are prototyping a digital twin of the farm, <a href="https://github.com/alan-turing-institute/CROP"> CROP </a>. 

There are three stages to the development of digital twins which are as essential as each other:

## Data collection and visualisation
The first step is to collect and visualise monitored data in (as near as possible) real-time.  For the farm, the important environmental parameters that can be continuously monitored are air temperature, relative humidity and air speed.  Also important are the energy consumption data, which is also continuously monitored.  Alongside these there are unstructured data which may need to be manually recorded, such as ventilation settings and crop growth and yield data.  In the CROP digital twin, these data are stored in a Microsoft Azure database and a web platform can be used to visualise the real-time and historic data. 

## Data analysis
Given sufficient nutrients in a hydroponic system, growth is limited by temperature, visible radiation levels and CO2 levels.  In this farm, temperature is the most significant variable factor, and data analysis has shown that different crops perform better under different temperature ranges - when taken in conjunction with monitored temperature variations throughout the tunnel, this analysis has helped to inform the best locations to grow specific crops within the tunnel environment. Other studies have comprehensively examined the relation between lighting and ventilation rates and the corresponding energy consumption with crop growth and yield. The analyses advised the data interpretation embedded within the digital twin; on the platform there are visualisations which indicate not just the current conditions, but also how the conditions have compared against the optimal values over the previous week, so the growers can have an immediate view as to whether crops are likely to be performing satisfactorily.

## Modelling
The added value of the digital twin over a simple monitoring and visualisation platform is in the inclusion of models. These can provide more in-depth information for parameters that cannot be measured directly, can provide forecasts of critical parameters (such as temperature), or can be used to perform scenario evaluations i.e. assess what would happen if the lights were switched off for a longer period of time per day.

The CROP digital twin will incorporate two different modelling approaches:

### Data-centric models
Forecasting internal temperatures to enable farm operators to take action to combat potentially sub-optimal temperature ranges.

### Physics-based model
Using the <a href= "eeci.github.io/home/docs/projects/urbanag/ges">Greenhouse Energy Simulation model</a> for evaluation of scenarios such as changes to lighting, ventilation or dehumidification rates.

These developments are ongoing.

# Use of digital twin

Once the models have been made, the challenge is delivering the results in real-time to yield observable results. This is under development.
