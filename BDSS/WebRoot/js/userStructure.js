
function load(u_id,permission){
	$.ajax({
		beforeSend:function(xh){
			if(permission==1||permission==2||permission==3){
				 return true;
			}else {
				return false;
			}
		},
      type: "post",
      url:'GetUserStructure!load',
      data:{
    	  u_id:u_id,
    	  permission:permission
      },
     timeout:3000,
	 cache: false,  
	 async:false,
	 error:function(msg){
  	   alert("ҳ���ʼ�����󣬴�����Ϣ:"+msg);
     },
     success:function(data){
    	 showInfo(data,permission);
     }
	});
}



function getUserStructure(u_id,permission){
	
	$.ajax({
		beforeSend:function(xh){
			if(permission==1||permission==2||permission==3){
				 return true;
			}else {
				return false;
			}
		},
      type: "post",
      url:'GetUserStructure',
      data:{
    	  u_id:u_id,
    	  permission:permission
      		},
     timeout:3000,
	 cache: false,  
	 async:false,
	 error:function(msg){
  	   alert("ҳ���ʼ�����󣬴�����Ϣ:"+msg);
     },
     success:function(data){
    	 showInfo(data,permission);
     }
	});
}

function showInfo(info,permission){
	
	
}
