

function PostXmlCoffeeInfo()
{
	if(document.getElementById('inputXMLText').value !='')
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		var textAreaXML = document.getElementById('inputXMLText').value;
		xmlhttp.open("POST",'http://localhost:8080/SpringMvcExample/cofPost',false);
		xmlhttp.setRequestHeader("Content-Type", "application/xml");
		xmlhttp.send(textAreaXML);
		loadXMLDoc('cofsix');
	}
	else
	{
		alert("Please Make Sure That The Text Area Has XML!");
	}
}
//Gets the data and passes the name and quanlity in url query string to subtract
function SubtractCoffeeInfo()
{
	if(document.getElementById('NameText').value !='' && document.getElementById('QuanlityText').value !='')
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		var Name = document.getElementById('NameText').value;
		var Quanlity = document.getElementById('QuanlityText').value;
		xmlhttp.open("GET",'cofsubtract?Name='+Name+'&Quanlity='+Quanlity,false);
		xmlhttp.send();
		loadXMLDoc('cofsix');
	}
	else
	{
		alert("Please Make Sure That The Text Boxes Have Values");
	}
}
//Gets the data and passes the name and quanlity in url query string to add
function AddCoffeeInfo()
{
	if(document.getElementById('NameText').value !='' && document.getElementById('QuanlityText').value !='')
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		var Name = document.getElementById('NameText').value;
		var Quanlity = document.getElementById('QuanlityText').value;
		xmlhttp.open("GET",'cofadd?Name='+Name+'&Quanlity='+Quanlity,false);
		xmlhttp.send();
		loadXMLDoc('cofsix');
	}
	else
	{
		alert("Please Make Sure That The Text Boxes Have Values");
	}
}
//Gets the data and passes the name and quanlity in url query string to insert
function InsertCoffeeInfo()
{
	if(document.getElementById('NameText').value !='' && document.getElementById('QuanlityText').value !='')
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		var Name = document.getElementById('NameText').value;
		var Quanlity = document.getElementById('QuanlityText').value;
		xmlhttp.open("GET",'cofeight?Name='+Name+'&Quanlity='+Quanlity,false);
		xmlhttp.send();
		loadXMLDoc('cofsix');
	}
	else
	{
		alert("Please Make Sure That The Text Boxes Have Values");
	}
}

function DeleteCoffeeInfo()
{
	if(document.getElementById('NameText').value !='' && document.getElementById('QuanlityText').value !='')
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		var Name = document.getElementById('NameText').value;
		var Quanlity = document.getElementById('QuanlityText').value;
		xmlhttp.open("GET",'cofnine?Name='+Name+'&Quanlity='+Quanlity,false);
		xmlhttp.send();
		loadXMLDoc('cofsix');
	}
	else
	{
		alert("Please Make Sure That The Text Boxes Have Values");
	}
}

