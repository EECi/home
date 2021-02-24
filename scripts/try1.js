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
