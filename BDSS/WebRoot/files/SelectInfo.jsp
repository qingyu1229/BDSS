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
	<script type="text/javascript" src="js/selectinfo.js"></script>
	<script type="text/javascript" src="js/loadStructure.js"></script>
	<script type="text/javascript">
			$(function(){
				$("#date").daterangepicker(); 
				$("#bt_selectinfo").click(function(){
					getSalesinfos(<%=id%>,<%=permission%>,0);
					return false;
				});
			 });
			function pageload(){
				loadstr(<%=id%>,<%=permission%>);
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
               <th class="tablestyle_title" >��ѯ�ͻ���Ϣ</th>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table id="t_info" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle">
                     <%if(permission==3){%>
                       <td height="22" colspan="9" align="center" style="font-size:16px ;font-family: ����;">�ͻ���Ϣ��ϸ�б�
                    	<div align="right"><a href="files/download.jsp"  style="font-size: 12px;">��������</a></div></td>
                     <%}else{%>
                       <td height="22" colspan="9" align="center" style="font-size:16px ;font-family: ����;">�ͻ���Ϣ��ϸ�б�</td>
                     <%} %>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">���</td>
                    <td align="center" width="14%">��˾����</td>
					<td align="center" width="4%">��ϵ��</td>
                    <td align="center" width="8%">��ϵ�绰</td>
                    <td align="center" width="4%">����</td>
					<td align="center" width="6%">¼��ʱ��</td>
					<td align="center" width="6%">�´θ���ʱ��</td>
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
<tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" >
          <form id="f_selectinfo" action="" method="post">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td align="right">��ѯ��¼��ʱ�䣺</td>
			  <td width="250">
				<input name="date" id="date" type="text" size="12" style="width: 180px"/>
				</td>
				<td align="right">��˾���ƣ�</td>
				<td><input name="companyname" id="companyname"  type="text" size="12" style="width: 180px"/>
					(<input type="radio" name="querytype" value="1" checked="checked"/>��ȷ
		             <input type="radio" name="querytype" value="0"/>ģ��)
				</td>
		    </tr>
		    <tr>
		    <td>&nbsp;</td>
		       <td align="right">��ϵ�绰��</td>
		       <td><input name="phone" id="phone" type="text" size="12" /></td>
		        <td align="right">��ҵ��</td>
		        <td><select id="industry" name="industry">
		        			<option value="0">==��ѡ��==</option>
		        	 		<option value="aqab">��ȫ����</option>
	   						<option value="bgwj">�칫�Ľ�</option>
	   						<option value="cp">��Ʊ</option>
	   						<option value="cryp">������Ʒ</option>
	   						<option value="dnyj">����Ӳ��</option>
					   		<option value="rjyx">�����Ϸ</option>
					   		<option value="dzdg">���ӵ繤</option>
					   		<option value="flfw">���ɷ���</option>
					   		<option value="fdc">���ز�</option>
					   		<option value="fzxm">��װЬñ</option>
					   		<option value="lpsp">��Ʒ��Ʒ</option>
					   		<option value="gbtx">�㲥ͨ��</option>
					   		<option value="ggjbz">��漰��װ</option>
					   		<option value="wlfu">�������</option>
					   		<option value="hgjcl">����������</option>
					   		<option value="jxsb">��е�豸</option>
					   		<option value="jzjzx">������װ��</option>
					   		<option value="jtys">��ͨ����</option>
					   		<option value="jypx">������ѵ</option>
					   		<option value="jnhb">���ܻ���</option>
					   		<option value="jrfw">���ڷ���</option>
					   		<option value="lsdx">��������</option>
					   		<option value="lyjpw">���μ�Ʊ��</option>
					   		<option value="nlmy">ũ������</option>
					   		<option value="swfw">�������</option>
					   		<option value="shfw">�������</option>
					   		<option value="spcy">ʳƷ����</option>
					   		 <option value="xxyl">��������</option>
					   		<option value="jydq">���õ���</option>
					   		<option value="tsyx">ͼ������</option>
					   		<option value="yljk">ҽ�ƽ���</option>
					   		<option value="zsjm">���̼���</option>
					   		<option value="hzp">��ױƷ</option>
					   		<option value="yyyp">��Ӥ��Ʒ</option>
					   		<option value="qt">����</option>
		        </select></td>
		    </tr>
		     <tr>
		    <td>&nbsp;</td>
		       <td align="right">��ϵ�ˣ�</td>
		       <td><input name="linkman" id="linkman" type="text" size="12" /></td>
		        <td align="right">����</td>
		        <td>
		        <select id="intention" name="intention">
		        	<option value="0">==��ѡ��==</option>
		        	<option value="A">A������</option>
                    <option value="B">B������</option>
                    <option value="C">C������</option>
                    <option value="D">D������</option>
		        </select></td>
		    </tr>
		    <%if(permission==3){ %>
		    	<tr><td></td>
					<td align="right">���ۣ�</td>	
					<td><select id="dept" onchange="change_dept(<%=id%>,<%=permission%>)"> <!-- �� -->
						<option value="0">==����==</option>
					</select>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- С�� -->
						<option value="0">==����==</option>
					</select>
					<select id="saler" > <!-- ���� -->
						<option value="0">==����==</option>
					</select>
					</td>	    	
		    	</tr>
		    <%}else if(permission==2){%>
		    	<tr>
		    		<td></td>
					<td align="right">���ۣ�</td>	
					<td>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- С�� -->
						<option value="0">==����==</option>
					</select>
					<select id="saler" > <!-- ���� -->
						<option value="0">==����==</option>
					</select>
					</td>	    	
		    	</tr>
		    <%}else if(permission==1){ %>
		    	<tr>
		    		<td></td>
					<td align="right">���ۣ�</td>	
					<td>
					<select id="saler"> <!-- ���� -->
						<option value="0">==����==</option>
					</select>
					</td>	    	
		    	</tr>
		    <%} %>
		     <tr>
		    <td>&nbsp;</td>
		       <td align="right">����ԭ��</td>
		       <td> <input type="radio" name="pxyz" value="0" checked="checked"/>������ʱ������	<br>
		       		<input type="radio" name="pxyz" value="1" />���´θ���ʱ������
		       </td>
		       <td><input  type="submit" id="bt_selectinfo" class="right-button02" value="�� ѯ" /></td>
		    </tr>
          </table>
          </form>
          </td>
        </tr>
    </table></td></tr>
</table>
</body>
</html>
