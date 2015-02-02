<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="<c:url value="/resources/css/CoffeeAjax.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/CoffeeTable.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/scrolltest.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ajaxButtons.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/vkbeautify.0.99.00.beta.js" />"></script>
<script src="<c:url value="/resources/js/CoffeeAjax.js" />"></script>
<script src="<c:url value="/resources/js/CoffeeFileUpload.js" />"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
</head>
<body>
<div class="upperThird">
<div class="upperThirdLeft">
<div id="radioButtons" class="radioButtons">
	<input id="coffourRadio" type="radio" name="coffeeRadio" value="coffour">coffour (This displays hardcoded xml)<br>
	<input id="cofsixRadio" type="radio" name="coffeeRadio" value="cofsix">cofsix (This pulls everything from the database)<br>
	<input id="cofsevenRadio" type="radio" name="coffeeRadio" value="cofseven">cofseven (This pulls data from the database based on the textboxes)<br>
</div>
<br>
<div id="CoffeeTextBoxes" class="CoffeeTextBoxes">
	<input id="NameText" type="text">Name<br>
	<input id="QuanlityText" type="text">Quanlity<br>
</div>
</div>
<div class="upperThirdRight">
	<h2>Coffee House App</h2>
	<img class="coffeeImage" src="http://regdev.isinet.com:11180/repos/cms/SpringMvcExample/src/main/webapp/resources/mytheme/images/9502coffee_bean.jpg" HEIGHT="70" WIDTH="70">
</div>
</div>

<div id="CoffeeDivs" class="CoffeeDivs">
	<div id="txtCoffeeButtonDiv" class="txtCoffeeButtonDiv">
		<button id="txtCoffeeButton" class="txtButton" onclick="loadXMLDoc('cofsix')">Get Coffee Info</button>
	</div>

	<div id="insertCoffeeButtonDiv" class="insertCoffeeButtonDiv">
		<button id="insertCoffeeButton" class="insertButton" onclick="InsertCoffeeInfo()">Insert Coffee Info</button>
	</div>

	<div id="deleteCoffeeButtonDiv" class="deleteCoffeeButtonDiv">
		<button onclick="DeleteCoffeeInfo()" class="deleteButton">Delete Coffee Info</button>
	</div>
	
	<div id="addCoffeeButtonDiv" class="addCoffeeButtonDiv">
		<button onclick="AddCoffeeInfo()" class="addButton">Add Coffee Quanlity</button>
	</div>
	
	<div id="subtractCoffeeButtonDiv" class="subtractCoffeeButtonDiv">
		<button onclick="SubtractCoffeeInfo()" class="subtractButton">Subtract Coffee Quanlity</button>
	</div>
</div>
<div id="txtCoffeeInfo" class="txtCoffeeInfo">
</div>

<div id="txtCoffeeXML" class="txtCoffeeXML">
</div>

<div id ="inputCoffeeXML" class = inputCoffeeXML>
	<button onclick="PostXmlCoffeeInfo()" class="postXMLButton">Post Xml Data</button>
	<br>
	<textarea class="inputXMLText" name="term" id="inputXMLText"></textarea>
</div>


<input type="file" id="files" name="files[]" onchange = "PostXMLDocumentInfo()" multiple />
<button type="submit" id="upload-button" onclick = "PostXMLDocument()">Upload</button>
<br/>
<output id="list"></output>

<svg id="visualisation"></svg>


</body>
</html>
