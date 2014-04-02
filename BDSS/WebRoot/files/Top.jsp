<%@page import="com.baidu.values.Values"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int permission=0;
int id=0;
if(session.getAttribute("id")!=null){
	id=(Integer)session.getAttribute("id");
	permission=(Integer)session.getAttribute("permission");
	System.out.println("permission---"+permission);
}else{
	String url=basePath+"SessionTimeout.jsp";
	response.sendRedirect(url);
}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">
<title>百度华南客户资源信息管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

</head>
<script type="text/javascript">
	function getNeedNote(){
		if('0'!='<%=permission%>'){
			$("#pmd").html("欢迎使用使用华南客户资源信息管理系统！");
		}else{
			getCount();
			//setInterval(getCount,5000); 
		}
	}
	function getCount(){
		$.ajax({
			type:"post",
			url:"getNeedNote",
			data:{
		    	  u_id:<%=id%>
		      },
		     timeout:3000,
			 cache: false,  
			 async:false,
			 error:function(msg){
		  	 alert("页面初始化错误，错误信息:"+msg);
		     },
		     success:function(data){
		    	// alert(data);
		    	 if(data.result=="success"){
		    		 if(data.count>0){
		    			 var ss="<a style=\"color:#0099FF;text-decoration:none;\" href=\"files/NoNotedRecord.jsp\" target=\"mainFrame\">您今天有"+data.count+"条信息需要跟进！</a>";
		    			 $("#pmd").html(ss);
		    		 }else{
		    			 $("#pmd").html("欢迎使用使用华南客户资源信息管理系统！");
		    		 }
		    	 }
		     }
		});		
	}
</script>
<body onload="getNeedNote();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="59" background="images/top.gif"><table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1%"><img src="images/header.png" width="557" height="59" border="0" /></td>
        <td width="34%"><marquee id="pmd" width="300" style="margin-left: 60;font-size: 12px;" 
            direction=left scrollamount=6 onmouseover="this.stop()" onmouseout="this.start()">欢迎使用使用华南客户资源信息管理系统！</marquee></td>
        <td width="64%" align="right" style="font-size:12px;vertical-align:bottom;">&copy; 本系统由
         <a href="http://www.huanansj.com" style="color:#0099FF;text-decoration:none;" target="_blank">华南客户资源网</a>提供技术支持&copy;&nbsp;<%=Values.VERSION %> </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
