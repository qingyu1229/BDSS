var u_id;
function pwdsafe(id){
	u_id=id;
	$("#bt_safe").click(tijiao);
}

function tijiao(){
	var wt1= $("#wenti1").val();
	var wt2= $("#wenti2").val();
	var wt3= $("#wenti3").val();
	var da1= $("#daanyi").val();
	var da2= $("#daaner").val();
	var da3= $("#daansan").val();
	$.ajax({
		beforeSend:function(xh){
		    $("#bt_safe").value="�ύ��";
		    $("#bt_safe").disable=true;
			if(da1==""||da2==""||da3==""){
				alert("����д��������Ĵ𰸣�");
				return false;
				$("#bt_safe").value="�ύ";
			    $("#bt_safe").disable=false;
				}
			},
			 type: "post",
		     url:'PWDSafe',
		     data:{
		 		wt1:wt1,
		 		wt2:wt2,
		 		wt3:wt3,
		 		da1:da1,
		 		da2:da2,
		 		da3:da3,
		 		u_id:u_id
		},
		timeout:3000,
        cache: false,  
        async:false,
        error:function(msg){
   	    alert("error:"+msg);
   	    $("#bt_safe").value="�ύ��";
   		$("#bt_safe").disable=false;
      },
      success: function(data){
   	   if(data.result=="success"){
   		   $("#daanyi").val("");
   		   $("#daaner").val("");
   		   $("#daansan").val("");
   		   $("#bt_safe").value="�ύ";
    	   $("#bt_safe").disable=true;
   		   alert("�ܱ����óɹ���");
   	   	}
   	   }
	});
}
