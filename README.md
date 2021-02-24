# Energy Efficient Cities initiative

![EECi Group Logo](/Images/Group Logo.png)

**Who We Are**

The Energy Efficient Cities initiative [EECi] is a cross-disciplinary research project at the University of Cambridge. The EECi aims to strengthen the UK's capacity to address energy demand reduction and environmental impact in cities, by research in building and transport technologies, district power systems, and urban planning. The three research themes we addressed during our original funding period were: City Planning and Design; Built Environment and Energy Systems; and Transport and Environment. This website covers ongoing work within the Built Environment and Energy Systems theme.

**Example Graph: **
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
