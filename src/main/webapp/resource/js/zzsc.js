
$(document).ready(function(){
    var stepW = 24;
    
    var a=$("#aa").val();
    
    var stars = $("#star > li");
    $("#showb1").css({"width":stepW*a});
    $("#showb").css("width",0);
    stars.each(function(i){
        $(stars[i]).click(function(e){
            var n = i+1;
            $("#showb").css({"width":stepW*n});
            
            $(this).find('a').blur();
            
            var courseId=$("#courseId").val();
            
            
            $("#score").val(n);
            
           $.ajax({
            	type:"post",
            	url:"doGrade.htm",
            	data:"score="+n+"&courseId="+courseId,
            	success:function(msg){
            		if(msg=="ok"){
            			alert("评价成功！");
            		}
            		if(msg=="no"){
            			$("#showb").css("width",0);
            			alert("你已经评价过了，不能重复评价！");
            			 
            		}
            		if(msg=="go"){
            			
            			alert("请登录后再评价");
            			 
            		}
            	}
          
            });
            return stopDefault(e);
          
        });
    });
});
function stopDefault(e){
    if(e && e.preventDefault)
           e.preventDefault();
    else
           window.event.returnValue = false;
    return false;
};

