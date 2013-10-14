d3json();

function d3json ()
{
	
	
	
	var canvas = d3.select("body")
		.append("svg")
		.attr("width", 1000)
		.attr("height", 1000);


	$.getJSON( "mydata.json", function( data ) {
		for(var i = 0; i<data.bla.length; i++) {
			console.log(data.bla[i]);
		}
		
		canvas.selectAll("line")
			.data(data.bla)
			.enter()
				.append("line")
				.attr("x1", function (d) {return d.x1;})
				.attr("y1", function (d) {return d.y1;})
				.attr("x2", function (d) {return d.x2;})
				.attr("y2", function (d) {return d.y2;})
				.attr("stroke-width", 10)
				.attr("stroke", "black");
			
		var circle = canvas.append("circle")
			.attr("cx", data.bla[0].x1)
			.attr("cy", data.bla[0].y1)
			.attr("r", 30)
			.attr("fill", "red");	
			
		circle.transition()
			.attr("cx", data.bla[0].x2)
			.attr("cy", data.bla[0].y2)
			.duration(3000)
			.delay(1000)
			.transition()
				.attr("cx", data.bla[1].x2)
				.attr("cy", data.bla[1].y2)
				.duration(3000)
			.transition()
				.attr("cx", data.bla[2].x2)
				.attr("cy", data.bla[2].y2)
				.duration(3000)
			.transition()
				.attr("cx", data.bla[3].x2)
				.attr("cy", data.bla[3].y2)
				.duration(3000);
					
	});
	
	var points = [
  [480, 200],
  [580, 400],
  [680, 100],
  [780, 300],
  [180, 300],
  [280, 100],
  [380, 400]
];

var svg = d3.select("body").append("svg")
    .attr("width", 960)
    .attr("height", 500);

var path = svg.append("path")
    .data([points])
    .attr("fill", "transparent")
    .attr("stroke", "black")
    .attr("stroke-width", 5)
    .attr("d", d3.svg.line()
    .tension(0) // Catmull–Rom
    .interpolate("cardinal-closed"));

svg.selectAll(".point")
    .data(points)
  .enter().append("circle")
    .attr("r", 8)
    .attr("transform", function(d) { return "translate(" + d + ")"; });

var circle = svg.append("circle")
    .attr("r", 13)
    .attr("fill", "red")
    .attr("transform", "translate(" + points[0] + ")");

transition();

function transition() {
  circle.transition()
      .duration(10000)
      .attrTween("transform", translateAlong(path.node()))
      .each("end", transition);
}

// Returns an attrTween for translating along the specified path element.
function translateAlong(path) {
  var l = path.getTotalLength();
  return function(d, i, a) {
    return function(t) {
      var p = path.getPointAtLength(t * l);
      return "translate(" + p.x + "," + p.y + ")";
    };
  };
}
		
			
/*
	$.ajax({
		url : "mydata.json",
		type : "GET",
		success : function(data, textStatus, jqXHR) {
		
		canvas.selectAll("line")
		.data(data)
		.enter()
			.append("line")
			.attr("x1", function (d) {return d.x1;})
			.attr("x1", function (d) {return d.x1;})
			.attr("x1", function (d) {return d.x1;})
			.attr("x1", function (d) {return d.x1;})
			.attr("stroke-width", 20);
		
			
		}
	});

	var data [
			{x: 10, y: 20},
			{x: 40, y: 60},
			{x: 50, y: 70}
	];
	
	var circle = canvas.append("circle")
		.attr("cx", 50)
		.attr("cy", 50)
		.attr("r", 50)
		.attr("fill", "red");
*/

} 