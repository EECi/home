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
  
<script src="//d3js.org/d3.v4.min.js"></script>
<script src="//d3js.org/d3-tile.v0.0.min.js"></script>
<script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-legend/2.25.6/d3-legend.min.js"></script>
<style>
  svg,
  #tiles {
  position: absolute;
  width: 760px;
  height: 760px;
  overflow: hidden;
}
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
  <div id="stickyflex">
    <img id="stickyflex"
         src="/home/Images/eplan/20210414_Microsim_Overview.png"
         alt="Microsimulation overview"
         caption="Figure credit: A Neto-Bradley">
  </div>
  <div id="stickybody">Urban energy models tailored to the data availability and circumstances of the Global South are lacking, and India is no exception to this. Given the rapid rate of growth in cities, ,odels that accurately reflect the heterogeneity across households and spatial ineuqality will be key to improving provision of clean and reliable energy.</div>
</div>
  <h2 class="title">A Bayesian multilevel model</h2>
<div id="wrapper">
    <img src="/home/Images/eplan/Bayesian_Micro_Slim.png"
         alt="Multilevel model components"
         caption="Figure credit: A Neto-Bradley">
  <div id="stickybody">Previous work identifying clean cooking transition pathways amongst low-income households showed that different typologies of household wth distinct barriers to transition were influenced by effects at three different levels. Firstly energy use was shaped by intrinsic features of the household and resulting energy use practices of the household. Secondly, local socio-cultural context of the neighbourhood the household is in was found to influence energy use. Finally city-wide policy and economic context also played a role in dteermining the barriers to access faced by a given household. <br>
  <br>
  Using a Bayesian multilevel model with household level and city ward level components to account for these three levels of factor our model reflected the nature of social influence on heterogeneity of energy use across households in a city.</div>
</div>
  <h2 class="title">City Simulation</h2>
<div id="wrapper">
    <img src="/home/Images/eplan/Microsimulation_GIF.gif"
         alt="Multilevel microsimulation model features animation"
         caption="Figure credit: A Neto-Bradley">
  </div>
    <div id="stickybody">The map above shows mean estimated monthly LPG consumption by ward in the city of Coimbatore, Tamil Nadu. </div>
</div>
</div>

<!-- <div class="parallax"></div> -->

<!-- <div class="parallax2"></div> -->

<!-- <div class="parallax3"></div> -->
<!-- <div id="map" style="width: 100%; height: 50vh"></div>
  <script type="text/javascript">
  
        var map = L.map('map').setView([10.8306,78.7079], 12);
        mapLink = 
            '<a href="http://openstreetmap.org">OpenStreetMap</a>';

        var Stamen_Toner = L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner/{z}/{x}/{y}.{ext}', {
          attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
          subdomains: 'abcd',
          minZoom: 12,
          maxZoom: 12,
          ext: 'png'
        });
        
        Stamen_Toner.addTo(map);

        var svg = d3.select(map.getPanes().overlayPane).append("svg")
        var g = svg.append("g").attr("class", "leaflet-zoom-hide");           
        </script> -->



<script>

var pi = Math.PI,
    tau = 2 * pi;

var svg = d3.select("svg"),
    width = +svg.attr("width"),
    height = +svg.attr("height");
    
// Initialize the projection to fit the world in a 1×1 square centered at the origin.
var projection = d3.geoMercator()
    .scale(1 / tau)
    .translate([0, 0]);

// Compute the projected bounding box given a geographic bounding box (here, California).
// This assumes parallels are horizontal and meridians are vertical…
// but you could use path.bounds to handle arbitrary shapes.
// Note that the y-dimension is flipped relative to latitude!
var bounds = [[78.64, 10.78],[78.74, 10.87]],
    p0 = projection([bounds[0][0], bounds[1][1]]),
    p1 = projection([bounds[1][0], bounds[0][1]]);

