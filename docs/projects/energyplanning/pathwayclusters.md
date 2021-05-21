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
<button onclick="update('var1')">Variable 1</button>
<button onclick="update('var2')">Variable 2</button>

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

// Dimension of the whole chart. Only one size since it has to be square
var marginWhole = {top: 10, right: 10, bottom: 10, left: 10},
    sizeWhole = 760 - marginWhole.left - marginWhole.right

// Create the svg area
var svg = d3.select("#my_dataviz")
  .append("svg")
     // Responsive SVG needs these 2 attributes and no width and height attr.
    .attr("preserveAspectRatio", "xMinYMin meet")
    .attr("viewBox", "0 0 760 760")
   // Class to make it responsive.
    .classed("svg-content-responsive", true)
    //.attr("width", sizeWhole  + marginWhole.left + marginWhole.right)
    //.attr("height", sizeWhole  + marginWhole.top + marginWhole.bottom)
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
        .domain([0, 0])
        .range([ 0, size-2*mar ]);
      svg.append("g")
        .attr("class", "myXaxis")   // Note that here we give a class to the X axis, to be able to call it later and modify it
    

   // Add Y Scale of each graph
      yextent = d3.extent(data, function(d) { return +d[var2] })
      var y = d3.scaleLinear()
        .domain([0,0])
        .range([ size-2*mar, 0 ]);
      svg.append("g")
        .attr("class", "myYaxis")   // Note that here we give a class to the X axis, to be able to call it later and modify it
    

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

  // new X axis
  x.domain(xextent).nice()
  tmp.select(".myXaxis")
    .transition()
    .duration(3000)
    .attr("opacity", "1")
    .call(d3.axisBottom(x));

      // new Y axis
  y.domain(yextent).nice()
  tmp.select(".myYaxis")
    .transition()
    .duration(3000)
    .attr("opacity", "1")
    .call(d3.axisBottom(y));

  tmp.selectAll("circle")
    .transition()
    .delay(function(d,i){return(i*3)})
    .duration(3000)
    .attr("cx", function (d){ return x(+d[var1]) })
    .attr("cy", function (d){ return y(+d[var2]) })
    
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

<script>

// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 70, left: 60},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svgGroups = d3.select("#my_dataviz_2")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");

// Initialize the X axis
var x = d3.scaleBand()
  .range([ 0, width ])
  .padding(0.2);
var xAxis = svgGroups.append("g")
  .attr("transform", "translate(0," + height + ")")

// Initialize the Y axis
var y = d3.scaleLinear()
  .range([ height, 0]);
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
        .attr("height", function(d) { return height - y(d[selectedVar]); })
        .attr("fill", "#69b3a2")
  })

}

// Initialize plot
update('var1')

</script>
