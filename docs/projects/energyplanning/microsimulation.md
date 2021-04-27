---
layout: single
title: City-scale Energy Use Microsimulation
tags:
  - Energy inequality
  - Clean cooking
  - Residential energy use
author: "André"
excerpt: "Using spatial microsimulation and bayesian methods to model socio-cultural and spatial heterogeneity in residential clean energy transition in Indian cities"
last_modified_at: 2021-04-22
toc: true
header:
  overlay_image: /Images/eplan/Kochi_microsim.jpg
toc_sticky: true
---
<head>
<style>
.parallax {
  /* The image used */
  background-image: url("/home/Images/eplan/Kochi_Model_1.png");

  /* Set a specific height */
  height: 100vh;
  width: 100%;
  
  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: 768px auto;
}
.parallax2 {
  /* The image used */
  background-image: url("/home/Images/eplan/Kochi_Model_2.png");

  /* Set a specific height */
  height: 100vh; 
  width: 100%;

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: 768px auto;
}
.parallax3 {
  /* The image used */
  background-image: url("/home/Images/eplan/Kochi_Model_3.png");

  /* Set a specific height */
  height: 100vh; 
  width: 100%;

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: 768px auto;
}
</style>
<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>
</head>


# Context

Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.

<div id="stickyarticle">
<h1 class="category">A microsimulation approach</h1>
<h2 class="title">Generating synthetic populations for Indian cities</h2>
<div id="wrapper">
  <div id="sticky">
    <img id="sticky"
         src="/home/Images/eplan/LPG_Distributor.jpg"
         alt="LPG Distributor in Bangalore"
         caption="Photo credit: A Neto-Bradley">
  </div>
  <div id="stickybody">Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</div>
</div>
  <h2 class="title">A Bayesian multilevel model</h2>
<div id="wrapper">
  <div id="sticky">
    <img id="sticky"
         src="/home/Images/eplan/LPG_Distributor.jpg"
         alt="LPG Distributor in Bangalore"
         caption="Photo credit: A Neto-Bradley">
  </div>
  <div id="stickybody">Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</div>
</div>
</div>

<!-- <div class="parallax"></div> -->

<!-- <div class="parallax2"></div> -->

<!-- <div class="parallax3"></div> -->
<div id="container" class="svg-container"></div>
    <script type="text/javascript">
    var w = 1400;
    var h = 700;
    var svg = d3.select("div#container")
    .append("svg")
      .attr("preserveAspectRatio", "xMinYMin meet")
      .style("background-color","#c9e8fd")
    .attr("viewBox", "0 0 " + w + " " + h)
    .classed("svg-content", true);
    var projection = d3.geoMercator().translate([w/2, h/2]).scale(2200).center([0,40]);
    var path = d3.geoPath().projection(projection);

  // load data  
var worldmap = d3.json("countries.geojson");
var cities = d3.csv("cities.csv");

Promise.all([worldmap, cities]).then(function(values){    
 // draw map
    svg.selectAll("path")
        .data(values[0].features)
        .enter()
        .append("path")
        .attr("class","continent")
        .attr("d", path),
 // draw points
    svg.selectAll("circle")
        .data(values[1])
        .enter()
        .append("circle")
        .attr("class","circles")
        .attr("cx", function(d) {return projection([d.Longitude, d.Lattitude])[0];})
        .attr("cy", function(d) {return projection([d.Longitude, d.Lattitude])[1];})
        .attr("r", "1px"),
 // add labels
    svg.selectAll("text")
        .data(values[1])
        .enter()
        .append("text")
        .text(function(d) {
                    return d.City;
               })
        .attr("x", function(d) {return projection([d.Longitude, d.Lattitude])[0] + 5;})
        .attr("y", function(d) {return projection([d.Longitude, d.Lattitude])[1] + 15;})
        .attr("class","labels");

    });

</script>

# Team
This is a part of the PhD project of André Neto-Bradley, supervised by Dr Ruchi Choudhary.

# Publications and Outputs


