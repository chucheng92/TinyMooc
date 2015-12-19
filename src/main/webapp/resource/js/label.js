 function addLabel(labelName,labelId)
  {
	 labels="<a class=\"tag\""+"onclick=\"delLabel(this,'"+labelName+"')\">"+labelName+"</a>";
		if(document.getElementById("addlabelSpan").innerHTML.indexOf("=\""+labelName+"\"") == -1)
		{
			 document.getElementById("addlabelSpan").innerHTML+=labels;
			 document.getElementById("keyWordsHidden").value+=labelName+",";
		}
  }

  function delLabel(_element,labelName){
     newValue = document.getElementById("keyWordsHidden").value.replace(labelName+",","");
     document.getElementById("keyWordsHidden").value = newValue;
	  var _parentElement = _element.parentNode;
      if(_parentElement){
             _parentElement.removeChild(_element);
      }
}
  
  function addNewLabel()
  {
	  var newLabelName = document.getElementById("newLabelInput").value;
	  if(newLabelName==null||newLabelName=="")
	  {
		 alert("填上名字!"); 
	   }
	  else if(newLabelName.length>10){
		  alert("最长十个字!"); 
	  }
	  else
	  {
		  newLabelStr="<a class=\"tag\""+
			"onclick=\"delNewLabel(this,'"+newLabelName+"')\">"+newLabelName+"</a>";
			if(document.getElementById("addlabelSpan").innerHTML.indexOf("=\""+newLabelName+"\"") == -1)
			{
				 document.getElementById("addlabelSpan").innerHTML+=newLabelStr;
				 document.getElementById("keyWordsHidden").value+=newLabelName+",";
			}
			 $("#q").val("");
			document.getElementById("newLabelInput").value="";
	   }
  }
  
  function delNewLabel(_element,labelName){
	     newLabelValue = document.getElementById("keyWordsHidden").value.replace(labelName+",","");
	     document.getElementById("keyWordsHidden").value = newLabelValue;
		  var _parentElement = _element.parentNode;
	      if(_parentElement){
	             _parentElement.removeChild(_element);
	      }
	}
  