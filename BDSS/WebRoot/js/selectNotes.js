var u_id;
var per;
function getNotes(id,permission,pagecount){
	$("#bt_selectNotes").value="��ѯ��";
	$("#bt_selectNotes").disable=true;
	var c_page=parseInt(pagecount);
	//alert(c_page);
	u_id=id;
	per=permission;
	var dept="0";
	var group="0";
	var saler="0";
	if(per==1){
		saler=$("#saler").val();
	}else if(per==2){
		group=$("#group").val();
		saler=$("#saler").val();
	}else if(per==3){
		dept=$("#dept").val();
		group=$("#group").val();
		saler=$("#saler").val();
	}
	$.ajax({
		beforeSend:function(xh){
			 return true;
		},
       type: "post",
       url:'selectNotes',
       data:{
		companyname:$('#companyname').val()
   		,date:$('#date').val()
   		,querytype:$('input[name="querytype"]:checked').val()
   		,u_id:id
   		,permission:permission
   		,pagebegin:c_page
   		,dept:dept
   		,group:group
   		,saler:saler
   		}
		,timeout:3000,
         cache: false,  
         async:false,
         error:function(msg){
    	    alert("error:"+msg);
    	   $("#bt_selectNotes").value="��ѯ";
    	   $("#bt_selectNotes").disable=false;
       },
       success: function(data){
    	   //alert(data);
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
    		   s_pagechange="[��ҳ|��һҳ|<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(t_page-1))+")\" class=\"right-font08\">ĩҳ</a>]";
    	   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|��һҳ|ĩҳ]";
    	   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  				"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">��һҳ</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getNotes("+u_id+","+per+","+(parseInt(t_page-1))+")\" class=\"right-font08\">ĩҳ</a>]";
    	       }
    	   }
    	   $("#pagechange").html(s_pagechange);
    	    for(var i=0;i<data.info.length;i++){
    	    var htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
            			"<td>"+data.info[i].companyname+"</td>"+
            			"<td align=\"center\">"+data.info[i].dept+data.info[i].mygroup+data.info[i].realname+"</td>"+
            			"<td align=\"center\">"+data.info[i].drdate+"</td>"+
            			"<td align=\"center\">"+data.info[i].notedate+"</td>"+
            			"<td align=\"center\">"+data.info[i].note+"</td>"+
            			"<td align=\"center\">" +
            			"<a href=\"files/DetailNoteInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">��ϸ</a></td>" ;
    	       $("#t_info").append(htmlstr);
    	    }
    	    $("#bt_selectNotes").value="��ѯ";
    		$("#bt_selectNotes").disable=false;
       	}
    	else if(data.result=="nodata"){
    		alert("û�ж�Ӧ���ݣ�");
        }else{
        	alert("��ѯʧ�ܣ�");
        }
       }
	});
}
