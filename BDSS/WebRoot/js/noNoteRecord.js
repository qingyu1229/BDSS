var u_id;
var per;
function getSalesinfos(id,permission,pagecount){
	var c_page=parseInt(pagecount);
	//alert(c_page);
	u_id=id;
	per=permission;
	$.ajax({
		beforeSend:function(xh){
			 return true;
		},
       type: "post",
       url:'getNoNoteInfos',
       data:{
   			u_id:id
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
    	   if(t_page==0){
    		   s_pagechange="[��ҳ|��һҳ|��һҳ|ĩҳ]";
    	   }else{
    	   if(c_page==0){
    		   s_pagechange="[��ҳ|��һҳ|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    	   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|��һҳ|ĩҳ]";
    	   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  				"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">��һҳ</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    	       }
    	   }
    	   $("#pagechange").html(s_pagechange);
    	    for(var i=0;i<data.info.length;i++){
    	    var htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
            			"<td>"+data.info[i].companyname+"</td>"+
            			"<td align=\"center\">"+data.info[i].linkman+"</td>"+
            			"<td align=\"center\">"+data.info[i].phone+"</td>"+
            			"<td align=\"center\">"+data.info[i].intention+"</td>"+
            			"<td align=\"center\">"+data.info[i].date+"</td>"+
            			"<td align=\"center\">"+data.info[i].nextnotedate+"</td>"+
            			"<td align=\"center\">"+data.info[i].dept+data.info[i]._group+data.info[i].realname+"</td>"+
            			"<td align=\"center\">" +
            			"<a href=\"files/DetailInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">��ϸ|</a>" +
            			"<a href=\"files/Note.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">����|</a>"+
            			"<a href=\"files/ModifyInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">�޸�</a>|" +
            			"<a href=\"files/SelectNotes.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">�鿴����</a></td></tr>";
    	       $("#t_info").append(htmlstr);
    	    }
       	}
     else{
        alert("���ݼ���ʧ�ܣ�");
        }
   }
	});
}
