
function submitFile(){
	
	$.ajax({
       type: "post",
       url:'AddByExcel',
       data:{
   		  u_id:id
   		}
		,timeout:3000,
         cache: false,  
         async:false,
         error:function(msg){
    	 alert("error:"+msg);
       },
       success: function(data){
    	   	alert("�����ɹ���");
    	   	getInfos(u_id,per,page);
    	   }
       }
	);
	
	
	
}