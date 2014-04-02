
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
   	    	alert("δ֪����"+msg);
      },
      success: function(data){
   	   if(data.result=="success"){
   		   $("#username").html(data.info.username);
   		   $("#realname").html(data.info.realname);
   		   
   		   if(data.info.onJob=="1"){
   			 $("#onjob").html("��ְ");
   		   }else{
   			 $("#onjob").html("����ְ");
   		   }
   	       var company=	data.info.company;
   	       if(company=="sz"){
   	    	  $("#company").html("�ٶ����ڷֹ�˾");
   	       }else if(company=="dg"){
   	    	  $("#company").html("�ٶȶ�ݸ�ֹ�˾");
   	       }else if(company=="gz"){
   	    	  $("#company").html("�ٶȹ��ݷֹ�˾");
   	       }
   		   var permission=  data.info.permission;
   		   //alert(permission);
   		   if(permission=="0"){
   			 $("#dept").html(data.info.dept+data.info.mygroup);
   			 $("#permission").html("���ۼ����˺�");
   		   }else if(permission=="1"){
   			 $("#dept").html(data.info.dept+data.info.mygroup);
  			 $("#permission").html("�������˺�");
   		   }
   		   else if(permission=="2"){
   			 $("#dept").html(data.info.dept);
  			 $("#permission").html("�߾������˺�");
   		   } else if(permission=="3"){
     		 $("#permission").html("�ܼ༶���˺�");
      	   }
   	   	}
   	   }
	});
}