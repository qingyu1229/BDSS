<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>找回密码</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	
  </head>
<body style="padding:0px; margin:0px ;">
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
   		<table>
   		<tr>
   			<td colspan="3" align="center" height="50"  style="font-size: 14px;color: #0E69C7;">第四步 - 完成</td>
   		</tr>
   		<tr>
        <td height="35" class="login-text02">恭喜！您已成功修改密码！<br/></td>
        <td>
        	<a href="Login.jsp" class="login-text03">用户登录</a>
        </td>
        <td></td>
      </tr>
      
      	<tr>
        	<td height="35">&nbsp;</td>
        	<td>
        		<input id="bt_next" onclick="nextstep()" type="button" class="right-button01" value="下一步" />
         	</td>
      	</tr>
   		</table>
    </td>
  </tr>
</table>
</body>
</html>
