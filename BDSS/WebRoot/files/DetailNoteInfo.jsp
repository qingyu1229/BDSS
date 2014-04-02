<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String s_id="";
String c_page="";
s_id=request.getParameter("s_id");
c_page=request.getParameter("page");

String refurl="";
if(request.getHeader("referer")!=null){
	    refurl=request.getHeader("referer");
		String[] ss=refurl.split("\\.")[3].split("/");
		refurl=ss[ss.length-1]; 
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>DetailInfo</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
	<script type="text/javascript" src="js/doLocalInfo.js"></script>
  </head>
  <script type="text/javascript">
  	function load(s_id){
  		$.ajax({
  		      type: "post",
  		      url:"getDetailNote",
  		      data:{
  		    	  s_id:s_id
  		      },
  		     timeout:3000,
  			 cache: false,
  			 async:false,
  			 error:function(msg){
  		  	 	alert("页面初始化错误，错误信息:"+msg);
  		     },
  		     success:function(data){
  		    	  if(data.result=="success"){
  		    		$("#companyname").html(data.info.companyname);
  		    		$("#drdate").html(data.info.drdate);
  		    		$("#address").html(data.info.address);
  		    		$("#phone").html(data.info.phone);
  		    		$("#notedate").html(data.info.notedate);
  		    		$("#saler").html(data.info.dept+data.info.mygroup+data.info.realname);
  		    		$("#note").html(data.info.note);
  		    	  }else{
  		    		  alert("抱歉，查询失败！");
  		    	  }
  		      }
  		});
  	}
  	function backpage(){
  		var f=parent.document.getElementById("mainFrame");
  		var randomnumber=Math.floor(Math.random()*100000);
  		if("<%=refurl%>"!=""){
  			f.src="<%=basePath%>/files/<%=refurl%>.jsp?randomnumber="+randomnumber+"&page="+<%=c_page%>;
  		}else{
  			f.src="<%=basePath%>/files/SelectInfo.jsp?randomnumber="+randomnumber+"&page="+<%=c_page%>;
  		}
  	}
</script>
 <body  onload="load(<%=s_id%>);">
   <table id="subtree1"  width="100%" border="0" cellspacing="0" cellpadding="0">
   
  
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
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="4" align="center" bgcolor="#EEEEEE" class="tablestyle_title"> 
					                  详细跟进信息 </td>
                    </tr>
                    <tr>
				    	<td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司名称:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="companyname"></div></td>
                        <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="phone"></div></td>
                    </tr>
					<tr>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司地址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="address"></div></td>
					<td width="15%" height="20" align="right" bgcolor="#FFFFFF">销售:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="saler"></div></td>                   
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">导入时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="drdate"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">跟进时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="notedate"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="50"  align="right" bgcolor="#FFFFFF">跟进内容:</td>
                    <td width="35%" align="left"  colspan="3"  bgcolor="#FFFFFF"><div id="note"></div></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
     </tr>
      <tr>
  	<td align="right"><input type="button"  value="返回" class="button" onclick="backpage();"/></td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
