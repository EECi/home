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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
</br>

<h1 class="title"> A Case Study of Dogesthorpe </h1>

<div id="stickyarticle">
<h2 class="category">Places of Food</h2>
<img src="https://raw.githubusercontent.com/EECi/home/de9782682d7f1a8618278302a87900d8e12a340f/Images/eplan/Dogesthorpe_Overview.png">
<h2 class="category">Gendered Experiences of Place</h2>	
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
