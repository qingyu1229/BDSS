<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int u_id=Integer.valueOf(request.getParameter("u_id"));

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�һ�����</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		function nextstep(){
			var password=$("#newPWD").val();
			var password1=$("#newPWD1").val();
			if(password==""){
				$("#error1").html("����д����");
			}else if(password.length<6||password.length>20){
				$("#error1").html("���볤��6-20");
			}else if(!password.match("^[a-z0-9A-Z_]+$")){//�û���ֻ����Ӣ�������»������
				$("#error1").html("����ֻ����Ӣ�����ֺ��»������");
			}else if(password!=password1){
				$("#error1").html("���벻һ��");
			}else{
				$.ajax({
					type:"post",
					url:"ModifyPWD2",
					data:{
						u_id:'<%=u_id%>',
						newPWD:password
					},
				timeout:3000,
	         	cache: false,  
	         	async:false,
	         	error:function(msg){
	         		alert("error:"+msg);
	       		},
	       		success: function(data){
	       			if(data.result=="success"){
	       				window.location.href="Safe4.jsp";
	       			}
	       		  }
				});
			}
		}
	</script>
  </head>
<body  style="padding:0px; margin:0px ;">
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
   			<td colspan="3" align="center" height="50"  style="font-size: 14px;color: #0E69C7;">������ - ����������</td>
   		</tr>
   		<tr>
        <td height="35" class="login-text02">�����룺<br/></td>
        <td>
        	<input id="newPWD" type="password"/>
        </td>
        <td><font color='green' size="1">(6-20)Ӣ�ġ����֡��»���</font></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >ȷ�����룺<br/></td>
        <td><input id="newPWD1" type="password"/></td>
        <td><div id="error1"></div></td>
      </tr>
      	<tr>
        	<td height="35">&nbsp;</td>
        	<td>
        		<input id="bt_next" onclick="nextstep()" type="button" class="right-button01" value="��һ��" />
         	</td>
      	</tr>
   		</table>
    </td>
  </tr>
</table>
</body>
</html>
