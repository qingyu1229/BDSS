<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
  <link href="css/css.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
  <script type="text/javascript">
  	function checkLogin(){
	  var username=$("#username").val();
	  var password=$("#password").val();
	  var t_image=$("#icode").val();
	  
	  setErrorInfo("error_username","");
	  setErrorInfo("error_password","");
	  setErrorInfo("error_image","");
	  
	  if(username==""){
		  setErrorInfo("error_username","请填写用户名");
		  return false;
	  }
	     //if(username.length<6||username.length>20){
		 //  setErrorInfo("error_username","请填写正确的用户名");
		//  return false;
	    //  }
	  if(password==""){
		  setErrorInfo("error_password","请填写密码");
		  return false;
	  }
	  if(t_image==""){
		  setErrorInfo("error_image","请填写验证码！");
		  return false;
	  }
	  return true;
  }
  function setErrorInfo(e_id,info){
		var d=document.getElementById(e_id);
		d.innerHTML=info;
	}
  function changeImage() {
		document.getElementById("image").src = "image.jsp?" + Math.random();
	}
</script>
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
    <form action="login!login" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="35" class="login-text02">用户名：<br /></td>
        <td width="40%"><input id="username" name="username" type="text" size="30" /></td>
        <td width="35%"><div ><font color='red' size="1" id="error_username"></font></div></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">密　码：<br/></td>
        <td><input id="password" name="password" type="password" size="30"/></td>
         <td><div><font color='red' size="1" id="error_password"><s:property value="errors.loginfail[0]"/></font></div></td>
      </tr>
       <tr>
        <td width="25%" height="35" class="login-text02">验证码：<br/></td>
        <td width="40%"><input id="icode" name="icode" style="width: 80px" type="text" size="30" />
        			<img id="image" onclick="changeImage();" border=0 src="image.jsp" />
        			<a href="javascript:void(0)"  class="login-text03"
							onclick="changeImage();">换一张</a>
					<div><font color='red' size="1" id="error_image"><s:property value="errors.imagefail[0]"/></font></div>
        			</td>
        <td width="35%"><div ><font color='red' size="1" id="error_image"></font></div></td>
      </tr>
      <tr>
      	<td>&nbsp;</td>
      	<td style="font-size: 13px;color: #7F9DB9; text-align: left;">还没有账号？<a href="Register.jsp" class="login-text03">新用户注册</a></td>
      </tr>
  		<tr>
        <td height="35">&nbsp;</td>
        <td>
            <input type="submit" class="right-button01" value="确认登陆" onclick="return checkLogin();"/>
            <input  type="reset" class="right-button02" value="重 置" />
            <a href="Safe.jsp" class="login-text03">忘记密码？</a>
        </td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>
