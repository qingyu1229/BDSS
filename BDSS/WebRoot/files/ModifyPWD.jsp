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
    <title>修改密码</title>
     <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/modifyPWD.js"></script>
  </head>
  <body onload="load_page(<%=id%>);">
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
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 修改用户密码 </td>
                    </tr>
					<tr>
				    <td width="50%" height="20" align="right" bgcolor="#FFFFFF" >原密码：</td>
                    <td width="50%" bgcolor="#FFFFFF">
							<input type="password" id="oldPWD"/>
						</td>
                    </tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" >新密码：</td>
                    <td width="85%" bgcolor="#FFFFFF"><input type="password" id="newPWD"/></td>
                    </tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">确认新密码：</td>
                    <td width="85%" bgcolor="#FFFFFF"><input type="password" id="q_newPWD"/></td>
                    </tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" ></td>
                    <td width="85%" bgcolor="#FFFFFF"><input id="bt_modify" type="button" class="right-button02" value="提  交" /> </td>
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
    
  </body>
</html>
