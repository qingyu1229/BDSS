<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
int c_page=0;
if(request.getParameter("page")!=null){
	c_page= Integer.valueOf(request.getParameter("page"));
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�ٶȻ��Ͽͻ���Դ��Ϣ����ϵͳ</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
    <link href="css/Tooltip.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
	<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
	<script type="text/javascript" src="js/selectacpinfo.js"></script>
  </head>
  <SCRIPT language=JavaScript>
	$(function(){
		$("#date").daterangepicker(); 
	 }); 
	function pageload(){
		getACPinfos(<%=id%>,<%=permission%>,<%=c_page%>);
	}
</SCRIPT>
<body onload="pageload()">
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td align="right">��ѯ��¼��ʱ�䣺</td>
			  <td width="250">
				<input name="textfield" id="date" type="text" size="12" style="width: 200px"/>
				</td>
				<td align="right">��˾���ƣ�</td><td><input id="companyname" style="width: 200px" type="text" size="12" />
					(<input type="radio" name="querytype" value="1" checked="checked"/>��ȷ
		             <input type="radio" name="querytype" value="0"/>ģ��)
		            &nbsp; &nbsp; 
		            <input id="bt_selectacpinfo" type="button" onclick="getACPinfos(<%=id%>,<%=permission%>,<%=c_page%>)" class="right-button02" value="�� ѯ" />
				</td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <th class="tablestyle_title">��ѯ�ɵ���¼</th>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table id="t_info" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="8" align="center" style="font-size:16px;font-family: ����;">�ѳɵ��ͻ���Ϣ</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">���</td>
                    <td width="16%" align="center">��˾����</td>
					<td width="8%" align="center">��ϵ��</td>
                    <td width="10%" align="center">��ϵ�绰</td>
					<td width="8%" align="center">¼��ʱ��</td>
					<td width="10%" align="center">����</td>
					<td width="7%" align="center">��������</td>
                  </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">�� <span id="t_count" class="right-text09">1</span> ����¼ | �� <span id="c_page" class="right-text09">1/1</span> ҳ</td>
                <td width="46%" align="right"><div id="pagechange">[<a href="#" class="right-font08">��ҳ</a>| 
                								<a href="#" class="right-font08">��һҳ</a>| 
                								<a href="#" class="right-font08">��һҳ</a>| 
                								<a href="#" class="right-font08">ĩҳ</a>]ת����</div>
                							</td>
                <td width="4%">
                	<table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="8%"><input type="text" class="right-textfield03" size="1" /></td>
                      <td width="80%"><input type="submit" class="right-button06" value=""/></td>
                    </tr>
                   </table>
                </td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</td></tr>
</table>
</form>
  </body>
</html>
