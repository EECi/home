---
layout: single
title: Where We Live Next - Understanding Space and Place through Food
tags:
  - Energy inequality
  - Spatial inequality
  - Residential energy use
  - Clustering
author: "André"
excerpt: "A trans-disciplinary approach to scaling community voices for place-sensitive policy-making through places and practices of food"
last_modified_at: 2021-03-24
toc: true
header:
  overlay_image: /Images/eplan/fishy_business.jpeg
toc_sticky: true
---


<html>
<head>
<!-- Load d3.js -->
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css"/>
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-ajax/2.1.0/leaflet.ajax.min.js"></script>
<script type="text/javascript" src="https://raw.githubusercontent.com/EECi/home/c75f83f4fa4b9951d1712ca5c000d2ee972a9de2/data/geodata.js"></script>

<style>
.leaflet-container {
			height: 400px;
			width: 600px;
			max-width: 100%;
			max-height: 100%;
		}
  .info {
    padding: 6px 8px;
    font: 14px/16px Arial, Helvetica, sans-serif;
    background: white;
    background: rgba(255,255,255,0.8);
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    border-radius: 5px;
}
.info h4 {
    margin: 0 0 5px;
    color: #777;
}
.legend {
    line-height: 18px;
    color: #555;
}
.legend i {
    width: 18px;
    height: 18px;
    float: left;
    margin-right: 8px;
    opacity: 0.7;
}
</style>	
	
<style>
div.container2 {
    width: 800px;
    height: 600px;
    position: relative;
}

div.slimage {
    height: 100%;
    background-repeat: no-repeat;
    background-position: top left;
    background-size: cover;
    position: absolute;
    top: 0px;
    left: 0px;
}

div.before {
    width: 50%;
    background-image: url("https://raw.githubusercontent.com/EECi/home/a2b94e63230fcd8bc3ec9d4d8a3d047a88b32418/Images/eplan/Doge_GenF_Web.png");
    z-index: 2;
}

div.after {
    width: 100%;
    background-image: url("https://raw.githubusercontent.com/EECi/home/cf2c17a05296a305ab41068b3dbbfdcfa761a010/Images/eplan/Doge_GenM_Web.png");
    z-index: 1;
}

input.slider {
    width: 100%;
    height: 100%;
    outline: none;
    background-color: transparent;
    position: absolute;
    margin: 0px;
    z-index: 3;
    cursor: pointer;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    transition: 0.25s all ease-in-out;
    -moz-transition: 0.25s all ease-in-out;
    -webkit-transition: 0.25s all ease-in-out;
    z-index: 4;
}

input.slider::-moz-range-thumb {
    width: 6px;
    height: 610px;
    background-color: #ed207b;
    cursor: pointer;
}

input.slider::-webkit-slider-thumb {
    width: 6px;
    height: 600px;
    background-color: #ed207b;
    cursor: pointer;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
}

div.slider-button {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    -moz-broder-radius: 50%;
    -webkit-border-radius: 50%;
    background-color: white;
    position: absolute;
    top: calc(50% - 18px);
    left: calc(50% - 18px);
    cursor: pointer;
    z-index: 3;
}

div.slider-button:before {
    color: #ed207b;
    position: absolute;
    top: 3px;
    left: 0px;
    content: "\2B9C";
}

div.slider-button:after {
    color: #ed207b;
    position: absolute;
    top: 3px;
    right: 0px;
    content: "\2B9E";
}

@media (max-width: 767px) {
    div.container2 {
        width: 100%;
        height: 250px;
    }
</style>  
  
<script>
$(document).ready(function() {

    $("input.slider").on("input change", function(event) {
        var pos = event.target.value;

        $("div.before").css({width: pos + "%"});
        $("div.slider-button").css({left: "calc(" + pos + "% - 18px)"});
    });

});
</script>
</head>
<body>

<h1 class="category">Context</h1>

Using the lens of places and practices of food this project will explore a mixed methods approach for scaling lived experience across city-scale data and models and to expose intangible features of community spaces. By layering analysis of places and practices of food onto spatial and model data on deprivation and fuel poverty this research contextualises invisible relationships and dynamics of a community through visible patterns of urban fabric. 

<div id="map" style="width: 800px; height: 600px"></div>

<script type="text/javascript">
  
        var map = L.map('map').setView([52.59,-0.22614], 13);
        mapLink ='<a href="http://openstreetmap.org">OpenStreetMap</a>';

        var Stamen_Toner = L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner/{z}/{x}/{y}.{ext}', {
          attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
          subdomains: 'abcd',
          minZoom: 0,
          maxZoom: 20,
          ext: 'png'
        });
        
        Stamen_Toner.addTo(map);

        var svg = d3.select(map.getPanes().overlayPane).append("svg")
        var g = svg.append("g").attr("class", "leaflet-zoom-hide");
  
</script>

<h1 class="category"> A Case Study of Dogesthorpe </h1>
<div id="stickyarticle">
<h2 class="category">Places of Food</h2>
The map below shows the spatial distribution of different types of places of food listed on Google Maps in Dogesthorpe.
<img src="https://raw.githubusercontent.com/EECi/home/3240ec68c8f5db92068a7f68705446119310b89a/Images/eplan/Dogesthorpe_Overview.png">
<h2 class="category">Gendered Experiences of Place</h2>	
Click and drag the divider below to see the difference between male and female ratings for places in Dogesthorpe.
<div class="container2">
	<div class="slimage before"></div>
	<div class="slimage after"></div>

	<input type="range" class="slider" min="1" max="100" value="50" />
	<div class="slider-button"></div>
</div>
  <h2 class="title">Places of Food</h2>
  <h2 class="title">In-Depth Analysis of Reviews</h2>
	<body>TBC</body>
</div>


</body>
</html>
