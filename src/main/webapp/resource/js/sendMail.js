var flag1=false;
function checkReg(){  
    //获取表单提交的内容  
    	
    	var varName=document.form1.userName;
    	var nickname=varName.value;
    	
    	if(varName.value.length==0)
    	{
		     document.getElementById("name").innerHTML="<font color='red'>收件人不能为空!</font>";
			 return false;
    	}else{
    		checkUsed(nickname);
    		//flag2=true;
        	document.getElementById("name").innerHTML="<font color='red'></font>";
    	}
    	
    
 }
function checkUsed(name){

	 var url = "checkUsedNick1.htm?nickname="+name;
	//创建一个XMLHttpRequest对象req  
		    if(window.XMLHttpRequest) {  
		        //IE7, Firefox, Opera支持  
		        req = new XMLHttpRequest();  
		    }else if(window.ActiveXObject) {  
		        //IE5,IE6支持  
		        req = new ActiveXObject("Microsoft.XMLHTTP");  
		    }  
		  
		    try
		    {
	  	    req.open("GET", url, true);  
	  	    req.onreadystatechange = callBackReg;  
	  	    req.send(null);  	
		    }
		   catch (e) 
		   { 
		  	alert(e.message); 
		  	alert(e.description); 
		  	alert(e.number) ;
		  	alert(e.name) ;
		   } 
		   
		
	}
function callBackReg(){
	  if(req.readyState == 4) {
		  
	        var result = req.responseText;
	        	
	           if(result=='registed'){
	        	
	        	   document.getElementById("name").innerHTML="<font color='green'></font>"; 
	        	   flag1=true;
	        	   return true;
	           }
	           if(result=='ok')
	           {
	        	   document.getElementById("name").innerHTML="<font color='red'>收件人不存在</font>";  
	        		return false;  
	           }  
}
}
function validate()
{

	if(flag1)
	{
	
		form1.submit();
	}
	else
		alert("请仔细检查您的信息！");
}