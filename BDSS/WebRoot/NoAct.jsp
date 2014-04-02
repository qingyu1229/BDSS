<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>注册成功</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <link href="css/css.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
  <script type="text/javascript" src="js/user.js"></script>
  <script type="text/javascript" src="js/register.js"></script>
  <body style="padding:0px; margin:0px ;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><img src="images/mytop_3.png" width="776" height="147" /></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
  		<td style="font-size: 16px;color: #7F9DB9; text-align: center;">请提醒您的上级经理对您的账号进行激活，
  		<font style="color: red;font-weight: bold;">激活后的账号</font>方能成功登陆！</td>
  </tr>
  <tr height="100">
  	<td style="font-size: 16px;color: #7F9DB9; text-align: center;"><a href="Login.jsp" class="login-text03">用户登录</a></td>
  </tr>
</table>
</body>
</html>
