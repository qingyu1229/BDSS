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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/noNoteRecord.js"></script>
	<script type="text/javascript">
			function pageload(){
				getSalesinfos(<%=id%>,<%=permission%>,<%=c_page%>);
			}
	</script>
  </head>
  <body onload="pageload()">
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
               <th class="tablestyle_title" >��������Ŀͻ���Ϣ</th>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table id="t_info" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle">
                  
                       <td height="22" colspan="9" align="center" style="font-size:16px ;font-family: ����;">�ͻ���Ϣ��ϸ�б�</td>
                   
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">���</td>
                    <td align="center" width="14%">��˾����</td>
					<td align="center" width="4%">��ϵ��</td>
                    <td align="center" width="10%">��ϵ�绰</td>
                    <td align="center" width="4%">����</td>
					<td align="center" width="5%">¼��ʱ��</td>
					<td align="center" width="5%">�´θ���ʱ��</td>
					<td align="center" width="5%">����</td>
					<td align="center" width="10%">��������</td>
                  </tr>
            	</table>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
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
</body>
</html>