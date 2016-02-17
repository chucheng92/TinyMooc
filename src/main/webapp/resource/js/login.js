var req;  
var flag1=false;
var flag2=false;
var ff=false;

function checkReg(){  
    //获取表单提交的内容  
			
	 	   	var varEmail=document.form1.userEmail;
	   		if(varEmail.value.length==0)
	    	{
			     document.getElementById("email").innerHTML="<font color='red'>邮箱不能为空!</font>";			   
				 return false;
	    	}
	    	else
	    	{
	    		var ts=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	    		if(!ts.test(varEmail.value))
	    		{
	    			document.getElementById("email").innerHTML="<font color='red'>邮箱格式不对!</font>";
				 	return false;
	    		}
	    	}
	   		flag1=true;
	   		document.getElementById("email").innerHTML="<font color='red'></font>";
	    
    }
function checkReg1(){  
    		
			var varEmail=document.form1.userEmail;
			if(varEmail.value.length==0)
	    	{
			     document.getElementById("email").innerHTML="<font color='red'>邮箱不能为空!</font>";
			     
				 return false;
	    	}
			else
	    	{
	    		var ts=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	    		if(!ts.test(varEmail.value))
	    		{
	    			document.getElementById("email").innerHTML="<font color='red'>邮箱格式不对!</font>";
	    			
				 	return false;
	    		}
	    	}
			
	   		ff=true;
	   		

    }
function validate1(){
    var varEmail=document.form1.userEmail;

	if(ff){


        <!--	window.location.href="findPassword.htm?userEmail=13646029214@163.com";
           -->
            window.location.href="findPassword.htm?userEmail="+varEmail.value;

			
		}
}
function checkPwd()
			{
				var passw=document.form1.userPassword;
				var ts=/^.{6,16}$/;
				document.getElementById("pwd").innerHTML="";
				if(passw.value.length!=0)
				{
					if(ts.test(passw.value))
					{
						return true;
					}
					else
					{
						document.getElementById("pwd").innerHTML="<font color='red'>密码由6-16个字符组成\n字母或数字组成</font>";
						flag3=false;
						return false;
					}
				} 
				else
				{
					flag3=false;
					document.getElementById("pwd").innerHTML="<font color='red'>用户密码不能为空!</font>";
					return false;
				}
			}
function checkPwd1()
{
	var passw=document.form1.userPassword;
	var ts=/^.{6,16}$/;
	document.getElementById("pwd").innerHTML="";
	if(passw.value.length!=0)
	{
		if(ts.test(passw.value))
		{
			return true;
		}
		else
		{
			document.getElementById("pwd").innerHTML="<font color='red'>密码由6-16个字符组成\n字母或数字组成</font>";
			flag3=false;
			return false;
		}
	} 
	else
	{
		flag3=false;
		document.getElementById("pwd").innerHTML="<font color='red'>用户密码不能为空!</font>";
		return false;
	}
}
function validate3(){
	if(checkPwd1()){
		
		form2.submit();
	}
	
}
			
function validate()
			{
				if( flag1&&checkPwd())
				{
					form1.submit();
				}
				else
					alert("请仔细检查您的信息！");
			}