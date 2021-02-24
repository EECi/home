# Energy Efficient Cities initiative

![EECi Group Logo](/Images/Group Logo.png)

**Who We Are**

The Energy Efficient Cities initiative [EECi] is a cross-disciplinary research project at the University of Cambridge. The EECi aims to strengthen the UK's capacity to address energy demand reduction and environmental impact in cities, by research in building and transport technologies, district power systems, and urban planning. The three research themes we addressed during our original funding period were: City Planning and Design; Built Environment and Energy Systems; and Transport and Environment. This website covers ongoing work within the Built Environment and Energy Systems theme.




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

<div id='d3div'></div>

<script src="//d3js.org/d3.v3.min.js"></script>
<script>
var width = $("#d3div").width(),
    height = 500;
var color = d3.scale.category20();
var force = d3.layout.force()
    .charge(-120)
    .linkDistance(30)
    .size([width, height]);
var svg = d3.select("#d3div").append("svg")
    .attr("width", width)
    .attr("height", height);
d3.json("/data/miserables.json", function(error, graph) {
  if (error) throw error;
  force
      .nodes(graph.nodes)
      .links(graph.links)
      .start();
  var link = svg.selectAll(".link")
      .data(graph.links)
    .enter().append("line")
      .attr("class", "link")
      .style("stroke-width", function(d) { return Math.sqrt(d.value); });
  var node = svg.selectAll(".node")
      .data(graph.nodes)
    .enter().append("circle")
      .attr("class", "node")
      .attr("r", 5)
      .style("fill", function(d) { return color(d.group); })
      .call(force.drag);
  node.append("title")
      .text(function(d) { return d.name; });
  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });
    node.attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; });
  });
});
</script>
