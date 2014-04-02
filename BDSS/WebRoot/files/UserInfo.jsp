<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int id=0;
if(session.getAttribute("id")!=null){
	id=(Integer)session.getAttribute("id");
}else{
	String url=basePath+"SessionTimeout.jsp";
	response.sendRedirect(url);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>账户信息</title>
     <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/userInfo.js"></script>
  </head>
  <body onload="getUserInfo(<%=id%>);">
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

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
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> 
					 账户信息 </td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">用户名:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF"><div id="username"></div></td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">真实姓名:</td>
                    <td bgcolor="#FFFFFF"><div id="realname"></div></td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">所属分公司:</td>
                    <td bgcolor="#FFFFFF"><div id="company"></div></td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">所属部门:</td>
                    <td bgcolor="#FFFFFF"><div id="dept"></div></td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">在职状态:</td>
                    <td bgcolor="#FFFFFF"><div id="onjob"></div></td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">账号级别:</td>
                    <td bgcolor="#FFFFFF"><div id="permission"></div></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</td></tr>

</table>
</form>
    
  </body>
</html>
