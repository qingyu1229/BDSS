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
int c_page=0;
String salername="";
int s_id=0;
if(request.getParameter("page")!=null){
	c_page= Integer.valueOf(request.getParameter("page"));
	s_id= Integer.valueOf(request.getParameter("s_id"));
	salername= request.getParameter("salername");
	salername=new String(salername.getBytes("ISO-8859-1"),"gbk");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>transfer</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/loadStructure.js"></script>
  </head>
<script type="text/javascript">
  function pageload(){
		loadstr(<%=id%>,<%=permission%>);
		$("#salername").html(<%=salername%>);		
	}
  	function transfer(){
  		var s_id2=$("#saler").val();
  		if(s_id2==0){
  			alert("��ѡ������ת��Ŀ�꣡");
  		}else{
  			$.ajax({
  		       type: "post",
  		       url:"transfer",
  		       data:{
  		   		   s_id:<%=s_id%>
  		   		  ,s_id2:s_id2
  		   		}
  				,timeout:3000,
  		         cache: false,  
  		         async:false,
  		         error:function(msg){
  		    	 alert("error:"+msg);
  		       },
  		       success: function(data){  
  		    	   //alert(data);
  		    	   if(data.result=="success"){
  		    		   var bl=confirm("ת�Ƴɹ����Ƿ񷵻���һҳ��");
  		    		   if(bl){
  		    			 backpage();
  		    		   }
  		    	   }else if(data.result=="nodata"){
  		    		   alert("û��������۶�Ӧ�Ŀͻ����ϣ�ת��ʧ�ܣ�");
  		    	   }else{
  		    		   alert("��Ǹ������δ֪����");
  		    	   }
  				}
  	});}}
 	function backpage(){
  		//clearInterval(timer1);
  		var f=parent.document.getElementById("mainFrame");
  		var randomnumber=Math.floor(Math.random()*100000);
  		f.src="<%=basePath%>/files/EmpInfo.jsp?randomnumber="+randomnumber+"&page="+<%=c_page%>;
  	}
  </script>
<body onload="pageload();">

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
    <td>
    <fieldset >
<legend style="font-size: 10">����ת��</legend>
			<div id="table_transfer" style="margin: 5 auto">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������<span id="salername" ></span>�Ŀͻ�����ת����
			 <%if(permission==3){ %>
					<select id="dept" onchange="change_dept(<%=id%>,<%=permission%>)"> <!-- �� -->
						<option value="0">==����==</option>
					</select>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- С�� -->
						<option value="0">==����==</option>
					</select>
					<select id="saler" > <!-- ���� -->
						<option value="0">==����==</option>
					</select>
		         <%}else if(permission==2){%>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- С�� -->
						<option value="0">==����==</option>
					</select>
					<select id="saler"> <!-- ���� -->
						<option value="0">==����==</option>
					</select>
		   		 <%}else if(permission==1){ %>
					<select id="saler"> <!-- ���� -->
						<option value="0">==����==</option>
					</select>
		    	<%} %>	
				<input value="ȷ ��" type="button" class="right-button02" onclick="transfer();"/>			
	</div></fieldset>
</td></tr>
</table>

	<br>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="����" class="button" onclick="backpage();"/>
  </body>
</html>
