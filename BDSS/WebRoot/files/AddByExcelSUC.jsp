<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String re=session.getAttribute("result").toString();


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<base href="<%=basePath%>">
		<title>百度华南客户资源信息管理系统</title>
		<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
		<link href="css/Tooltip.css" type="text/css" rel="stylesheet"/>
		<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
		<link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		
	</head>
	
<body >
<div class="MainDiv">

<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
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
      <th class="tablestyle_title" >批量添加客户信息</th>
  </tr>
		<TR style="font-size: 14px; margin: 0 auto">
		<%if("success".equals(re)) {%>
			<td>信息添加成功！</td>
			<%}else{ %>
			<td><%=re %></td>
			<%} %>
		</TR>
		</TABLE>	
</div>
</body>
</html>
