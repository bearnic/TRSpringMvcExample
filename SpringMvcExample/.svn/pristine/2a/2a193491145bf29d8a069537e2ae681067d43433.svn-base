//this function is responsible for displaying the file information when it is in the file upload control
function PostXMLDocumentInfo() {
  // Update button text.
	
  // The rest of the code will go here...
	
	var files = document.getElementById('files').files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                  '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
}

//This method will post the data from the file in the file upload control to the coffeeadd which will store the values in the database
function PostXMLDocument() 
{
	//Below test was to see if file api was supported by chrome
	
//	if (window.File && window.FileReader && window.FileList && window.Blob) 
//	{
//		  // Great success! All the File APIs are supported.
//		alert('The file api is supported');
//	} 
//	else 
//	{
//		alert('The File APIs are not fully supported in this browser.');
//	}
	var files = document.getElementById('files').files;
	if (files)
    {
	
		for (var i = 0, f; f = files[i]; i++) 
		{
			var reader = new FileReader();
			var contents;
			reader.onload = (function(reader)
			{
				return function()
				{
					contents = reader.result;
			        
					//The below ajax call needs to be in the function above because this function willl only occur on the 
					//asynchronous onload event. This even is triggered as the reader.readAsText(f);
					var xmlhttp;
					if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
						xmlhttp=new XMLHttpRequest();
					}
					else
					{// code for IE6, IE5
						xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					}
					xmlhttp.open("POST",'http://localhost:8080/SpringMvcExample/cofPost',false);
					xmlhttp.setRequestHeader("Content-Type", "application/xml");
					xmlhttp.send(contents);
					loadXMLDoc('cofsix');
				}
			})(reader);
			reader.readAsText(f);
		}
	}
	else
	{
		alert("if(files) returned false - could not load");
	}
}
