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
    		   s_pagechange="[首页|上一页|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">" +
    		   			"下一页</a>|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">末页</a>]";
    	   }else if((c_page+1)==t_page){
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">首页</a>|" +
    		   			"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
    		   			"上一页</a>|下一页|末页]";
    	   }else {
    		   s_pagechange="[<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+0+")\" class=\"right-font08\">首页</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)-1)+")\" class=\"right-font08\">" +
  						"上一页</a>|<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+(parseInt(c_page)+1)+")\" class=\"right-font08\">下一页</a>|" +
  						"<a href=\"javascript:void(0);\" onclick=\"getNoActivationEMPInfos("+u_id+","+per+","+t_page+")\" class=\"right-font08\">末页</a>]";
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
            			"<a href=\"javascript:void(0);\" onclick=\"activation("+data.info[i].id+","+c_page+")\">激活</a>" ;
    	       $("#t_info").append(htmlstr);
    	    }
       	}else if(data.result=="nodata"){
       	 $("#t_info tr:gt(1)").remove();//删除去了行数大于2的其他行
         $("#t_count").html("0");
         $("#c_page").html("1/1");
         $("#pagechange").html("[首页|上一页|下一页|末页]");
       	}
     else{
        alert("数据加载失败！");
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
    		   alert("激活成功！");
    		   getNoActivationEMPInfos(id,per,page);
    	   }else{
    		   alert("激活失败！");
    	   }
       }
	});
}
