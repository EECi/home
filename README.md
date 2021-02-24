# Energy Efficient Cities initiative

![EECi Group Logo](/Images/Group Logo.png)

**Who We Are**

The Energy Efficient Cities initiative [EECi] is a cross-disciplinary research project at the University of Cambridge. The EECi aims to strengthen the UK's capacity to address energy demand reduction and environmental impact in cities, by research in building and transport technologies, district power systems, and urban planning. The three research themes we addressed during our original funding period were: City Planning and Design; Built Environment and Energy Systems; and Transport and Environment. This website covers ongoing work within the Built Environment and Energy Systems theme.


<!--<p>This is <a href="https://www.d3-graph-gallery.com">a link to the d3 graph gallery</a></p> -->
<script src="https://d3js.org/d3.v6.min.js"></script>

<div id='d3div'></div>

<style>

.node {
  stroke: #fff;
  stroke-width: 1.5px;
}

.link {
  stroke: #999;
  stroke-opacity: .6;
}

</style>


<script>

var width = 500,
    height = 500;

var color = d3.scale.category20();

var force = d3.layout.force()
    .charge(-120)
    .linkDistance(30)
    .size([width, height]);

var svg = d3.select("#d3div").append("svg")
    .attr("width", width)
    .attr("height", height);


</script>
