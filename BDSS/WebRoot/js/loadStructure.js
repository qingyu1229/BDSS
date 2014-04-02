
function loadstr(u_id ,permission){
	if(permission==1){
		loads(u_id,permission,"saler");
	}else if(permission==2){
		loads(u_id,permission,"group");
	}else if(permission==3){
		loads(u_id,permission,"dept");
	}
}

function loads(id,per,type){
	var loadurl="load_"+type;
	$.ajax({
      type: "post",
      url:loadurl,
      data:{
    	  u_id:id,
    	  permission:per
      },
     timeout:3000,
	 cache: false,  
	 async:false,
	 error:function(msg){
  	 alert("页面初始化错误，错误信息:"+msg);
     },
     success:function(data){
    	 if(data.result=="success"){
    		 for(var i=0;i<data.info.length;i++){
    			 if(type=="saler"){
    				 $("#saler").append("<option value="+data.info[i].id+">"+data.info[i].realname+"</option>");	
    			 }else if(type=="group"){
    				 $("#group").append("<option value="+data.info[i]+">第"+data.info[i]+"小部</option>");	
    			 }else if(type=="dept"){
    				 $("#dept").append("<option value="+data.info[i]+">"+data.info[i]+"大部</option>");	
    			 }
    		 }
    	 }else{
    		 alert("页面初始化失败！");
    	 }
     }
	});
}

function change_dept(id,per){
	if($("#dept").val()==0){
		 $("#group").empty();
		 $("#group").append("<option value="+0+">==所有==</option>");
		 $("#saler").empty();
		 $("#saler").append("<option value="+0+">==所有==</option>");
	}else{
	$.ajax({
      type: "post",
      url:"change_dept",
      data:{
    	  u_id:id,
    	  permission:per,
    	  dept:$("#dept").val()
      },
     timeout:3000,
	 cache: false,  
	 async:false,
	 error:function(msg){
  	 alert("页面初始化错误，错误信息:"+msg);
     },
     success:function(data){
    	 if(data.result=="success"){
    		 $("#group").empty();
    		 $("#group").append("<option value="+0+">==所有==</option>");
    		 for(var i=0;i<data.info.length;i++){
    			 $("#group").append("<option value="+data.info[i]+">第"+data.info[i]+"小部</option>");	
    		 }
    	 }else{
    		 alert("页面初始化失败！");
    	 }
     }
	});}
}

function change_group(id,per){
	if($("#group").val()==0){
		 $("#saler").empty();
		 $("#saler").append("<option value="+0+">==所有==</option>");
	}else{
	$.ajax({
     type: "post",
     url:"change_group",
     data:{
   	  u_id:id,
   	  permission:per,
   	  dept:$("#dept").val(),
   	  group:$("#group").val()
     },
    timeout:3000,
	 cache: false,  
	 async:false,
	 error:function(msg){
 	 alert("页面初始化错误，错误信息:"+msg);
    },
    success:function(data){
   	 if(data.result=="success"){
   		 $("#saler").empty();
   		 $("#saler").append("<option value="+0+">==所有==</option>");
   		 for(var i=0;i<data.info.length;i++){
   			 $("#saler").append("<option value="+data.info[i].id+">"+data.info[i].realname+"</option>");		
   		 }
   	 }else{
   		 alert("页面初始化失败！");
   	 }
    }
	});}
}

