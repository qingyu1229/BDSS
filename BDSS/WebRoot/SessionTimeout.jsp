<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Session过期</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<script language="JavaScript">
		if(window != top)
		top.location.href = location.href; 
	</script>
  </head>
  <link href="css/css.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
  
<body style="padding:0px; margin:0px ;" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><img src="images/mytop_3.png" width="776" height="147" /></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="images/ico13.png" width="490" height="250" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
        </table></td>
        <td><img src="images/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      	<tr>
      		<td><font color="red" >由于您长时间未操作，保存有您账户信息Session已过期，请重新登录！</font></td>
      	</tr>
      	<tr>
      		<td><a href="Login.jsp" class="login-text03">用户登录</a></td>
      	</tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>
