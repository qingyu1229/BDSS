<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int permission=0;
int id=0;
if(session.getAttribute("id")!=null){
	id=(Integer)session.getAttribute("id");
	permission=(Integer)session.getAttribute("permission");
}else{
	String url=basePath+"SessionTimeout.jsp";
	response.sendRedirect(url);
}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�˻���ȫ</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/PWDSafe.js"></script>
  </head>
  <body onload="pwdsafe(<%=id%>);">
<form  id="fom" method="post" action="">
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
					 �˻���ȫ </td>
                    </tr>
                  <tr>
                    <td width="85%" colspan="2" align="left" bgcolor="#FFFFFF">Ϊ��ȷ�������˻���ȫ�������һ����룬�뼰ʱ�����ܱ����⣡</td>
                  </tr>
					<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" rowspan="2">����һ</td>
                    <td width="85%" bgcolor="#FFFFFF">
							<select id="wenti1" class="list">
								<option value="q1">���Ĺ����ǣ�</option>
								<option value="q2">�������֤���ǣ�</option>
								<option value="q3">���������ǣ�</option>
							</select>
						</td>
                    </tr>
                	<tr>
                	   <td bgcolor="#FFFFFF"><input type="text" id="daanyi"/></td>
                	</tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" rowspan="2">�����</td>
                    <td width="85%" bgcolor="#FFFFFF"><select id="wenti2" class="list">
								<option value="q4">�����׵������ǣ�</option>
								<option value="q5">��ĸ�׵������ǣ�</option>
								<option value="q6">�����˵������ǣ�</option>
							</select></td>
                    </tr>
                	<tr>
                	   <td bgcolor="#FFFFFF"><input type="text" id="daaner"/></td>
                	</tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" rowspan="2">������</td>
                    <td width="85%" bgcolor="#FFFFFF"><select id="wenti3" class="list">
								<option value="q7">����ϲ���ĵ�Ӱ�ǣ�</option>
								<option value="q8">����ϲ���Ķ����ǣ�</option>
								<option value="q9">����ϲ������ɫ�ǣ�</option>
							</select></td>
                    </tr>
                	<tr>
                	   <td bgcolor="#FFFFFF"><input type="text" id="daansan"/></td>
                	</tr>
                	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF" ></td>
                    <td width="85%" bgcolor="#FFFFFF"><input id="bt_safe" type="button" class="right-button02" value="�� ��"/></td>
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