// Convert this to a scale k and translate tx, ty for the projection.
// For crisp image tiles, clamp to the nearest power of two.
var k = floor(0.95 / Math.max((p1[0] - p0[0]) / width, (p1[1] - p0[1]) / height)),
    tx = (width - k * (p1[0] + p0[0])) / 2,
    ty = (height - k * (p1[1] + p0[1])) / 2;

projection
    .scale(k / tau)
    .translate([tx, ty]);

// Lastly convert this to the corresponding tile.scale and tile.translate;
// see http://bl.ocks.org/mbostock/4150951 for a related example.
var tiles = d3.tile()
    .size([width, height])
    .scale(k)
    .translate([tx, ty])
    ();

d3.select("#tiles")
  .selectAll("img").data(tiles).enter().append("img")
    .style("position", "absolute")
    .attr("src", function(d, i) { return "https://stamen-tiles-" + "abc"[d[1] % 3] + ".a.ssl.fastly.net/toner/" + d[2] + "/" + d[0] + "/" + d[1] + ".png"; })
    .style("left", function(d) { return (d[0] + tiles.translate[0]) * tiles.scale + "px"; })
    .style("top", function(d) { return (d[1] + tiles.translate[1]) * tiles.scale + "px"; })
    .attr("width", tiles.scale)
    .attr("height", tiles.scale);


function floor(k) {
  return Math.pow(2, Math.floor(Math.log(k) / Math.LN2));
}

// Data and color scale
var data = d3.map();
var colorScale = d3.scaleLinear()
  .domain([0,80,140])
  .range(["#96000e","#ffffff","#7fcac3"]);
//d3.schemeBlues[7]

var legend = d3.legendColor()
    .scale(colorScale)
    .orient("vertical")
    .title("Mean LPG ")
    .shapePadding(0)
    .cells(6);
    
// Load external data and boot
d3.queue()
  .defer(d3.json, "https://raw.githubusercontent.com/EECi/home/main/data/trichy_json.geojson")
  .defer(d3.csv, "https://raw.githubusercontent.com/EECi/home/main/data/trichy_json.csv", function(d) { data.set(d.zone, +d.mean); })
  .await(ready);

function ready(error, topo) {
// create a tooltip
  var Tooltip = d3.select("svg")
    .append("svg")
    .attr("class", "tooltip")
    .style("opacity", 0)
    .style("background-color", "white")
    .style("border", "solid")
    .style("border-width", "2px")
    .style("border-radius", "5px")
    .style("padding", "5px")


let mouseOver = function(d) {
   Tooltip.style("opacity", 1)
   d3.selectAll(".Country")
      .transition()
      .duration(1000)
      .style("opacity", .5)
   d3.select(this)
      .transition()
      .duration(1000)
      .style("opacity", 1)
      .style("stroke", "black")
  }

let mouseMove = function(d) {
    Tooltip
      .html("<body>The mean LPG use of <br> ward </body>")
      .style("left", (d3.mouse(this)[0]+70) + "px")
      .style("top", (d3.mouse(this)[1]) + "px")
  }

let mouseLeave = function(d) {
     Tooltip
      .style("opacity", 0)
    d3.selectAll(".Country")
      .transition()
      .duration(1000)
      .style("opacity", .8)
    d3.select(this)
      .transition()
      .duration(1000)
      .style("stroke", "transparent")
  }

  svg.append("g")
    .attr("transform", "translate(650,500)")
    .call(legend);
    
  // Draw the map
  svg.append("g")
    .selectAll("path")
    .data(topo.features)
    .enter()
    .append("path")
      // draw each ward
      .attr("d", d3.geoPath()
        .projection(projection)
      )
      // set the color of each ward
      .attr("fill", function (d) {
        d.total = data.get(d.properties.zone) || 0;
        return colorScale(d.total);
      })
      .style("stroke", "transparent")
      .attr("class", function(d){ return "Country" } )
      .style("opacity", .8)
      .on("mouseover", mouseOver )
      .on("mousemove", mouseMove )
      .on("mouseleave", mouseLeave )
    }


</script>

# Team
This is a part of the PhD project of André Neto-Bradley, supervised by Dr Ruchi Choudhary.

# Publications and Outputs


