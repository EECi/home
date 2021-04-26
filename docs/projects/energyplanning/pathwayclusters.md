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
  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
  <h2 class="title">Identifying transition pathways</h2>
<div id="wrapper">
  <div id="stickyflex">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <div id="my_dataviz"></div>
  </div>
  <body>Understanding factors that influence energy use in urban areas and how to best chracterise and model this is key to delivering clean and sustainable energy for the cities of today and tomorrow.</body>
</div>
</div>

# Team


# Publications and Outputs


<!-- Graphic -->
<script>
  
// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 30, left: 50},
    width = 700 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#my_dataalt")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");

// get the data
d3.csv("https://raw.githubusercontent.com/EECi/home/main/data/d3_pathway_exp.csv", function(data) {

  // List of groups (here I have one group per column)
  var allGroup = d3.map(data, function(d){return(d.Cluster)}).keys()

  // add the options to the button
  d3.select("#selectButton")
    .selectAll('myOptions')
    .data(allGroup)
    .enter()
    .append('option')
    .text(function (d) { return d; }) // text showed in the menu
    .attr("value", function (d) { return d; }) // corresponding value returned by the button


    // add the x Axis
  var x = d3.scaleLinear()
    .domain([0, 600])
    .range([0, width]);
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // add the y Axis
  var y = d3.scaleLinear()
            .range([height, 0])
            .domain([0, 0.1]);
  svg.append("g")
      .call(d3.axisLeft(y));

  // Compute kernel density estimation for the first group called Setosa
  var kde = kernelDensityEstimator(kernelEpanechnikov(3), x.ticks(140))
  var density =  kde( data
    .filter(function(d){ return d.Cluster == "1"})
    .map(function(d){  return +d.Biomass; })
  )
  
  // Plot the area
  var curve = svg
    .append('g')
    .append("path")
      .attr("class", "mypath")
      .datum(density)
      .attr("fill", "#69b3a2")
      .attr("opacity", ".8")
      .attr("stroke", "#000")
      .attr("stroke-width", 1)
      .attr("stroke-linejoin", "round")
      .attr("d",  d3.line()
        .curve(d3.curveBasis)
          .x(function(d) { return x(d[0]); })
          .y(function(d) { return y(d[1]); })
      );
      
   // A function that update the chart when slider is moved?
  function updateChart(selectedGroup) {
   // recompute density estimation
    kde = kernelDensityEstimator(kernelEpanechnikov(3), x.ticks(40))
    var density =  kde( data
      .filter(function(d){ return d.Cluster == selectedGroup})
      .map(function(d){  return +d.Biomass; })
    )

   // update the chart
    curve
      .datum(density)
      .transition()
      .duration(1000)
      .attr("d",  d3.line()
        .curve(d3.curveBasis)
          .x(function(d) { return x(d[0]); })
          .y(function(d) { return y(d[1]); })
      );
  }

  // Listen to the slider?
  d3.select("#selectButton").on("change", function(d){
    selectedGroup = this.value
    updateChart(selectedGroup)
  })

});


// Function to compute density
function kernelDensityEstimator(kernel, X) {
  return function(V) {
    return X.map(function(x) {
      return [x, d3.mean(V, function(v) { return kernel(x - v); })];
    });
  };
}
function kernelEpanechnikov(k) {
  return function(v) {
    return Math.abs(v /= k) <= 1 ? 0.75 * (1 - v * v) / k : 0;
  };
}

</script>


<script>

// Dimension of the whole chart. Only one size since it has to be square
var marginWhole = {top: 10, right: 10, bottom: 10, left: 10},
    sizeWhole = 640 - marginWhole.left - marginWhole.right

// Create the svg area
var svg = d3.select("#my_dataviz")
  .append("svg")
    .attr("width", sizeWhole  + marginWhole.left + marginWhole.right)
    .attr("height", sizeWhole  + marginWhole.top + marginWhole.bottom)
  .append("g")
    .attr("transform", "translate(" + marginWhole.left + "," + marginWhole.top + ")");


d3.csv("https://raw.githubusercontent.com/EECi/home/main/data/d3_pathway_exp2.csv", function(data) {

  // What are the numeric variables in this dataset? How many do I have
  var allVar = ["Migration","Cooking_Appliances", "Electricity_Availability", "Biomass"]
  var numVar = allVar.length

  // Now I can compute the size of a single chart
  mar = 20
  size = sizeWhole / numVar


  // ----------------- //
  // Scales
  // ----------------- //

  // Create a scale: gives the position of each pair each variable
  var position = d3.scalePoint()
    .domain(allVar)
    .range([0, sizeWhole-size])

  // Color scale: give me a specie name, I return a color
  var color = d3.scaleOrdinal()
    .domain(["Cluster_1", "Cluster_2", "Cluster_3", "Cluster_4", "Cluster_5" ])
    .range([ "#5F89A1", "#E8E3A5", "#D484C5","#41BFB7","#C98D5D"])


  // ------------------------------- //
  // Add charts
  // ------------------------------- //
  for (i in allVar){
    for (j in allVar){

   // Get current variable name
      var var1 = allVar[i]
      var var2 = allVar[j]

   // If var1 == var2 i'm on the diagonal, I skip that
      if (var1 === var2) { continue; }

   // Add X Scale of each graph
      xextent = d3.extent(data, function(d) { return +d[var1] })
      var x = d3.scaleLinear()
        .domain(xextent).nice()
        .range([ 0, size-2*mar ]);

   // Add Y Scale of each graph
      yextent = d3.extent(data, function(d) { return +d[var2] })
      var y = d3.scaleLinear()
        .domain(yextent).nice()
        .range([ size-2*mar, 0 ]);

   // Add a 'g' at the right position
      var tmp = svg
        .append('g')
        .attr("transform", "translate(" + (position(var1)+mar) + "," + (position(var2)+mar) + ")");

   // Add X and Y axis in tmp
      tmp.append("g")
        .attr("transform", "translate(" + 0 + "," + (size-mar*2) + ")")
        .call(d3.axisBottom(x).ticks(3));
      tmp.append("g")
        .call(d3.axisLeft(y).ticks(3));

   // Add circle
      tmp
        .selectAll("myCircles")
        .data(data)
        .enter()
        .append("circle")
          .attr("cx", function(d){ return x(+d[var1]) })
          .attr("cy", function(d){ return y(+d[var2]) })
          .attr("r", 3)
          .attr("fill", function(d){ return color(d.Cluster)})
    }
  }


  // ------------------------------- //
  // Add variable names = diagonal
  // ------------------------------- //
  for (i in allVar){
    for (j in allVar){
      // If var1 == var2 i'm on the diagonal, otherwisee I skip
      if (i != j) { continue; }
      // Add text
      var var1 = allVar[i]
      var var2 = allVar[j]
      svg
        .append('g')
        .attr("transform", "translate(" + position(var1) + "," + position(var2) + ")")
        .append('text')
          .attr("x", size/2)
          .attr("y", size/2)
          .text(var1)
          .attr("text-anchor", "middle")

    }
  }


})

</script>
