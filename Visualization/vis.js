function Point(x, y) {
	this.x = x;
	this.y = y;
}

var p1 = new Point(100, 150);
var p2 = new Point(450, 50);

var canvas = document.getElementById('myCanvas');
var ctx = canvas.getContext('2d');
ctx.beginPath();
ctx.moveTo(p1.x, p1.y);
ctx.lineTo(p2.x, p2.y);
ctx.stroke();

var pointsData = [{"x" : 81, "y" : 233}, 
				{"x" : 72, "y" : 182},
				{"x" : 109, "y" : 94},
				{"x" : 176, "y" : 93},
				{"x" : 214,	"y" : 140},
				{"x" : 233,	"y" : 206},
				{"x" : 200,	"y" : 238},
				{"x" : 159,	"y" : 252},
				{"x" : 108,	"y" : 253},
				{"x" : 81,	"y" : 233}];

var points = [];
var totDist = 0;

for (var i = 0; i < pointsData.length - 1; i++) {
	var xs = 0;
	var ys = 0;

	xs = Math.pow(pointsData[i + 1].x - pointsData[i].x, 2);
	ys = Math.pow(pointsData[i + 1].y - pointsData[i].y, 2);
	totDist += Math.sqrt(xs + ys);
}

for (var i = 0; i < pointsData.length; i++) {
	points.push(new Point(pointsData[i].x, pointsData[i].y));
}

function Circle(endTime) {
	this.endTime = endTime;
	var start, next;
	var pointIndex = 1;
	var ds = 0;

	this.time = 0;
	start = points[0];
	next = points[1];
	this.position = new Point(start.x, start.y);

	this.x = function() {
		return this.position.x;
	};

	this.y = function() {
		return this.position.y;
	};

	var xs = Math.pow(next.x - start.x, 2);
	var ys = Math.pow(next.y - start.y, 2);
	ds = Math.sqrt(xs + ys);

	this.move = function(time) {
		this.time += time;

		if (this.time >= endTime * (ds / totDist)) {
			this.time = 0;

			if (points.length > 0) {

				start = next;

				if (pointIndex < points.length - 1) {
					next = points[pointIndex++];
				} else {
					pointIndex = 0;
					next = points[pointIndex];
				}
			}
			var xs = Math.pow(next.x - start.x, 2);
			var ys = Math.pow(next.y - start.y, 2);
			ds = Math.sqrt(xs + ys);
		}
		var delta = this.time / (endTime * (ds / totDist));
		this.position.x = start.x + delta * (next.x - start.x);
		this.position.y = start.y + delta * (next.y - start.y);
	};
}

var runners = [];
runners.push({'circle':new Circle(4000), 'color': '#'+Math.random().toString(16).substr(-6)});
runners.push({'circle':new Circle(5000), 'color': '#'+Math.random().toString(16).substr(-6)});
runners.push({'circle':new Circle(6000), 'color': '#'+Math.random().toString(16).substr(-6)});
runners.push({'circle':new Circle(7000), 'color': '#'+Math.random().toString(16).substr(-6)});

setInterval(function() {
	redraw();
	for (var i = 0; i < runners.length; i++) {
		runners[i].circle.move(10);
		drawObject(runners[i].circle, runners[i].color);
	}
}, 10);

function redraw() {
	ctx.fillStyle = "#ffffff";
	ctx.fillRect(0, 0, 500, 500);
}

function drawObject(obj, col) {

	ctx.fillStyle = col;

	ctx.beginPath();
	ctx.arc(obj.x(), obj.y(), 10, 0, Math.PI * 2, true);
	ctx.closePath();
	ctx.fill();

}