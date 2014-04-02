<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
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
    <form action="UserAction2!addUser" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="35" class="login-text02">用户名：<br /></td>
        <td width="40%"><input id="username" name="username" type="text" size="30"  onblur="validate_username()"/></td>
        <td width="35%"><div id="error_username"><font color='green' size="1">(6-20)英文、数字、下划线</font></div></td>
      </tr>
       <tr>
        <td width="25%" height="35" class="login-text02">真实姓名：<br/></td>
        <td width="40%"><input id="realname" name="realname" type="text" size="30" onblur="validate_realname()"/></td>
        <td width="35%"><div id="error_realname"><font color='green' size="1">请填写真实的中文名</font></div></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">密　码：<br/></td>
        <td><input id="password" name="password" type="password" size="30" onblur="validate_password()"/></td>
           <td><div id="error_password"><font color='green' size="1">(6-20)英文、数字、下划线</font></div></td>
      </tr>
       <tr>
        <td height="35" class="login-text02">确认密码：<br/></td>
        <td><input id="password1" type="password" size="30"  onblur="validate_password1()"/></td>
           <td><div id="error_password1"><font color='green' size="1">请确认密码</font></div></td>
      </tr>
       <tr>
        <td height="35" class="login-text02">分公司：<br/></td>
        <td><select id="company" name="company" onchange="company_change();" onblur="validate_company()">
        		<option value="0">==请选择==</option>
        		<option value="dg">百度东莞分公司</option>
        		<option value="sz">百度深圳分公司</option>
        		<option value="gz">百度广州分公司</option>
            </select></td>
               <td><div id="error_company"></div></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >大部：<br/></td>
        <td><select id="dept" name="dept" onchange="dept_change();" onblur="validate_dept()">
        		<option value="0">==请选择==</option>
            </select></td>
               <td><div id="error_dept"></div></td>
      </tr>
         <tr>
        <td height="35" class="login-text02">小部：<br/></td>
        <td><select id="group" name="group" onblur="validate_group()" onchange="change_group();">
        		<option value="0">==请选择==</option>
            </select></td>
               <td><div id="error_group"></div></td>
      </tr>
      <tr>
      	<td>&nbsp;</td>
      	<td style="font-size: 13px;color: #7F9DB9; text-align: left;">已经有账号？<a href="Login.jsp" class="login-text03">用户登录</a></td>
      </tr>
  		<tr>
        	<td height="35">&nbsp;</td>
        	<td><input id="register"  type="submit" class="right-button01" value="注册" disabled="disabled"/>
         	 	<input name="reset" type="reset" class="right-button02" value="重 置" /></td>
      	</tr>
    </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>
