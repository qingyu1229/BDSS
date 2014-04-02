
function getUserInfo(u_id){
	$.ajax({
			 type: "post",
		     url:'getUserInfo',
		     data:{
		 		u_id:u_id
		},
		timeout:3000,
        cache: false,  
        async:false,
        error:function(msg){
   	    	alert("未知错误："+msg);
      },
      success: function(data){
   	   if(data.result=="success"){
   		   $("#username").html(data.info.username);
   		   $("#realname").html(data.info.realname);
   		   
   		   if(data.info.onJob=="1"){
   			 $("#onjob").html("在职");
   		   }else{
   			 $("#onjob").html("已离职");
   		   }
   	       var company=	data.info.company;
   	       if(company=="sz"){
   	    	  $("#company").html("百度深圳分公司");
   	       }else if(company=="dg"){
   	    	  $("#company").html("百度东莞分公司");
   	       }else if(company=="gz"){
   	    	  $("#company").html("百度广州分公司");
   	       }
   		   var permission=  data.info.permission;
   		   //alert(permission);
   		   if(permission=="0"){
   			 $("#dept").html(data.info.dept+data.info.mygroup);
   			 $("#permission").html("销售级别账号");
   		   }else if(permission=="1"){
   			 $("#dept").html(data.info.dept+data.info.mygroup);
  			 $("#permission").html("经理级别账号");
   		   }
   		   else if(permission=="2"){
   			 $("#dept").html(data.info.dept);
  			 $("#permission").html("高经级别账号");
   		   } else if(permission=="3"){
     		 $("#permission").html("总监级别账号");
      	   }
   	   	}
   	   }
	});
}