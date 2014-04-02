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
    <title>找回密码</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
  	<script type="text/javascript" src="js/user.js"></script>
  </head>
  <script type="text/javascript">
  	function Safe_step1(){
		var company=$("#company").val();  		
		var dept=$("#dept").val();  		
		var group=$("#group").val();  		
		var username=$("#username").val();  		
		
		if(company==0||dept==0||group==0||username==""){
			$("#error_username").html("请填写完整的验证信息！");
		}else{
			$.ajax({
				type:"post",
				url:"ValidateInfo",
				data:{
					company:company,
					dept:dept,
					group:group,
					username:username
					},
			 	timeout:3000,
	         	cache: false,  
	         	async:false,
	         	dataType:"json", 
	         	error:function(msg){
	         		alert(msg);
	    	    	//alert("error:"+msg);
	       		},
	       		success: function(data){
					if(data.result=="usererror"){
						$("#company").val(0);  		
						$("#dept").val(0);  
						$("#group").val(0);
						$("#username").val(""); 
						alert("抱歉，没有这个用户！");
					}else if(data.result=="noquest"){
						$("#company").val(0);  		
						$("#dept").val(0);  
						$("#group").val(0);  
						$("#username").val(""); 
						alert("您没有设置密保问题，不能直接修改密码！请联系系统管理员协助修改！");
					}else{
						 window.location.href="Safe2.jsp?questions="+data.info+"&u_id="+data.u_id;	
					}
	       		}
			});
		}
  	}
  </script>
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
   		<table>
   		<tr>
   			<td colspan="3" align="center" height="50"  style="font-size: 14px;color: #0E69C7;">第一步 - 验证用户信息</td>
   		</tr>
   		<tr>
        <td height="35" class="login-text02">分公司：<br/></td>
        <td>
        	<select id="company" name="company" onchange="company_change();" >
        		<option value="0">==请选择==</option>
        		<option value="dg">百度东莞分公司</option>
        		<option value="sz">百度深圳分公司</option>
        		<option value="gz">百度广州分公司</option>
         	</select>
        </td>
        <td><div id="error_company"></div></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >大部：<br/></td>
        <td><select id="dept" name="dept" onchange="dept_change();" >
        		<option value="0">==请选择==</option>
            </select></td>
               <td><div id="error_dept"></div></td>
      </tr>
         <tr>
        <td height="35" class="login-text02">小部：<br/></td>
        <td><select id="group" name="group" >
        		<option value="0">==请选择==</option>
            </select></td>
               <td><div id="error_group"></div></td>
      </tr>
   	  <tr>
        <td width="25%" height="35" class="login-text02">用户名：<br /></td>
        <td width="40%"><input id="username" name="username" type="text" size="30" /></td>
        <td width="35%"><font color='red' size="1" id="error_username"></font></td>
      </tr>
      	<tr>
        	<td height="35">&nbsp;</td>
        	<td>
        		<input id="bt_next" onclick="Safe_step1()" type="button" class="right-button01" value="下一步" />
         	</td>
      	</tr>
   		</table>
    </td>
  </tr>
</table>
</body>
</html>
