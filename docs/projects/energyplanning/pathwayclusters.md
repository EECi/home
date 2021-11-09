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

Modelling urban residential energy use and clean energy transitions requires understanding and characterising heterogeneity across households arising due to differences in socio-economic and cultural context. This research looks into the use of mixed data and clustering methods to identify distinct typologies or pathways for transition to clean cooking fuel use by low-income households in urban India.

<div id="stickyarticle">
<h1 class="category">Clustering with mixed methods</h1>
<!--<h2 class="title">Using qualitative and quantitative data</h2>-->
<div id="wrapper">
  <div id="sticky">
    <img id="sticky"
         src="/home/Images/eplan/LPG_Distributor.jpg"
         alt="LPG Distributor in Bangalore"
         caption="Photo credit: A Neto-Bradley">
  </div>
  <body>Understanding factors that influence energy use in urban areas involves characterising complex socio-economic and cultural factors and effects. Not all of these are easily captured or analysed using quantitative methods. Qualitative methods commonly used in the social sciences including the analysis of qualitative in-depth interviews can reveal nuances and important decision making context that cannot be identified through quantitative methods. However these qualitative methods can be difficult to scale up in the same way as quantitative analysis.<br>
  <br>
  We sought to combine both quantitative and qualitative data in our approach to leverage the benefits of analysis of each individually. By conducting two stage of analysis a first stage quantitative and qualitative anaylsis could be combined through the frame of reference of interviewed households, matching them to the best matching quantitative cluster.</body>
</div>
  <h2 class="title">Quantitative Clustering</h2>
<!--<div id="wrapper">-->
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!--<div id="my_dataviz"></div> -->
  <body>By clustering quantitative energy related metrics such as fuel use, hours spent cooking, uptake of fuel subsidies, and hours of electricity availability, clusters of households with distinct energy use patterns can be identified. In our case study of Bangalore, using a mixture of 12 of these energy variables and agglomerative hierarchical clustering highlighted 5 different types of household. Click on the points in the plot below to see how each of the clusters map out. </body>
<!--</div>-->
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <div id="my_datapoints"></div>
  <body>While each of these clusters are defined based on energy variables, they also have significant differences in their socio-economic characteristics. If we take the example of the type of slum these households live shown in the bar chart below we can see that closely bunched clusters have a similar make-up of slum types. Notified slums are slums with some form of legal recognition of tenure rights, while non-notified may be relatively well established but lack official recognition. Blue tent settlements are the least formal and often have poorest access to utilities. </body>
</div>
<div id="wrapper">
<!-- Create a div where the graph will take place -->
<div id="my_dataviz_2"></div>
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!-- Add 2 buttons -->
  <center>
<button class="btn {{ f.btn_class }}" onclick="update('1')">Cluster 1</button>
<button class="btn {{ f.btn_class }}" onclick="update('2')">Cluster 2</button>
<button class="btn {{ f.btn_class }}" onclick="update('3')">Cluster 3</button>
<button class="btn {{ f.btn_class }}" onclick="update('4')">Cluster 4</button>
<button class="btn {{ f.btn_class }}" onclick="update('5')">Cluster 5</button>
  </center>
  <p></p>
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
var margin = {top: 20, right: 50, bottom:30, left: 20},
    width = 600 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svgP = d3.select("#my_datapoints")
    .append("svg")
    // Responsive SVG needs these 2 attributes and no width and height attr.
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 600 300")
      .classed("svg-content-responsive", true)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


//Read the data
d3.csv("https://raw.githubusercontent.com/EECi/home/main/data/eeci_pathway_PCA.csv", function(data) {

  // Add X axis
  var x = d3.scaleLinear()
    .domain([-5, 5])
    .range([ 0, width ]);
  svgP.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  // Add Y axis
  var y = d3.scaleLinear()
    .domain([-5, 5])
    .range([ height, 0]);
  svgP.append("g")
    .call(d3.axisLeft(y));

  // Color scale: give me a specie name, I return a color
  var color_c = d3.scaleOrdinal()
    .domain(["Cluster_1", "Cluster_2", "Cluster_3", "Cluster_4", "Cluster_5"])
    .range(["#1a5e49", "#207259", "#258668", "#2b9a78","#31ae88"])

  // Add a tooltip div. Here I define the general feature of the tooltip: stuff that do not depend on the data point.
  // Its opacity is set to 0: we don't see it by default.
  var Tooltip = d3.select("#my_datapoints")
    .append("div")
    .style("position", "absolute")
    .style("opacity", 0)
    .attr("class", "tooltip")
    .style("border", "solid")
    .style("border-width", "0px")
    .style("border-radius", "0px")
    .style("padding", "10px")


  // Highlight the specie that is hovered
  var highlight = function(d){

    clust = d.Cluster

    d3.selectAll(".dot")
      .transition()
      .duration(200)
      .style("fill", "lightgrey")
      .attr("r", 2)

    d3.selectAll("."+clust)
      .transition()
      .duration(200)
      .style("fill", color_c(clust))
      .attr("r", 5)

    Tooltip
      .style("opacity", 1)
      .style("background-color", color_c(clust))
  }

 var onmove = function(d) {
    Tooltip.html(d.Cluster)
      .style("left", (d3.mouse(this)[0]+10) + "px")
      .style("top", (d3.mouse(this)[1]) + "px")
  }
  
  // Highlight the specie that is hovered
  var lowlight = function(){

    d3.selectAll(".dot")
      .transition()
      .duration(200)
      .style("fill", "lightgrey")
      .attr("r", 4 )

    Tooltip
      .transition()
      .duration(200)
      .style("opacity", 0)
  }

  
  // Add dots
  svgP.append("g")
    .selectAll("dot")
    .data(data)
    .enter()
    .append("circle")
      .attr("class", function (d) { return "dot " + d.Cluster } )
      .attr("cx", function (d) { return x(d.PrincipleComp2); } )
      .attr("cy", function (d) { return y(d.PrincipleComp1); } )
      .attr("r", 4)
      .style("fill", function (d) { return color_c(d.Cluster) } )
    .on("mouseover", highlight)
    .on("mouseleave", lowlight)
    .on("mousemove", onmove)
    //.transition()
    //.duration(1200)
    //  .attr("cy", function (d) { return y(d["Principle.Component.1"]); } )

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
