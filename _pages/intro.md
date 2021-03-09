---
layout: splash
title: Introduction
permalink: /intro/
header:
  image: /Images/Group Logo.png
  caption: "Photo credit: [**Unsplash**](https://unsplash.com)"
tags:
  - edge case
  - featured image
  - image
  - layout
excerpt: 'We develop numerical tools to improve energy efficiency of cities'
intro: 
  - excerpt: 'Welcome to our website. Centered with `type="center"`'
feature_row:
  - image_path: /Images/eplan/main_eplan.jpg
    image_caption: "Fig by Andre"
    alt: "placeholder image 1"
    title: "Energy Planning"
    excerpt: "Andre Neto-Bradley, PhD Student, U. of Cambridge
Indian Institute of Human Settlements, India

Mingda Yuan, PhD Student, U. of Cambridge
Andrea Perkins + Will (Innovate UK Secondment)
"
  - image_path: /Images/ssenv/main_ssenv.jpg
    image_caption: "Image courtesy of Nick and Monika"
    alt: "placeholder image 2"
    title: "Placeholder 2"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--primary"
  - image_path: /Images/uag/main_uag.png
    title: "Placeholder 3"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
---

# Energy Efficient Cities initiative

![EECi Group Logo](/Images/Group Logo.png)

**Who We Are**

The Energy Efficient Cities initiative [EECi] is a cross-disciplinary research project at the University of Cambridge. The EECi aims to strengthen the UK's capacity to address energy demand reduction and environmental impact in cities, by research in building and transport technologies, district power systems, and urban planning. The three research themes we addressed during our original funding period were: City Planning and Design; Built Environment and Energy Systems; and Transport and Environment. This website covers ongoing work within the Built Environment and Energy Systems theme.


## Feature gallery

This includes the intro text

{% include feature_row id="intro" type="center" %}

This includes the three placeholder figs which could send to different projects

{% include feature_row %}


## Example graph
<b>Example Graph: </b>

<!-- Create object within webpage called example_object -->
<div id="example_object">
</div>
<!-- Call library -->
<script src="https://d3js.org/d3.v6.min.js"></script>

<!-- Script that contains a visualisation -->
<script>
const data = Object.values({
  "LINE1": [
    10,
    11,
    12,
    15
  ],
  "LINE2": [
    21,
    22,
    23,
    32
  ],
  "LINE3": [
    11,
    12,
    13,
    15
  ]
});

var line = d3.line()
  .x((d, i) => x(i))
  .y((d) => y(d));

// set the dimensions and margins of the graph
var margin = {
    top: 50,
    right: 100,
    bottom: 130,
    left: 120
  },
  width = 900 - margin.left - margin.right,
  height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#example_object")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", `translate(${margin.left}, ${margin.top})`);

// Add X axis
var x = d3.scaleLinear()
  .domain([0, d3.max(data, (d) => d.length)])
  .range([0, width]);

svg.append("g")
  .attr("transform", "translate(0," + height + ")")
  .call(d3.axisBottom(x).ticks(5));

// Add Y axis
// I need help in this area, how can I get the min and max values set in the domain?
var y = d3.scaleLinear()
  .domain([0, d3.max(data, (d) => Math.max(...d))])
  .range([height, 0]);

svg.append("g")
  .call(d3.axisLeft(y));

// Draw the line
// I need help in this area, how can I get the lines plotted, js gives error in this!
svg.selectAll(".line")
  .data(data)
  .enter()
  .append("path")
  .attr("fill", "none")
  .attr("stroke", "black")
  .attr("stroke-width", 1.5)
  .attr("d", (d) => line(d));

</script>


**Test: locations of participants in Miles for MS**

<iframe title="Participants in Miles for MS" aria-label="chart" id="datawrapper-chart-OEM92" src="https://datawrapper.dwcdn.net/OEM92/1/" scrolling="no" frameborder="0" style="width: 0; min-width: 100% !important; border: none;" height="509"></iframe>
<script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();
</script>

**Test: Adding heat map**

<!DOCTYPE html>
<meta charset="utf-8">

<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>

<!-- Create a div where the graph will take place -->
<div id="my_dataviz"></div>

<!-- Load color palettes -->
<script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>


<script>

// set the dimensions and margins of the graph
var margin = {top: 80, right: 25, bottom: 30, left: 40},
  width = 450 - margin.left - margin.right,
  height = 450 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#my_dataviz")
.append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
.append("g")
  .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

