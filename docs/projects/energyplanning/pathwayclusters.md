---
layout: single
title: Identifying Residential Energy Transition Pathways
tags:
  - Energy inequality
  - Clean cooking
  - Residential energy use
  - Clustering
author: "André"
excerpt: "Using clustering methods to combine qualitative and quantitative approaches, and identify and characterise energy transition pathways for low-income households in urban India"
last_modified_at: 2021-04-16
toc: true
header:
  overlay_image: /Images/eplan/Fuel_Stacking_wide.jpg
toc_sticky: true
---
<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>



# Context

Understanding urban residential energy use and clean energy transitions requires understanding and characterising heterogeneity across households arising due to differences in socio-economic and cultural context. This research has looks into the use of mixed data and clustering methods to identify distinct typologies or pathways for transition to clean cooking fuel use by low-income households in urban India.

<div id="stickyarticle">
<h1 class="category">Clustering with mixed methods</h1>
<h2 class="title">Using qualitative and quantitative data</h2>
<div id="wrapper">
  <div id="sticky">
    <img id="sticky"
         src="/home/Images/eplan/LPG_Distributor.jpg"
         alt="LPG Distributor in Bangalore"
         caption="Photo credit: A Neto-Bradley">
  </div>
  <body>Understanding factors that influence energy use in urban areas involves characterising complex socio-economic and cultural factors and effects. Not all of these are easily captured or analysed using quantitative methods. Qualitative methods commonly used in the social sciences including the analysis of qualitative in-depth interviews can reveal nuances and important decision making context that cannot be identified through quantitative methods. However these qualitative methods can be difficult to scale up in the same way as quantitative analysis.<br>
  <br>
  We sought to combine the both quantitative and qualitative data in our approach to leverage the benefits of analysis of each individually. </body>
</div>
  <h2 class="title">Identifying transition pathways</h2>
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <div id="my_dataviz"></div>
  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
  <h2 class="title">Identifying transition pathways</h2>
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!-- Add 2 buttons -->
<button class="btn {{ f.btn_class }}" onclick="update('var1')">Variable 1</button>
<button class="btn {{ f.btn_class }}" onclick="update('var2')">Variable 2</button>

<!-- Create a div where the graph will take place -->
<div id="my_dataviz_2"></div>

  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
</div>

# Team
This is a part of the PhD project of André Neto-Bradley, supervised by Dr Ruchi Choudhary. This research was carried out in collaboration with the Indian Institute for Human Settlements (IIHS), with supervision from Dr Amir Bazaz and support from research associate Rishika Rangarajan.

# Publications and Outputs


<!-- Graphic -->

<script>

// set the dimensions and margins of the graph
var margin = {top: 10, right: 30, bottom: 30, left: 60},
    width = 760 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#my_dataviz")
  .append("svg")
    // Responsive SVG needs these 2 attributes and no width and height attr.
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 760 400")
     .classed("svg-content-responsive", true)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

//Read the data
d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/5_OneCatSevNumOrdered.csv", function(data) {

  // group the data: I want to draw one line per group
  var sumstat = d3.nest() // nest function allows to group the calculation per level of a factor
    .key(function(d) { return d.name;})
    .entries(data);

  // Add X axis --> it is a date format
  var x = d3.scaleLinear()
    .domain(d3.extent(data, function(d) { return d.year; }))
    .range([ 0, width ]);
  svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x).ticks(5));

  // Add Y axis
  var y = d3.scaleLinear()
    .domain([0, d3.max(data, function(d) { return +d.n; })])
    .range([ height, 0 ]);
  svg.append("g")
    .call(d3.axisLeft(y));

  // color palette
  var res = sumstat.map(function(d){ return d.key }) // list of group names
  var color = d3.scaleOrdinal()
    .domain(res)
    .range(['#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00','#ffff33','#a65628','#f781bf','#999999'])

 
  // Draw the line
  svg.selectAll(".line")
      .data(sumstat)
      .enter()
      .append("path")
        .attr("fill", "none")
        .attr("stroke", function(d){ return color(d.key) })
        .attr("stroke-width", 1.5)
        .attr("d", function(d){
          return d3.line()
            .x(function(d) { return x(d.year); })
            .y(function(d) { return y(+d.n); })
            (d.values)
        })

})

</script>

<script>

// set the dimensions and margins of the graph
  var marginWhole2 = {top: 30, right: 30, bottom: 70, left: 60},
    sizeWide = 760 - marginWhole2.left - marginWhole2.right
    sizeHigh = 400 - marginWhole2.top - marginWhole2.bottom;

// append the svg object to the body of the page
var svgGroups = d3.select("#my_dataviz_2")
    .append("svg")
    // Responsive SVG needs these 2 attributes and no width and height attr.
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 760 400")
     .classed("svg-content-responsive", true)
    .append("g")
      .attr("transform", "translate(" + marginWhole2.left + "," + marginWhole2.top + ")");
  

// Initialize the X axis
var x = d3.scaleBand()
  .range([ 0, sizeWide ])
  .padding(0.2);
var xAxis = svgGroups.append("g")
  .attr("transform", "translate(0," + sizeHigh + ")")

// Initialize the Y axis
var y = d3.scaleLinear()
  .range([ sizeHigh, 0]);
var yAxis = svgGroups.append("g")
  .attr("class", "myYaxis")

// A function that create / update the plot for a given variable:
function update(selectedVar) {

  // Parse the Data
  d3.csv("https://raw.githubusercontent.com/holtzy/D3-graph-gallery/master/DATA/barplot_change_data.csv", function(data) {

    // X axis
    x.domain(data.map(function(d) { return d.group; }))
    xAxis.transition().duration(1000).call(d3.axisBottom(x))

    // Add Y axis
    y.domain([0, d3.max(data, function(d) { return +d[selectedVar] }) ]);
    yAxis.transition().duration(1000).call(d3.axisLeft(y));

    // variable u: map data to existing bars
    var u = svgGroups.selectAll("rect")
      .data(data)

    // update bars
    u
      .enter()
      .append("rect")
      .merge(u)
      .transition()
      .duration(1000)
        .attr("x", function(d) { return x(d.group); })
        .attr("y", function(d) { return y(d[selectedVar]); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return sizeHigh - y(d[selectedVar]); })
        .attr("fill", "#69b3a2")
  })

}

// Initialize plot
update('var1')

</script>
