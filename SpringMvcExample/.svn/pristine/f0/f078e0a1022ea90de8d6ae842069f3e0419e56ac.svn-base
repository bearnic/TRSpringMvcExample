<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>svgExample</title>
<script src="http://d3js.org/d3.v3.min.js"></script>
</head>
<body>
<h2>This is my SVG test</h2>

<svg width="100%" height="50%" xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" />
      <stop offset="100%" style="stop-color:rgb(255,0,255);stop-opacity:1" />
    </linearGradient>
  </defs>
   Sorry, your browser does not support inline SVG.
   <circle id="circletest" style="circletest" cx="50" cy="50" r="40" stroke="green" stroke-width="7" fill="rgba(0,0,0,0)" />
   <ellipse transform="translate(100 30) rotate(-30)" 
        rx="25" ry="10"
        fill="url(#grad1)" stroke="blue" stroke-width="2" onclick="changeColor()" onmouseover="changeColor2()"/>
</svg>
<br/>
<svg width="100%" height="50%">
<!--The g is responsible for applying a style to all of the elements inside svg -->
<!--transform translate moves the shape and rotate rotates it -->


<g transform="translate(0 100) rotate(-30)">
   <rect x="50" y="50" width="10" height="30"
        fill="yellow" stroke="blue" stroke-width="2"/>
        
        
    <rect x="60" y="50" width="100" height="30"
        fill="orange" stroke="blue" stroke-width="2">
        
        <animateTransform
            attributeName="transform"
            begin="0s"
            dur="20s"
            type="rotate"
            from="0 60 60"
            to="360 60 60"
            repeatCount="indefinite" 
        />
	</rect>
        
   Sorry, your browser does not support inline SVG.
</svg>

<svg id="visualisation" width="1000" height="500"></svg>

<script>
    function changeColor() {
        document.getElementById("circletest").setAttribute("fill", "blue");
    }
    
    function changeColor2() {
        document.getElementById("circletest").setAttribute("fill", "none");
    }
    
    //Below example is taken from the mbostock website
    var data = [1, 1, 2, 3, 5, 8, 13, 21];

    var width = 960,
        height = 500,
        outerRadius = height / 2 - 30,
        cornerRadius = 20;

    var pie = d3.layout.pie();

    var arc = d3.svg.arc()
        .outerRadius(outerRadius);

    var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    var straightPath = svg.append("g")
        .attr("class", "paths--straight")
      .selectAll("path")
        .data(data)
      .enter().append("path");

    var roundPath = svg.append("g")
        .attr("class", "paths--round")
      .selectAll("path")
        .data(data)
      .enter().append("path");

    var ease = d3.ease("cubic-in-out"),
        duration = 2500;

    d3.timer(function(elapsed) {
      var t = ease(1 - Math.abs((elapsed % duration) / duration - .5) * 2),
          arcs = pie.padAngle(t * .1)(data);

      arc.innerRadius(outerRadius / (3 - t));
      straightPath.data(arcs).attr("d", arc.cornerRadius(0));
      roundPath.data(arcs).attr("d", arc.cornerRadius(cornerRadius));
    });
    
  //Below example is taken to show how to display data using d3.js
  
  var lineData = [{
  x: 1,
  y: 5
}, {
  x: 20,
  y: 20
}, {
  x: 40,
  y: 10
}, {
  x: 60,
  y: 40
}, {
  x: 80,
  y: 5
}, {
  x: 100,
  y: 600
}];
  
  var vis = d3.select('#visualisation'),
  WIDTH = 1000,
  HEIGHT = 500,
  MARGINS = {
    top: 20,
    right: 20,
    bottom: 20,
    left: 50
  },
  xRange = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([d3.min(lineData, function(d) {
    return d.x;
  }), d3.max(lineData, function(d) {
    return d.x;
  })]),
  yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([d3.min(lineData, function(d) {
    return d.y;
  }), d3.max(lineData, function(d) {
    return d.y;
  })]),
  xAxis = d3.svg.axis()
    .scale(xRange)
    .tickSize(5)
    .tickSubdivide(true),
  yAxis = d3.svg.axis()
    .scale(yRange)
    .tickSize(5)
    .orient('left')
    .tickSubdivide(true);

vis.append('svg:g')
.attr('class', 'x axis')
.attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
.call(xAxis);

vis.append('svg:g')
.attr('class', 'y axis')
.attr('transform', 'translate(' + (MARGINS.left) + ',0)')
.call(yAxis);  
   
var lineFunc = d3.svg.line()
.x(function(d) {
  return xRange(d.x);
})
.y(function(d) {
  return yRange(d.y);
})
.interpolate('linear');

vis.append('svg:path')
.attr('d', lineFunc(lineData))
.attr('stroke', 'blue')
.attr('stroke-width', 2)
.attr('fill', 'none');
  
</script>

</body>
</html>