//Read the data
d3.csv("https://raw.githubusercontent.com/holtzy/D3-graph-gallery/master/DATA/heatmap_data.csv", function(data) {

  // Labels of row and columns -> unique identifier of the column called 'group' and 'variable'
  var myGroups = d3.map(data, function(d){return d.group;}).keys()
  var myVars = d3.map(data, function(d){return d.variable;}).keys()

  // Build X scales and axis:
  var x = d3.scaleBand()
    .range([ 0, width ])
    .domain(myGroups)
    .padding(0.05);
  svg.append("g")
    .style("font-size", 15)
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x).tickSize(0))
    .select(".domain").remove()

  // Build Y scales and axis:
  var y = d3.scaleBand()
    .range([ height, 0 ])
    .domain(myVars)
    .padding(0.05);
  svg.append("g")
    .style("font-size", 15)
    .call(d3.axisLeft(y).tickSize(0))
    .select(".domain").remove()

  // Build color scale
  var myColor = d3.scaleSequential()
    .interpolator(d3.interpolateInferno)
    .domain([1,100])

  // create a tooltip
  var tooltip = d3.select("#my_dataviz")
    .append("div")
    .style("opacity", 0)
    .attr("class", "tooltip")
    .style("background-color", "white")
    .style("border", "solid")
    .style("border-width", "2px")
    .style("border-radius", "5px")
    .style("padding", "5px")

  // Three function that change the tooltip when user hover / move / leave a cell
  var mouseover = function(d) {
    tooltip
      .style("opacity", 1)
    d3.select(this)
      .style("stroke", "black")
      .style("opacity", 1)
  }
  var mousemove = function(d) {
    tooltip
      .html("The exact value of<br>this cell is: " + d.value)
      .style("left", (d3.mouse(this)[0]+70) + "px")
      .style("top", (d3.mouse(this)[1]) + "px")
  }
  var mouseleave = function(d) {
    tooltip
      .style("opacity", 0)
    d3.select(this)
      .style("stroke", "none")
      .style("opacity", 0.8)
  }

  // add the squares
  svg.selectAll()
    .data(data, function(d) {return d.group+':'+d.variable;})
    .enter()
    .append("rect")
      .attr("x", function(d) { return x(d.group) })
      .attr("y", function(d) { return y(d.variable) })
      .attr("rx", 4)
      .attr("ry", 4)
      .attr("width", x.bandwidth() )
      .attr("height", y.bandwidth() )
      .style("fill", function(d) { return myColor(d.value)} )
      .style("stroke-width", 4)
      .style("stroke", "none")
      .style("opacity", 0.8)
    .on("mouseover", mouseover)
    .on("mousemove", mousemove)
    .on("mouseleave", mouseleave)
})

// Add title to graph
svg.append("text")
        .attr("x", 0)
        .attr("y", -50)
        .attr("text-anchor", "left")
        .style("font-size", "22px")
        .text("A d3.js heatmap");

// Add subtitle to graph
svg.append("text")
        .attr("x", 0)
        .attr("y", -20)
        .attr("text-anchor", "left")
        .style("font-size", "14px")
        .style("fill", "grey")
        .style("max-width", 400)
        .text("A short description of the take-away message of this chart.");


</script>

**Test: Adding an individual map**

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Point on a map D3</title>

<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="http://d3js.org/topojson.v1.min.js"></script>

<style type="text/css">
	.feature {
		fill: none;
		stroke: grey;
		stroke-width: 1px;
  		stroke-linejoin: round;
	}
	.mesh {
		fill: none;
  		stroke: lightgrey;
  		stroke-width: 2px;
  		stroke-linejoin: round;
	}
	h1 {
		font-family: sans-serif;
	}
</style>
</head>
<body>
	<h1>Point in the north west part of SF</h1>


<script type="text/javascript">

var width = 950,
    height = 550;

// set projection
var projection = d3.geo.mercator();

// create path variable
var path = d3.geo.path()
    .projection(projection);


d3.json("us.json", function(error, topo) { console.log(topo);

  	states = topojson.feature(topo, topo.objects.states).features

  	// set projection parameters
  	projection
      .scale(1000)
      .center([-106, 37.5])

    // create svg variable
    var svg = d3.select("body").append("svg")
    				.attr("width", width)
    				.attr("height", height);

    // points
    aa = [-122.490402, 37.786453];
	bb = [-122.389809, 37.72728];

	console.log(projection(aa),projection(bb));

	// add states from topojson
	svg.selectAll("path")
      .data(states).enter()
      .append("path")
      .attr("class", "feature")
      .style("fill", "steelblue")
      .attr("d", path);

    // put boarder around states 
  	svg.append("path")
      .datum(topojson.mesh(topo, topo.objects.states, function(a, b) { return a !== b; }))
      .attr("class", "mesh")
      .attr("d", path);

    // add circles to svg
    svg.selectAll("circle")
		.data([aa,bb]).enter()
		.append("circle")
		.attr("cx", function (d) { console.log(projection(d)); return projection(d)[0]; })
		.attr("cy", function (d) { return projection(d)[1]; })
		.attr("r", "8px")
		.attr("fill", "red")

});

</script>
    
</body>
</html>
