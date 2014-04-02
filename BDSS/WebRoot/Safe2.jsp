<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String questions=request.getParameter("questions");
int u_id=Integer.valueOf(request.getParameter("u_id"));
String[] s=questions.split(",");
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
	<script type="text/javascript">
	    var q1;
	    var q2;
	    var q3;
	    var id;
		function setQestions(){
			q1='<%=s[0]%>';
			q2='<%=s[1]%>';
			q3='<%=s[2]%>';
			id='<%=u_id%>';
			
			getQuestion('<%=s[0]%>',"question1");
			getQuestion('<%=s[1]%>',"question2");
			getQuestion('<%=s[2]%>',"question3");
		}
		function getQuestion(s,questionid){
			var result="";
			if(s=="q1"){
				result="您的工号是？";
			}else if(s=="q2"){
				result="您的身份证号是？";
			}
			else if(s=="q3"){
				result="您的生日是？";
			}
			else if(s=="q4"){
				result="您父亲的姓名是？";
			}
			else if(s=="q5"){
				result="您母亲的姓名是？";
			}
			else if(s=="q6"){
				result="您爱人的姓名是？";
			}
			else if(s=="q7"){
				result="您最喜欢的电影是？";
			}
			else if(s=="q8"){
				result="您最喜欢的动物是？";
			}
			else if(s=="q9"){
				result="您最喜欢的颜色是？";
			}
			$("#"+questionid).append(result);
		}
		
		function nextstep(){
			var answer1=$("#answer1").val();
			var answer2=$("#answer2").val();
			var answer3=$("#answer3").val();
			if(answer1==""||answer2==""||answer3==""){
				alert("请将信息填写完整！");				
			}else{
				$.ajax({
					type:"post",
					url:"checkanswer",
					data:{
						da1:answer1,
						da2:answer2,
						da3:answer3,
						wt1:q1,
						wt2:q2,
						wt3:q3,
						
						u_id:id
					},
				timeout:3000,
	         	cache: false,  
	         	async:false,
	         	error:function(msg){
	         		alert("error:"+msg);
	       		},
	       		success: function(data){
	       			if(data.result=="success"){
	       				window.location.href="Safe3.jsp?u_id="+data.u_id;
	       			}
	       		  }
				});
			}
		}
	</script>
  </head>
  
<body onload="setQestions();" style="padding:0px; margin:0px ;">
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
   			<td colspan="3" align="center" height="50"  style="font-size: 14px;color: #0E69C7;">第二步 - 验证密保问题</td>
   		</tr>
   		<tr>
        <td height="35" class="login-text02">问题一：<br/></td>
        <td>
        	<span class="login-text02" style="font-weight: bold;" id="question1"></span>
        </td>
        <td></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >答案一：<br/></td>
        <td><input id="answer1"/></td>
        <td><div id="error1"></div></td>
      </tr>
       	<tr>
        <td height="35" class="login-text02">问题二：<br/></td>
        <td>
        	<span class="login-text02" style="font-weight: bold;" id="question2"></span>
        </td>
        <td></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >答案二：<br/></td>
        <td><input id="answer2"/></td>
        <td><div id="error2"></div></td>
      </tr>
      	<tr>
        <td height="35" class="login-text02">问题三：<br/></td>
        <td>
        	<span class="login-text02" style="font-weight: bold;" id="question3"></span>
        </td>
        <td></td>
      </tr>
       <tr>
        <td height="35" class="login-text02" >答案三：<br/></td>
        <td><input id="answer3"/></td>
        <td><div id="error3"></div></td>
      </tr>
      	<tr>
        	<td height="35">&nbsp;</td>
        	<td>
        		<input id="bt_next" onclick="nextstep()" type="button" class="right-button01" value="下一步" />
         	</td>
      	</tr>
   		</table>
    </td>
  </tr>
</table>
</body>
</html>
