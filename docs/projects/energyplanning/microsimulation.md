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
  
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.1.0/dist/leaflet.css"
     integrity="sha512-wcw6ts8Anuw10Mzh9Ytw4pylW8+NAD4ch3lqm9lzAsTxg0GFeJgoAtxuCLREZSC5lUXdVyo/7yfsqFjQ4S+aKw=="
     crossorigin=""/>
  <script src="https://d3js.org/d3.v4.js"></script>
  <script src="https://unpkg.com/leaflet@1.1.0/dist/leaflet.js"
     integrity="sha512-mNqn2Wg7tSToJhvHcqfzLMU6J4mkOImSPTxVZAdo+lcPlk+GhZmYgACEe0x35K7YzW1zJ7XyJV/TT1MrdXvMcA=="
     crossorigin=""></script>
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
</head>

<!-- Load d3.js -->


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
<div id="map" style="width: 100%; height: 80vh"></div>
<script type="text/javascript">
        var map = new L.Map(d3.select('div').node()).setView([35.678707, 139.739143], 12);
        mapLink = 
            '<a href="http://openstreetmap.org">OpenStreetMap</a>';
/*    
        var Stamen_Toner = L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner/{z}/{x}/{y}.{ext}', {
          attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
          subdomains: 'abcd',
          minZoom: 0,
          maxZoom: 20,
          ext: 'png'
        });
        Stamen_Toner.addTo(map);
*/
        var tile = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
          attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        });
        tile.addTo(map);
        var svg = d3.select(map.getPanes().overlayPane).append("svg")
        var g = svg.append("g").attr("class", "leaflet-zoom-hide");
    
          　　
    function mapPolygon(poly){
      return poly.map(function(line){return mapLineString(line)})
    }
    function mapLineString(line){
      return line.map(function(d){return [d[1],d[0]]})  
    }
  });
              
</script>

# Team
This is a part of the PhD project of André Neto-Bradley, supervised by Dr Ruchi Choudhary.

# Publications and Outputs


