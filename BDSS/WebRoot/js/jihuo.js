var u_id;
var per;
function getNoActivationEMPInfos(id,permission,pagecount){
	var c_page=parseInt(pagecount);
	u_id=id;
	per=permission;
	$.ajax({
		beforeSend:function(xh){
			 return true;
		},
       type: "post",
       url:'selectNoActivation',
       data:{
   		  u_id:id
   		,permission:permission
   		,pagebegin:c_page
   		}
		,timeout:3000,
         cache: false,  
         async:false,
         error:function(msg){
    	   alert("error:"+msg);
       },
       success: function(data){
    	   if(data.result=="success"){
    	   $("#t_info tr:gt(1)").remove();//ɾ��ȥ����������2��������
    	   var t_count = parseInt(data.totlecount); 
    	   $("#t_count").html(t_count);
    	   var t_page=0;
    	   if(t_count%10==0){
    		   t_page=t_count/10;
    	   }else{
    		   t_page=parseInt(t_count/10)+1;
    	   }
    	   $("#c_page").html((c_page+1)+"/"+t_page);
    	   var s_pagechange;
    	   
    	   if(t_page==1){
    		   s_pagechange="[��ҳ|��һҳ|��һҳ|ĩҳ]";
    	   }else{
    	   if(c_page==0){
    		   s_pagechange="[��ҳ|��һҳ|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    	   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|��һҳ|ĩҳ]";
    	   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  						"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">��һҳ</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    	       }
    	   }
    	   $("#pagechange").html(s_pagechange);
    	    for(var i=0;i<data.info.length;i++){
    	    var htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
            			"<td align=\"center\">"+data.info[i].username+"</td>"+
            			"<td align=\"center\">"+data.info[i].realname+"</td>"+
            			"<td align=\"center\">"+data.info[i].company+"</td>"+
            			"<td align=\"center\">"+data.info[i].dept+"</td>"+
            			"<td align=\"center\">"+data.info[i].mygroup+"</td>"+
            			"<td align=\"center\">" +
            			"<a href=\"javascript:void(0);\" onclick=\"activation("+data.info[i].id+","+c_page+")\">����</a>" ;
    	       $("#t_info").append(htmlstr);
    	    }
       	}else if(data.result=="nodata"){
       	 $("#t_info tr:gt(1)").remove();//ɾ��ȥ����������2��������
         $("#t_count").html("0");
         $("#c_page").html("1/1");
         $("#pagechange").html("[��ҳ|��һҳ|��һҳ|ĩҳ]");
       	}
     else{
        alert("���ݼ���ʧ�ܣ�");
        }
       }
	});
}

function activation(id,page){
	$.ajax({
		beforeSend:function(xh){
			 return true;
		},
       type: "post",
       url:'activation',
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
    	   if(data.result=="success"){
    		   alert("����ɹ���");
    		   getNoActivationEMPInfos(id,per,page);
    	   }else{
    		   alert("����ʧ�ܣ�");
    	   }
       }
	});
}
