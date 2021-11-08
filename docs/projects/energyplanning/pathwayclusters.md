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

Understanding urban residential energy use and clean energy transitions requires understanding and characterising heterogeneity across households arising due to differences in socio-economic and cultural context. This research looks into the use of mixed data and clustering methods to identify distinct typologies or pathways for transition to clean cooking fuel use by low-income households in urban India.

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
  <h2 class="title">Time Series Example</h2>
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!--<div id="my_dataviz"></div> -->
  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
   <h2 class="title">XY Example</h2>
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <div id="my_datapoints"></div>
  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
  <h2 class="title">Grouped Bar Chart Example</h2>
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!-- Add 2 buttons -->
<button class="btn {{ f.btn_class }}" onclick="update('1')">Cluster 1</button>
<button class="btn {{ f.btn_class }}" onclick="update('2')">Cluster 2</button>
<button class="btn {{ f.btn_class }}" onclick="update('3')">Cluster 3</button>
<button class="btn {{ f.btn_class }}" onclick="update('4')">Cluster 4</button>
<button class="btn {{ f.btn_class }}" onclick="update('5')">Cluster 5</button>

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
var margin = {top: 30, right: 30, bottom: 30, left: 60},
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
    .range(['#ed217b','#ee3788','#f04d95','#f263a2','#f479af','#f690bd','#f7a6ca','#f9bcd7','#fbd2e4'])

  // create a tooltip
// create a tooltip
  var Tooltip = svg
    .append("text")
    .attr("x", 10)
    .attr("y", 0)
    .style("opacity", 1)
    .style("font-size", 17)

  // Three function that change the tooltip when user hover / move / leave a cell
  var mouseover = function(d) {
    Tooltip.style("opacity", 1)
    d3.selectAll(".myArea").style("opacity", .2)
      .transition()
      .duration(200)
    d3.select(this)
      .transition()
      .duration(200)
      .style("stroke-width", "3")
      .style("opacity", 1)
  }
  var mousemove = function(d,i) {
    grp = res[i]
    Tooltip.text(grp)
  }
  var mouseleave = function(d) {
    Tooltip.style("opacity", 0)
    d3.selectAll(".myArea").style("opacity", 1).style("stroke-width", "1.5")
      .transition()
      .duration(200)
   }

 

  // Draw the line
  svg.selectAll(".line")
      .data(sumstat)
      .enter()
      .append("path")
        .attr("class","myArea")
        .attr("fill", "none")
        .attr("stroke", function(d){ return color(d.key) })
        .attr("stroke-width", 1.5)
        .on("mouseover", mouseover)
        .on("mousemove", mousemove)
        .on("mouseleave", mouseleave)
        .attr("d", function(d){
          return d3.line()
            .x(function(d) { return x(d.year); })
            .y(function(d) { return y(0); })
            (d.values)
        })
        .transition()
        .duration(1200)
        .attr("d", function(d){
          return d3.line()
            .x(function(d) { return x(d.year); })
            .y(function(d) { return y(d.n); })
            (d.values)
        })

})

</script>

<script>
// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 30, left: 60},
    width = 760 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svgP = d3.select("#my_datapoints")
    .append("svg")
    // Responsive SVG needs these 2 attributes and no width and height attr.
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 760 400")
     .classed("svg-content-responsive", true)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


//Read the data
d3.csv("https://raw.githubusercontent.com/holtzy/D3-graph-gallery/master/DATA/iris.csv", function(data) {

  // Add X axis
  var x = d3.scaleLinear()
    .domain([4, 8])
    .range([ 0, width ]);
  svgP.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  // Add Y axis
  var y = d3.scaleLinear()
    .domain([0, 9])
    .range([ height, 0]);
  svgP.append("g")
    .call(d3.axisLeft(y));

  // Color scale: give me a specie name, I return a color
  var color = d3.scaleOrdinal()
    .domain(["setosa", "versicolor", "virginica" ])
    .range([ "#ed217b", "#f479af", "#fbd2e4"])

   // Add a tooltip div. Here I define the general feature of the tooltip: stuff that do not depend on the data point.
  // Its opacity is set to 0: we don't see it by default.
  var tooltip = d3.select("#my_datapoints")
    .append("div")
    .style("opacity", 0)
    .attr("class", "tooltip")
    .attr("position", "absolute") 
    .style("background-color", "white")
    .style("border", "solid")
    .style("border-width", "1px")
    .style("border-radius", "5px")
    .style("padding", "10px")


  // Highlight the specie that is hovered
  var highlight = function(d){

    tooltip
      .style("opacity", 1)
  
    selected_specie = d.Species

    d3.selectAll(".dot")
      .transition()
      .duration(200)
      .style("fill", "lightgrey")
      .attr("r", 3)

    d3.selectAll("." + selected_specie)
      .transition()
      .duration(200)
      .style("fill", color(selected_specie))
      .attr("r", 7)
  }

 var mousemove = function(d) {
    tooltip
      .html("Group: " + d.Species + "<br>The exact value of<br>this point is: " + d.Petal_Length)
      .style("left", (d3.mouse(this)[0]+90) + "px") // It is important to put the +90: other wise the tooltip is exactly where the point is an it creates a weird effect
      .style("top", (d3.mouse(this)[1]) + "px")
  }
  
  // Highlight the specie that is hovered
  var doNotHighlight = function(){
    d3.selectAll(".dot")
      .transition()
      .duration(200)
      .style("fill", "lightgrey")
      .attr("r", 5 )
  
    tooltip
      .transition()
      .duration(200)
      .style("opacity", 0)
  }

  // Add dots
  svgP.append('g')
    .selectAll("dot")
    .data(data)
    .enter()
    .append("circle")
      .attr("class", function (d) { return "dot " + d.Species } )
      .attr("cx", function (d) { return x(d.Sepal_Length); } )
      .attr("cy", function (d) { return y(0); } )
      .attr("r", 5)
      .style("fill", function (d) { return color(d.Species) } )
    .on("mouseover", highlight)
    .on("mousemove", mousemove)
    .on("mouseleave", doNotHighlight )
    .transition()
    .duration(1200)
      .attr("cy", function (d) { return y(d.Petal_Length); } )

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
  d3.csv("https://raw.githubusercontent.com/EECi/home/main/data/eeci_barplot_pathways.csv", function(data) {

    // X axis
    x.domain(data.map(function(d) { return d.Type; }))
    xAxis.transition().duration(1000).call(d3.axisBottom(x))

    // Add Y axis
    y.domain([0, d3.max(data, function(d) { return +d[selectedVar] }) ]);
    yAxis.transition().duration(1000).call(d3.axisLeft(y));

    // Color scale: give me a specie name, I return a color
    var color_u = d3.scaleOrdinal()
    .domain(["Notified-Slum", "Non-notified Slum", "Blue Tent Settlement" ])
    .range([ "#ed217b", "#f479af", "#fbd2e4"])
  
    // variable u: map data to existing bars
    var u = svgGroups.selectAll("rect")
      .data(data)

    // update bars
    u
      .enter()
      .append("rect")
      .merge(u)
      .transition()
      .duration(500)
        .attr("x", function(d) { return x(d.Type); })
        .attr("y", function(d) { return y(d[selectedVar]); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return sizeHigh - y(d[selectedVar]); })
        .attr("fill", function (d) { return color_u(d[selectedVar]) })
  })

}

// Initialize plot
update('1')

</script>
