---
layout: single
title: Where We Live Next: Understanding Space and Place through Food
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
  overlay_image: /Images/eplan/LPG_Distributor.jpg
toc_sticky: true
---

<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>



# Context

Using the lens of places and practices of food this project will explore a mixed methods approach for scaling lived experience across city-scale data and models and to expose intangible features of community spaces. By layering analysis of places and practices of food onto spatial and model data on deprivation and fuel poverty this research contextualises invisible relationships and dynamics of a community through visible patterns of urban fabric. 


## A Case Study of Dogesthorpe

<div id="stickyarticle">
<h1 class="category">Socio-Economic Overview</h1>
<!--<h2 class="title">Using qualitative and quantitative data</h2>-->
<div id="wrapper">
  <div id="sticky">
    <img id="sticky"
         src="/home/Images/eplan/Fuel_Stacking_wide.jpg"
         alt="LPG Distributor in Bangalore"
         caption="Photo credit: A Neto-Bradley">
  </div>
  <body>TBC<br>
  <br>
 TBC</body>
</div>
  <h2 class="title">Places of Food</h2>
<!--<div id="wrapper">-->
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <!--<div id="my_dataviz"></div> -->
  <body>TBC </body>
<!--</div>-->
<div id="wrapper">
  <!-- Initialize a select button -->
  <!-- <select id="selectButton"></select> -->
  <div id="my_datapoints"></div>
  <body>TBC </body>
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
 <body>TBC</body>
  </div>
  
   <h2 class="title">In-Depth Analysis of Reviews</h2>
  <body>TBC
</div>


# Team
TBC

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
  var margin = {top: 20, right: 100, bottom:30, left: 100},
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
      x = d3.event.x
      y = d3.event.y

      Tooltip.html(d.Cluster)
        //.style("left", (d3.mouse(this)[0]+90) + "px")
        //.style("top", (d3.mouse(this)[1]) + "px")
        .style('top', y-10 + 'px') // edited
        .style('left', x+'px') // edited
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
        .attr("cy", function (d) { return y(0); } )
        .attr("r", 4)
        .style("fill", function (d) { return color_c(d.Cluster) } )
      .on("mouseover", highlight)
      .on("mouseleave", lowlight)
      .on("mousemove", onmove)
      .transition()
      .duration(1200)
        .attr("cy", function (d) { return y(d.PrincipleComp1); } )
  
  })
  
  </script>





<script>

// set the dimensions and margins of the graph
  var marginWhole2 = {top: 30, right: 100, bottom: 20, left: 100},
    sizeWide = 600 - marginWhole2.left - marginWhole2.right
    sizeHigh = 300 - marginWhole2.top - marginWhole2.bottom;

// append the svg object to the body of the page
var svgGroups = d3.select("#my_dataviz_2")
    .append("svg")
    // Responsive SVG needs these 2 attributes and no width and height attr.
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 600 300")
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
