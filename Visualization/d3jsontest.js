d3json();

function d3json ()
{
var can = document.getElementById('Canvas');
var ctx = can.getContext('2d');

var cx = 100;
var cy  =100;

// in case you like using degrees
function toRadians(deg) {
    return deg * Math.PI / 180;
}

// draw a sector from 0 to Math.PI/2 aka one quarter of the Pie, going clockwise, starting at 0

ctx.beginPath();
ctx.moveTo(cx,cy);
ctx.arc(cx,cy,30,0,toRadians(90));
ctx.lineTo(cx,cy);
ctx.closePath();
ctx.fill();

// maybe a tiny slice from 180 to 220

ctx.fillStyle = 'lightblue';

ctx.beginPath();
ctx.moveTo(cx,cy);
ctx.arc(cx,cy,30,toRadians(180),toRadians(220));
ctx.lineTo(cx,cy);
ctx.closePath();
ctx.fill();

} 