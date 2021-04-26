---
layout: single
title: B.Bem
permalink: /docs/bbem/
excerpt: 'Transforming conventional energy analysis processes to support the future energy management of existing non-domesting buildings'
tags:
  - edge case
  - featured image
  - image
  - layout
---

<div id="stickyarticle">
<h1 class="category">B.bem</h1>
<h2 class="title">The Challenge</h2>
<div id="wrapper">
  <div id="stickybody">One of the greatest challenges facing the built environment is how to reduce energy consumption attributable to existing buildings. Energy management focuses on the day-to-day operation and the impact of operational decisions on energy consumption can be difficult to forecast. In addition, building refurbishment may present an ideal opportunity to reduce the carbon footprint but the wealth of retrofit options available makes it almost impossible to be confident that the ‘right’ decisions are made. Our research aims to help the decision-making process by providing information about the risks associated with the decision-making in a format that is easily understood by the stakeholders. We are investigating uncertainty quantification in building simulation models and how the uncertainty may be propagated through the simulation to forecast risk.</div>
  </div>
<h2 class="title">What is B.bem?</h2>
<div id="wrapper">
  <div id="stickybody">The ambition of the B.bem project is to transform conventional energy analysis processes to support the future energy management of existing non-domesting buildings – whether to assist in small-scale changes to building operations or deep energy retrofits. The aim is to quantify stochastic and operational uncertainties influencing building energy use, and to propagate those uncertainties through simulation models.  B.bem, the Bayesian building energy management portal, will use computer simulation of building energy consumption to help energy managers understand the risk associated with energy management decisions.

B.bem is being developed in a 3 year project, which started in October 2014, funded by the Engineering and Physical Sciences Research Council (EPSRC) as part of the Energy Management in Non-domestic Buildings programme.</div>
</div>

<h2 class="title">How does B.Bem work?</h2>
<div id="wrapper">
    <div id="stickybody">
    <img id="stickybody"
         src="/home/Images/bbem/bbem_content_image.png"
         alt="B.bem Overview"
         caption="Photo credit: EECi">
  </div>
  </div>
<h3 class="title">Model 1: Occupant Services</h3>
<div id="wrapper">
  <div id="stickyflex">
    <img id="stickyflex"
         src="/home/Images/bbem/fda_approach.png"
         alt="FDA Approach"
         caption="Photo credit: EECi">
  </div>
  <div id="stickybody">From an in-depth analysis of electricity consumption data from the William Gates building in Cambridge, a methodology has been developed in which the demand is characterised by the base load, load range (peak load - base load) and a diversity profile which represents the daily temporal variation between base and peak loads.  

Parameterisation in this way reveals the similarities and differences between different use types.  Comparison of the diversity profiles shows a clear difference between different types of use.  A functional data analysis approach is being used to explore and quantify the ways in which the shape of diversity profiles for different use types vary. 

Using functional Principal Component Analysis the diversity can be described mathematically as a weighted sum of a mean function and an appropriate number of functional principal components as shown above.  Sample values drawn from a probability distribution of the function weightings may then be used to generate a stochastic diversity function for use in the quantification of uncertainty.  

Initial results are encouraging; for the limited study considered so far the simulation results compare well against the monitored data for key parameters of interest including the timing of the daily peak demand.  </div>
</div>
<h3 class="title">Model 3: Energy Supply Systems</h3>
<h4 class="sub-title">Ground-source heat pump systems</h4>
<div id="wrapper">
  <div id="stickyflex">
    <img id="stickyflex"
         src="/home/Images/bbem/System_overview.png"
         alt="GSHP System Overview"
         caption="Photo credit: EECi">
  </div>
  <div id="stickybody">The hybrid ground-source heat pump system of the Architecture Design Studio building is used as a case study to develop and test a comprehensive framework for uncertainty quantification, sensitivity analysis and Bayesian calibration for energy supply system models. </div>
</div>
<h4 class="sub-title">Sensitivity analysis</h4>
<div id="wrapper">
  <div id="stickyflex">
    <img id="stickyflex"
         src="/home/Images/bbem/Sensitivity_results.png"
         alt="Sensitivity analysis results"
         caption="Photo credit: EECi">
  </div>
  <div id="stickybody">As large uncertainty ranges and non-linear behavior can cause unstable results, an alternative sensitivity measure was developed that allows robust evaluation of parameter importance at low computational costs. In addition, an extension to Morris method for the estimation of parameter interaction effects was devised. </div>
</div>
<h4 class="sub-title">Model Calibration</h4>
<div id="wrapper">
    <img src="/home/Images/bbem/Bayesian_inference.png"
         alt="Bayesian inference"
         caption="Photo credit: EECi">
  <div id="stickybody">In the next step, the prior expectations about the uncertainty of these important model parameters, based on expect knowledge and technical information, are combined with measured data from the system and computer model outputs in a Bayesian calibration approach. This approach is being adapted for the use of energy system data that suffers from outliers and data gaps, and enables inference of posterior probability distributions of parameters.</div>
    <img src="/home/Images/bbem/calibration_results.png"
         alt="Calibration Results"
         caption="Photo credit: EECi">
  <div id="stickybody">The resulting posterior distributions represent an update of our knowledge about the real values of uncertain model parameters, and are fed back into the system model to produce more accurate prediction results. </div>
  </div>
  <h4 class="sub-title">Exergy analysis</h4>
<div id="wrapper">
  <div id="stickyflex">
    <img src="/home/Images/bbem/bbem.png"
         alt="Exergy Analysis"
         caption="Photo credit: EECi">
  </div>
  <div id="stickybody">In addition, a thermodynamic model of the system is being developed to study the detailed energy and exergy flows through the individual system components, such as the heat pump or the heat exchanger. This flow can be visualized by an exergy flow diagram, which shows the decrease in exergy content in the supply fluid from the source to the system output as part of the exergy content is consumed within each system component. </div>
</div>
</div>



