var u_id;
var per;
function getInfos(id,permission,pagecount){
	var c_page=parseInt(pagecount);
	u_id=id;
	per=permission;
	var dept;
	var group;
	var saler;
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
       url:'getEMPInfos',
       data:{
   		  u_id:id
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
    		   s_pagechange="[��ҳ|��һҳ|<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    		   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"��һҳ</a>|��һҳ|ĩҳ]";
    		   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">��ҳ</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  						"��һҳ</a>|<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">��һҳ</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">ĩҳ</a>]";
    	       }
    	   }
    	   $("#pagechange").html(s_pagechange);
    	    for(var i=0;i<data.info.length;i++){
    	    	var htmlstr;
    	    	if(data.info[i].onJob==0){
    	    		htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
        				"<td align=\"center\">"+data.info[i].username+"</td>"+
        				"<td align=\"center\">"+data.info[i].realname+"</td>"+
        				"<td align=\"center\">"+docompany(data.info[i].company)+"</td>"+
        				"<td align=\"center\">"+data.info[i].dept+"</td>"+
        				"<td align=\"center\">"+data.info[i].mygroup+"</td>"+
        				"<td align=\"center\">��ְ</td>"+
        				"<td align=\"center\">��ְ"+
        				"|<a href=\"files/Transfer.jsp?salername='"+data.info[i].realname+"'&s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">����ת��</a></td>" ;
    	    	}else{
    	            htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
            			"<td align=\"center\">"+data.info[i].username+"</td>"+
            			"<td align=\"center\">"+data.info[i].realname+"</td>"+
            			"<td align=\"center\">"+docompany(data.info[i].company)+"</td>"+
            			"<td align=\"center\">"+data.info[i].dept+"</td>"+
            			"<td align=\"center\">"+data.info[i].mygroup+"</td>"+
            			"<td align=\"center\">��ְ</td>"+
            			"<td align=\"center\"><a href=\"javascript:void(0);\" onclick=\"fire("+data.info[i].id+","+c_page+")\">��ְ</a>|" +
            			"����ת��</td>";
    	          }
    	       $("#t_info").append(htmlstr);
    	    }
       	}
     else{
        alert("���ݼ���ʧ�ܣ�");
        }
       }
	});
}


function docompany(company){
	if(company=="sz"){
		return "�ٶ����ڷֹ�˾";
	}else if(company=="dg"){
		return "�ٶȶ�ݸ�ֹ�˾";
	}else if(company=="gz"){
		return "�ٶȹ��ݷֹ�˾";
	}
}


function fire(id,page){
	var bl=confirm("ȷ��Ҫ����Ա������ְ״̬��Ϊ��ְ��");
	if(bl){
		$.ajax({
			beforeSend:function(xh){
				 return true;
			},
	       type: "post",
	       url:'fire',
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
}

