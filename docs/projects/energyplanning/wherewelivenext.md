---
layout: single
title: Where We Live Next - Understanding Space and Place through Food
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
  overlay_image: /Images/eplan/fishy_business.jpeg
toc_sticky: true
---


<html>
<head>
<!-- Load d3.js -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@0.7.7/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@0.7.7/dist/leaflet.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--script src="https://raw.githubusercontent.com/EECi/home/c75f83f4fa4b9951d1712ca5c000d2ee972a9de2/data/geodata.js" ></script>-->

<style>
  .info {
    padding: 6px 8px;
    font: 14px/16px Arial, Helvetica, sans-serif;
    background: white;
    background: rgba(255,255,255,0.8);
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    border-radius: 5px;
}
.info h4 {
    margin: 0 0 5px;
    color: #777;
}
.legend {
    line-height: 18px;
    color: #555;
}
.legend i {
    width: 18px;
    height: 18px;
    float: left;
    margin-right: 8px;
    opacity: 0.7;
}
</style>	
	
<style>
div.container2 {
    width: 800px;
    height: 600px;
    position: relative;
}

div.slimage {
    height: 100%;
    background-repeat: no-repeat;
    background-position: top left;
    background-size: cover;
    position: absolute;
    top: 0px;
    left: 0px;
}

div.before {
    width: 50%;
    background-image: url("https://raw.githubusercontent.com/EECi/home/a2b94e63230fcd8bc3ec9d4d8a3d047a88b32418/Images/eplan/Doge_GenF_Web.png");
    z-index: 2;
}

div.after {
    width: 100%;
    background-image: url("https://raw.githubusercontent.com/EECi/home/cf2c17a05296a305ab41068b3dbbfdcfa761a010/Images/eplan/Doge_GenM_Web.png");
    z-index: 1;
}

input.slider {
    width: 100%;
    height: 100%;
    outline: none;
    background-color: transparent;
    position: absolute;
    margin: 0px;
    z-index: 3;
    cursor: pointer;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    transition: 0.25s all ease-in-out;
    -moz-transition: 0.25s all ease-in-out;
    -webkit-transition: 0.25s all ease-in-out;
    z-index: 4;
}

input.slider::-moz-range-thumb {
    width: 6px;
    height: 610px;
    background-color: #ed207b;
    cursor: pointer;
}

input.slider::-webkit-slider-thumb {
    width: 6px;
    height: 600px;
    background-color: #ed207b;
    cursor: pointer;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
}

div.slider-button {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    -moz-broder-radius: 50%;
    -webkit-border-radius: 50%;
    background-color: white;
    position: absolute;
    top: calc(50% - 18px);
    left: calc(50% - 18px);
    cursor: pointer;
    z-index: 3;
}

div.slider-button:before {
    color: #ed207b;
    position: absolute;
    top: 3px;
    left: 0px;
    content: "\2B9C";
}

div.slider-button:after {
    color: #ed207b;
    position: absolute;
    top: 3px;
    right: 0px;
    content: "\2B9E";
}

@media (max-width: 767px) {
    div.container2 {
        width: 100%;
        height: 250px;
    }
</style>  
  
<script>
$(document).ready(function() {

    $("input.slider").on("input change", function(event) {
        var pos = event.target.value;

        $("div.before").css({width: pos + "%"});
        $("div.slider-button").css({left: "calc(" + pos + "% - 18px)"});
    });

});
</script>
</head>
<body>

<h1 class="category">Context</h1>

Using the lens of places and practices of food this project will explore a mixed methods approach for scaling lived experience across city-scale data and models and to expose intangible features of community spaces. By layering analysis of places and practices of food onto spatial and model data on deprivation and fuel poverty this research contextualises invisible relationships and dynamics of a community through visible patterns of urban fabric. 
<p>
Energy poverty and food poverty are closely intertwined, and households at risk of fuel poverty are likely to be at risk of food poverty too. Food poverty data is not publicly available at this local scale, but national statistics and energy modelling data do offer a fine scale local view of energy poverty. The map below shows ONS data on fuel poverty in Dogesthorpe, Peterborough. Levels of fuel poverty in Dogesthorpe are above the national average and higher than much of the surrounding areas. 
	
<div id="map" style="width: 720px; height: 600px"></div>
<script type="text/javascript">
  
        var map = L.map('map').setView([52.59,-0.22614], 13);
        mapLink = 
            '<a href="http://openstreetmap.org">OpenStreetMap</a>';

        var Stamen_Toner = L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner/{z}/{x}/{y}.{ext}', {
          attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
          subdomains: 'abcd',
          minZoom: 0,
          maxZoom: 20,
          ext: 'png'
        });
        
        Stamen_Toner.addTo(map);
        
	$.getJSON("https://raw.githubusercontent.com/EECi/home/88db23bd9e3c6698096683a3210de61edce34791/data/geodata_json.geojson" ,function(geodata){
        L.geoJson(geodata).addTo(map);
	
	function getColor(d) {
          return d > 35 ? "#4e3910"  :
          d > 30  ? "#845d29" :
          d > 25  ? "#d8c29d" :
          d > 20  ? "#4fb6ca" :
          d > 15   ? "#178f92" :
          d > 10   ? "#175f5d" :
          d > 5   ? "#1d1f54" :
                    "#1d1f54";
                    }

        function style(feature) {
          return {
            fillColor: getColor(feature.properties.fuelpovprop),
            weight: 2,
            opacity: 1,
            color: 'white',
            dashArray: '3',
            fillOpacity: 0.4
          };
        }
        
        L.geoJson(geodata, {style: style}).addTo(map);

        
        // control that shows state info on hover
        var info = L.control();
        
        info.onAdd = function (map) {
          this._div = L.DomUtil.create('div', 'info');
          this.update();
          return this._div;
        };

        info.update = function (props) {
          this._div.innerHTML = '<h4>Fuel Poverty</h4>' +  (props ?
            '<b>' + props.lsoa01nm + '</b><br />' + props.fuelpovprop + ' % ' : 'Hover over an area');
        };

        info.addTo(map);


        function highlightFeature(e) {
          var layer = e.target;

          layer.setStyle({
            weight: 5,
            color: '#666',
            dashArray: '',
            fillOpacity: 0.5
          });

          if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
            layer.bringToFront();
          }

          info.update(layer.feature.properties);
        }

        var geojson;

        function resetHighlight(e) {
          geojson.resetStyle(e.target);
          info.update();
        }

        function zoomToFeature(e) {
          map.fitBounds(e.target.getBounds());
        }

        function onEachFeature(feature, layer) {
          layer.on({
            mouseover: highlightFeature,
            mouseout: resetHighlight,
            click: zoomToFeature
          });
        }

        /* global statesData */
        geojson = L.geoJson(geodata, {
          style: style,
          onEachFeature: onEachFeature
        }).addTo(map);

        map.attributionControl.addAttribution('Fuel Poverty Data &copy; ONS');



        var legend = L.control({position: 'bottomright'});
        
        legend.onAdd = function (map) {
          var div = L.DomUtil.create('div', 'info legend'),
          grades = [0, 5, 10, 15, 20, 25, 30, 35],
          labels = [];
          // loop through our density intervals and generate a label with a colored square for each interval
          for (var i = 0; i < grades.length; i++) {
            div.innerHTML +=
            '<i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '<br>' : '+');
          }
          return div;
        };
        
        legend.addTo(map);
	});

        

        var svg = d3.select(map.getPanes().overlayPane).append("svg")
        var g = svg.append("g").attr("class", "leaflet-zoom-hide");
  
