var x, element="";
var a;

function test ()
{
	d3.select("body").append("p").text("New paragraph!");
	
	
	//Lägga till en bild på sidan
	img = document.createElement("img");
	img.src = "Haha.jpg";
	var src = document.getElementById("hej");
	src.appendChild(img);
	
	//Ta text från ett id för att sedan lägga till den i en annan textrad.
	element = document.getElementById("hej");
	x = element.textContent || element.innerText;
	
	if(x.indexOf("CSS") != -1)
	{
		x = "Oj!";
	}
	
	alert("Hej " + x);
}