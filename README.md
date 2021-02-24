# Energy Efficient Cities initiative

![EECi Group Logo](/Images/Group Logo.png)

**Who We Are**

The Energy Efficient Cities initiative [EECi] is a cross-disciplinary research project at the University of Cambridge. The EECi aims to strengthen the UK's capacity to address energy demand reduction and environmental impact in cities, by research in building and transport technologies, district power systems, and urban planning. The three research themes we addressed during our original funding period were: City Planning and Design; Built Environment and Energy Systems; and Transport and Environment. This website covers ongoing work within the Built Environment and Energy Systems theme.


<!--<p>This is <a href="https://www.d3-graph-gallery.com">a link to the d3 graph gallery</a></p> -->
<script src="https://d3js.org/d3.v6.min.js"></script>

<script>
let dataset = [3,12,13,7,5,9,19,7];
let svgHeight= 400, svgWidth = 500, barSpacing = 5;
let totalBarWidth = (svgWidth/dataset.length);
let barWidth = totalBarWidth-barSpacing
let svg = d3.select('svg')
            .attr('width', svgWidth)
            .attr('height', svgHeight);
let xScale = d3.scaleLinear()
               .domain([0, d3.max(dataset)])
               .range([0, svgWidth])
let xAxis = d3.axisBottom().scale(xScale);

let yScale = d3.scaleLinear()
               .domain([0, d3.max(dataset)])
               .range([svgHeight-30, 0])
let yAxis = d3.axisLeft().scale(yScale);

svg.append('g')
   .attr('transform','translate(50, 10)')
   .call(yAxis);

let xAxisTranslate = svgHeight - 20;

svg.append('g')
   .attr('transform',`translate(50,${xAxisTranslate})`)
   .call(xAxis);
</script>