</script>

<h1 class="category"> A Case Study of Dogesthorpe </h1>
<div id="stickyarticle">
<h2 class="category">Places of Food</h2>
Information about places of food is publicly available through platforms such as Google Maps, and includes a rich source of community created data in the form of reviews. There are three predominant types of food places listed on Google Maps, these are food shops which sell ingredients or food products to be prepared at home, cafes and restaurants which may serve food to be consumed on premises (although during Covid-19 pandemic these may have offered takeaway and delivery), and finally fast food takeaway places which offer convenient food to be delivered or taken home to eat. These takeaway and fast food places are what would typically characterise a food swamp often selling nutritionally poor food. We have also noted a local allotment in the area. The map below shows the spatial distribution of different types of places of food listed on Google Maps in Dogesthorpe. <p>
<img src="https://raw.githubusercontent.com/EECi/home/3240ec68c8f5db92068a7f68705446119310b89a/Images/eplan/Dogesthorpe_Overview.png">

		<h2 class="category">The daily pulse of places of food</h2>	
The data provides insight into the temporality of these places of food. Simply considering the listed opening hours for the different food establishments reveals a spatio-temporal pattern that characterises the neighbourhood as a place and community. Between 4 and 7pm there is a distinct transition with these food shops and cafes on the periphery closing and takeaway and fast-food type restaurants opening inside the neighbourhood such that by 8pm the majority of food places open in Dogesthorpe are takeaway restaurants. The food landscape of the neighbourhood differs during working hours and evenings, becoming what may be described as a “food swamp” at night.
<p>
<img src="https://raw.githubusercontent.com/EECi/home/b3c66f0759b50a847fce76472b92c684051e6043/Images/eplan/Dogesthorpe_Time.png">
	
	
	<h2 class="category">Where do locals go?</h2>	
The map below shows the the proportion of reviews left according to the reviewers provenance. We can see a distinct and complementary spatial pattern between places of food more often reviewed by neighbourhood locals versus those places reviewed by 'outsider'. <p>
	This is also interesting in terms of what types of places of food are reviewed by locals versus non-locals. Takeaways and fast-food places, convenience stores and local supermarkets located predominantly in the inner part of the neighbourhood away from the main roads are popular with locals. More specialised food shops as well as restaurants and convenience stores close to the main road and ring road are more popular with those who are not local.
<p>
<img src="https://raw.githubusercontent.com/EECi/home/b3c66f0759b50a847fce76472b92c684051e6043/Images/eplan/Dogesthorpe_Reviewer_Provenance.png">
	
	
<h2 class="category">Gendered Experiences of Place</h2>	
	From the inferred gender of reviewers of food places on Google Maps the gendered differences in experience of the local area can also be explored in a non-intrusive way. Note in the map below that reviews for the pub and chinese takeaway in the middle of the neighbourhood have a greater proportion of female reviewers, while fast food takeaways and the pub’ on the main road are predominantly reviewed by male reviewers. Some places appear gender neutral in reviewer gender and these include some of teh convenience stores in the inner neighbourhood.
<p>
<img src="https://raw.githubusercontent.com/EECi/home/b3c66f0759b50a847fce76472b92c684051e6043/Images/eplan/Dogesthorpe_Reviewer_Gender.png">
	
While gender balance in reviewers reveals more male and female clientele, the ratings given by male and female reviewers offer additional insight into how these places are experienced by different genders. Move the slider below to see where female reviewers can have markedly different experiences of places when compared to male reviewers. <p>
<div class="container2">
	<div class="slimage before"></div>
	<div class="slimage after"></div>

	<input type="range" class="slider" min="1" max="100" value="50" />
	<div class="slider-button"></div>
</div>
  <h2 class="title">Qualitative Analysis of Reviews</h2>
	<body>TBC</body>
</div>


</body>
</html>
