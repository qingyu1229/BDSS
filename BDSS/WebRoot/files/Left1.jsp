<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String realname=null;
if(session.getAttribute("realname")!=null){
	realname=(String) session.getAttribute("realname");
}else{
	String url=basePath+"SessionTimeout.jsp";
	response.sendRedirect(url);
}

//int permission=(Integer)(session.getAttribute("permission"));
//int id=(Integer)(session.getAttribute("id"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ٶȻ��Ͽͻ���Դ��Ϣ����ϵͳ</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/left.gif);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="../images/ico05.gif";//ͼƬico04Ϊ��ɫ��������
	for(var i=1;i<30;i++)
	{
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="../images/ico06.gif";}//ͼƬico06Ϊ��ɫ��������
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	//alert(imgobj);
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="../images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="../images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="../images/ico04.gif";
	}
}

</SCRIPT>
<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="../images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="../images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">���ã�<span class="left-font02"><%=realname %></span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="../Login.jsp" target="_top" class="left-font01">�˳�</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		<!--  ҵ�����Ŀ�ʼ    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img0" id="img0" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
						<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('0');" >ҵ������</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree0" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu0" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="SelectInfo.jsp" target="mainFrame" class="left-font03" onClick="tupian('0');">��ѯ�ͻ���Ϣ</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu1" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="SelectACPInfo.jsp" target="mainFrame" class="left-font03" onClick="tupian('1');">��ѯ�ɵ���¼</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21"><img id="xiaotu2" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="SelectNote.jsp" target="mainFrame" class="left-font03" onClick="tupian('2');">��ѯ������Ϣ</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu3" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="Tongji.jsp" target="mainFrame" class="left-font03" onClick="tupian('3');">ҵ��ͳ��</a></td>
				</tr>
      	</table>
		<!--  ҵ�����Ľ���    -->
				
		<!--  Ա���˻�����ʼ    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img1" id="img1" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
						<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');" >Ա���˻�����</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu7" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="Jihuo.jsp" target="mainFrame" class="left-font03" onClick="tupian('7');">����Ա���˻�</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu8" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="EmpInfo.jsp" target="mainFrame" class="left-font03" onClick="tupian('8');">Ա���˻�����</a></td>
				</tr>
      	</table>
		<!--  Ա���˻��������    -->
			
		<!--  �˻����Ŀ�ʼ    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img2" id="img2" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
						<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('2');" >�˻�����</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree2" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu4" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="PWDSafe.jsp" target="mainFrame" class="left-font03" onClick="tupian('4');">�˻���ȫ</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu5" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="ModifyPWD.jsp" target="mainFrame" class="left-font03" onClick="tupian('5');">�޸�����</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu6" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="UserInfo.jsp" target="mainFrame" class="left-font03" onClick="tupian('6');">�˻���Ϣ</a></td>
				</tr>
      		</table>
		<!--  �˻����Ľ���    -->
	  </TD>
  </tr>
</table>
</body>
</html>
