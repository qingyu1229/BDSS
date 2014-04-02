
var u_id;
function load_page(id){
	u_id=id;
	$("#bt_modify").click(modify_pwd);
}

function modify_pwd(){
	$.ajax({
		beforeSend:function(xh){
			return doCheck();
			},
			 type: "post",
		     url:'ModifyPWD',
		     data:{
		 		oldPWD:$("#oldPWD").val(),
		 		newPWD:$("#newPWD").val(),
		 		u_id:u_id
		},
		timeout:3000,
        cache: false,  
        async:false,
        error:function(msg){
   	    alert("error:"+msg);
   	    $("#bt_modify").value="提交";
   		$("#bt_modify").disable=false;
      },
      success: function(data){
   	   if(data.result=="success"){
   		   $("#oldPWD").val("");
   		   $("#newPWD").val("");
   		   $("#q_newPWD").val("");
   		   $("#bt_modify").value="提交";
     	   $("#bt_modify").disable=false;
   		   alert("密码修改成功！");
   	   	}else if(data.result=="oldPWDError"){
   	   	   $("#oldPWD").val("");
 		   $("#newPWD").val("");
 		   $("#q_newPWD").val("");
   	   		alert("原密码错误！");
   	   	}else{
   	     	alert("未知错误！");
   	   	}
   	   }
	});
}

function doCheck(){
	var oldPWD= $("#oldPWD").val();
	var newPWD= $("#newPWD").val();
	var q_newPWD= $("#q_newPWD").val();
	if(oldPWD==""||newPWD==""||q_newPWD==""){
		alert("请将信息填写完整！");
		return false;
	}else{
		if(newPWD.length<6||newPWD.length>20){
			$("#newPWD").val("");
			$("#q_newPWD").val("");
			alert("新密码长度6-20！");
			return false;
		}else if(!newPWD.match("^[a-z0-9A-Z_]+$")){
			$("#newPWD").val("");
			$("#q_newPWD").val("");
			alert("密码只能由英文数字和下划线组成");
			return false;
		}else if(newPWD!=q_newPWD){
			$("#newPWD").val("");
			$("#q_newPWD").val("");
			alert("密码与确认密码不一致！");
			return false;
		}
	}
	$("#bt_modify").value="提交中";
 	$("#bt_modify").disable=true;
	return true;
}