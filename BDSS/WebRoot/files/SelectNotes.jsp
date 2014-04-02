<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String s_id="";
String c_page="";
s_id=request.getParameter("s_id");
c_page=request.getParameter("page");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Notes</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
  </head>
   <script type="text/javascript">
	var s_id;
  	function load(id,page){
  		s_id=id;
  		$.ajax({
  		      type: "post",
  		      url:"getSalesRecordById",
  		      data:{
  		    	  s_id:id
  		      },
  		     timeout:3000,
  			 cache: false,  
  			 async:false,
  			 error:function(msg){
  		  	 alert("页面初始化错误，错误信息:"+msg);
  		     },
  		     success:function(data){
  		    	  if(data.result=="success"){
  		    		$("#companyname").html(data.info.companyname);
  		    		$("#linkman").html(data.info.linkman);
  		    		$("#address").html(data.info.address);
  		    		$("#phone").html(data.info.phone);
  		    		$("#date").html(data.info.date);
  		    		$("#intention").html(data.info.intention);
  		    		$("#lastnotedate").html(data.info.nextnotedate);
  		    		$("#website").html(data.info.website);
  		    		$("#website").attr("href",data.info.website);
  		    		getNotes();
  		    	  } 		    	 
  		      }  			
  		});
  	}
  	
  	function getNotes(){
  		$.ajax({
  			 type: "post",
 		      url:"getNotes",
 		      data:{
 		    	  s_id:s_id
 		      },
 		     timeout:3000,
 			 cache: false,  
 			 async:false,
 			 error:function(msg){
 		  	 alert("页面初始化错误，错误信息:"+msg);
 		     },
 		     success:function(data){
 		    	// alert(data.result);
 		    	 if(data.result=="success"){
 		    		 for(var i=0;i<data.info.length;i++){
 		    			 var newRow="<tr><td  width=\"15%\" height=\"60\" "+
 		    			 "style=\"font: bold;\" align=\"right\" valign=\"top\" bgcolor=\"#FFFFFF\">第"+(i+1)+"次跟进:"+
                    	"<br>时间："+data.info[i].date+"</td>"+
                    	"<td  colspan=\"3\"  align=\"left\" bgcolor=\"#FFFFFF\">"+data.info[i].content+"</td></tr>";
 		    			$("#table3 tr:last").after(newRow);
 		    		 }
 		    	 }else if(data.result=="nodata"){
 		    		 //alert("抱歉，查询跟进信息失败！");
 		    		 var newRow="<tr><td colspan=\"4\" width=\"100%\" "+
		    			 "style=\"font: bold;\" align=\"right\"  "+
		    			 "bgcolor=\"#FFFFFF\">此条客户信息尚无跟进信息</td></tr>";
		    			$("#table3 tr:last").after(newRow);
 		    	 }else {
 		    		alert("抱歉，查询跟进信息失败！");
 		    	 }
 		     }
  		});
  	}
  	
  	function backpage(){
  		//clearInterval(timer1);
  		var f=parent.document.getElementById("mainFrame");
  		var randomnumber=Math.floor(Math.random()*100000);
  		f.src="<%=basePath%>/files/SelectInfo.jsp?randomnumber="+randomnumber+"&page="+<%=c_page%>;
  	}
</script>
  <body onload="load(<%=s_id%>,<%=c_page%>);">
  <table id="subtree1" style="DISPLAY:" width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			 
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  		  <tr>
  		  	<td>  <input type="button" style="margin-left: 20px"  value="返回" class="button" onclick="backpage();"/></td>
  		  </tr>
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42"><table id="table3" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="4" align="center" bgcolor="#EEEEEE" class="tablestyle_title"> 
					              跟进信息 </td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司名称:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="companyname"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系人:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="linkman"></div></td>
                    </tr>
					<tr>
				   <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="phone"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司地址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="address"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">录入时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="date"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">上次跟进时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="lastnotedate"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">网址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="website" ></div></td>
                   	<td width="15%" height="20" align="right" bgcolor="#FFFFFF"></td>
                   	<td width="35%" align="left" bgcolor="#FFFFFF"></td>
                    </tr>
                </table>
            </table></td>
        </tr>
      </table></td>
     </tr>
</table>
</td>
</tr>
</table>
	
  </body>
</html>