function loadCoffeeSvgBarGraph()
{
	var xmlhttp;
	var x,xx,i;


	var inputa = new Array();
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    x=xmlhttp.responseXML.documentElement.getElementsByTagName("coffee");
	    for (i=0;i<x.length;i++)
	      {
	    	var o = {
		        	'name': "test",
		        	'quanlity': 1
		        };
	      xx=x[i].getElementsByTagName("name");
	        {
	        try
	          {
	          o.name=xx[0].firstChild.nodeValue;
	          }
	        catch (er)
	          {
	          }
	        }
	      xx=x[i].getElementsByTagName("quanlity");
	        {
	        try
	          {
	          o.quanlity=xx[0].firstChild.nodeValue;
	          inputa.push(o);
	          }
	        catch (er)
	          {
	          }
	        }
	      }
	    
	    var vis = d3.select('#visualisation'),
	    
	    WIDTH = 1200,
	    HEIGHT = 500,
	    MARGINS = {
	      top: 20,
	      right: 20,
	      bottom: 20,
	      left: 50
	    },
	    xRange = d3.scale.ordinal().rangeRoundBands([MARGINS.left, WIDTH - MARGINS.right], 0.1).domain(inputa.map(function (d) {
	      return d.name;
	    })),


	    yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([0,
	    Math.max.apply(Math,inputa.map(function(o){return o.quanlity;}))                                                            
	    ]),

	    xAxis = d3.svg.axis()
	      .scale(xRange)
	      .tickSize(5)
	      .tickSubdivide(true),

	    yAxis = d3.svg.axis()
	      .scale(yRange)
	      .tickSize(5)
	      .orient("left")
	      .tickSubdivide(true);
	    
	    vis.selectAll("*").remove();
	  vis.append('svg:g')
	    .attr('class', 'x axis')
	    .attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
	    .call(xAxis);

	  vis.append('svg:g')
	    .attr('class', 'y axis')
	    .attr('transform', 'translate(' + (MARGINS.left) + ',0)')
	    .call(yAxis);

	  vis.selectAll('rect')
	    .data(inputa)
	    .enter()
	    .append('rect')
	    .attr('x', function (d) {
	      return xRange(d.name);
	    })
	    .attr('y', function (d) {
	      return yRange(d.quanlity);
	    })
	    .attr('width', xRange.rangeBand())
	    .attr('height', function (d) {
	      return ((HEIGHT - MARGINS.bottom) - yRange(d.quanlity));
	    })
	    .attr('fill', 'grey')
	    .on('mouseover',function(d){
	      d3.select(this)
	        .attr('fill','blue');
	    })
	    .on('mouseout',function(d){
	      d3.select(this)
	        .attr('fill','grey');
	    });
	  
	    }
	  }
	
	xmlhttp.open("GET",'cofsix',false);
	xmlhttp.send();
}

function loadXMLDoc(url)
{
var xmlhttp;
var txt,x,xx,i,txtxml;


var a = new Array();
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    txt="<table id='coffeeTable' class = 'coffeeTable' border='2' width='100%'><tr><th>Name</th><th>Quanlity</th></tr>";
    x=xmlhttp.responseXML.documentElement.getElementsByTagName("coffee");
    for (i=0;i<x.length;i++)
      {
      txt=txt + "<tr>";
      xx=x[i].getElementsByTagName("name");
        {
        var o = {
        	'name': "test",
        	'quanlity': 1
        };
        try
          {
          txt=txt + "<td>" + xx[0].firstChild.nodeValue + "</td>";
          o.name=xx[0].firstChild.nodeValue;
          }
        catch (er)
          {
          txt=txt + "<td> </td>";
          }
        }
      xx=x[i].getElementsByTagName("quanlity");
        {
        try
          {
          txt=txt + "<td>" + xx[0].firstChild.nodeValue + "</td>";
          o.quanlity=xx[0].firstChild.nodeValue;
          a.push(o);
          }
        catch (er)
          {
          txt=txt + "<td> </td>";
          }
        }
      txt=txt + "</tr>";
      }
    txt=txt + "</table>";
    document.getElementById('txtCoffeeInfo').innerHTML=txt;
    txtxml=xmlhttp.responseText;
    txtxml = vkbeautify.xml(txtxml, 3);
    txtxml=txtxml.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    txtxml="<PRE>" + txtxml + "</PRE>";
    document.getElementById('txtCoffeeXML').innerHTML=txtxml;
    loadCoffeeSvgBarGraph();
    }
  }
if (document.getElementById('coffourRadio').checked)
{
	xmlhttp.open("GET",'coffour',false);
}
else if (document.getElementById('cofsixRadio').checked)
{
	xmlhttp.open("GET",'cofsix',false);
}
else if (document.getElementById('cofsevenRadio').checked)
{
	if(document.getElementById('NameText').value !='' && document.getElementById('QuanlityText').value !='')
	{
		var Name = document.getElementById('NameText').value;
		var Quanlity = document.getElementById('QuanlityText').value;
		xmlhttp.open("GET",'cofseven?Name='+Name+'&Quanlity='+Quanlity,false);
	}
	else
	{
		xmlhttp.open("GET",'cofseven',false);
	}
}
else
{
	xmlhttp.open("GET",url,false);
}
xmlhttp.send();
}