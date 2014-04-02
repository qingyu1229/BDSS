var u_id;
var per;
function getSalesinfos(id,permission,pagecount){
	$("#bt_selectinfo").value="查询中";
	$("#bt_selectinfo").disable=true;
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
       url:'SalesRecordAction2',
       data:{
		 companyname:$('#companyname').val()
   		,date:$('#date').val()
   		,phone:$('#phone').val()
   		,industry:$('#industry').val()
   		,linkman:$('#linkman').val()
   		,intention:$('#intention').val()
   		,pxyz:$('input[name="pxyz"]:checked').val()
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
    	   $("#bt_selectinfo").value="查询";
    	   $("#bt_selectinfo").disable=false;
       },
       success: function(data){
    	   if(data.result=="success"){
    	   //$("form:first").trigger("reset");
    	   $("#t_info tr:gt(1)").remove();//删除去了行数大于2的其他行
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
    		   s_pagechange="[首页|上一页|下一页|末页]";
    	   }else{
    	   if(c_page==0){
    		   s_pagechange="[首页|上一页|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"下一页</a>|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(t_page-1))+")\" class=\"right-font08\">末页</a>]";
    	   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+0+")\" class=\"right-font08\">首页</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"上一页</a>|下一页|末页]";
    	   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+0+")\" class=\"right-font08\">首页</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  				"上一页</a>|<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">下一页</a>|" +
  				"<a href=\"javascript:void(0);\" onclick=\"getSalesinfos("+u_id+","+per+","+(parseInt(t_page-1))+")\" class=\"right-font08\">末页</a>]";
    	       }
    	   }
    	   $("#pagechange").html(s_pagechange);
    	    for(var i=0;i<data.info.length;i++){
    	    	var htmlstr="";
    	    	if(per==0){
    	    		 htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
         			"<td><a target=\"_Blank\" href=\"http://www.baidu.com/s?wd="+data.info[i].companyname+"\">"+data.info[i].companyname+"</a></td>"+
         			"<td align=\"center\">"+data.info[i].linkman+"</td>"+
         			"<td align=\"center\">"+data.info[i].phone+"</td>"+
         			"<td align=\"center\">"+data.info[i].intention+"</td>"+
         			"<td align=\"center\">"+data.info[i].date+"</td>"+
         			"<td align=\"center\">"+data.info[i].nextnotedate+"</td>"+
         			"<td align=\"center\">"+data.info[i].dept+data.info[i]._group+data.info[i].realname+"</td>"+
         			"<td align=\"center\">" +
         			"<a href=\"files/DetailInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">详细|</a>" +
         			"<a href=\"files/Note.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">跟进|</a>"+
         			"<a href=\"files/ModifyInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">修改</a>|" +
         			"<a href=\"files/SelectNotes.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">查看跟进</a></td></tr>";
    	    	}else if(per==1){
    	    		 htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
         			"<td><a target=\"_Blank\" href=\"http://www.baidu.com/s?wd="+data.info[i].companyname+"\">"+data.info[i].companyname+"</a></td>"+
         			"<td align=\"center\">"+data.info[i].linkman+"</td>"+
         			"<td align=\"center\">"+data.info[i].phone+"</td>"+
         			"<td align=\"center\">"+data.info[i].intention+"</td>"+
         			"<td align=\"center\">"+data.info[i].date+"</td>"+
         			"<td align=\"center\">"+data.info[i].nextnotedate+"</td>"+
         			"<td align=\"center\">"+data.info[i].dept+data.info[i]._group+data.info[i].realname+"</td>"+
         			"<td align=\"center\">" +
         			"<a href=\"files/DetailInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">详细|</a>" +
         			"<a href=\"files/Note.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">跟进|</a>"+
         			"<a href=\"files/SelectNotes.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">查看跟进</a></td></tr>";
    	    	}else {
    	    		 htmlstr="<tr bgcolor=\"#FFFFFF\"><td align=\"center\" height=\"20\">"+(i+1)+"</td>"+
          			"<td><a target=\"_Blank\" href=\"http://www.baidu.com/s?wd="+data.info[i].companyname+"\">"+data.info[i].companyname+"</a></td>"+
          			"<td align=\"center\">"+data.info[i].linkman+"</td>"+
          			"<td align=\"center\">"+data.info[i].phone+"</td>"+
          			"<td align=\"center\">"+data.info[i].intention+"</td>"+
          			"<td align=\"center\">"+data.info[i].date+"</td>"+
          			"<td align=\"center\">"+data.info[i].nextnotedate+"</td>"+
          			"<td align=\"center\">"+data.info[i].dept+data.info[i]._group+data.info[i].realname+"</td>"+
          			"<td align=\"center\">" +
          			"<a href=\"files/DetailInfo.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">详细|</a>" +
          			"<a href=\"files/SelectNotes.jsp?s_id="+data.info[i].id+"&page="+c_page+"\" target=\"mainFrame\">查看跟进</a></td></tr>";
    	    	}
    	    $("#t_info").append(htmlstr);
    	    }
    	    $("#bt_selectinfo").value="查询";
    		$("#bt_selectinfo").disable=false;
       	}
     else{
        alert("数据加载失败！");
        }
   }
	});
}
