<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("Referer : " + request.getHeader("referer")); 

String refurl="";
if(request.getHeader("referer")!=null){
	    refurl=request.getHeader("referer");
		String[] ss=refurl.split("\\.")[3].split("/");
		refurl=ss[ss.length-1];
}
String s_id="";
String c_page="";
s_id=request.getParameter("s_id");
c_page=request.getParameter("page");
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
  	function load(id,page){
  		$.ajax({
  		      type: "post",
  		      url:"getSalesRecordById",
  		      data:{
  		    	  s_id:id
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
  		    		$("#linkman").html(data.info.linkman);
  		    		$("#town").html(doTown(data.info.town));
  		    		$("#address").html(data.info.address);
  		    		//if(data.info.address=="无"){
  		    		//	var url="无";
  		    		//}else{
  		    		//	var url="<a href=\"javascript:void(0)\"  onclick=\"openMap('"+getcity(data.info.town)+"','"+data.info.address+"');\">"+data.info.address+"</a>";
  		    		//}
  		    		//alert(data.info.dataSource);
  		    		///$("#address").html(url);
  		    		$("#intention").html(data.info.intention);
  		    		$("#phone").html(data.info.phone);
  		    		$("#datasource").html(data.info.dataSource);
  		    		$("#industry").html(doIndustry(data.info.industry));
  		    		$("#date").html(data.info.date);
  		    		$("#nextnotedate").html(data.info.nextnotedate);
  		    		$("#website").html(data.info.website);
  		    		$("#fax").html(data.info.fax);
  		    		$("#comment").html(data.info.comment);
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
 <body  onload="load(<%=s_id%>,<%=c_page%>);">
   <table id="subtree1" style="DISPLAY:" width="100%" border="0" cellspacing="0" cellpadding="0">
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
  		  	<td>  <input type="button" style="margin-left: 20px"  value="返回" class="button" onclick="backpage();"/></td>
  		  </tr>
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
					                  客户详细信息 </td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司名称:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="companyname"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系人:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="linkman"></div></td>
                    </tr>
					<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司所属镇区:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"> <div id="town"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司地址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="address"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="phone"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">所属行业:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="industry"></div></td>
                    </tr>
                 	<tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">意向:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="intention"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">数据来源:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="datasource"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">录入时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="date"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">下次跟进时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="nextnotedate"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">网址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="website"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">传真:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="fax"></div></td>
                    </tr>
                     <tr>
				    	<td width="15%" height="50"  align="right" bgcolor="#FFFFFF">备注:</td>
                    	<td width="35%" align="left"  colspan="3"  bgcolor="#FFFFFF"><div id="comment"></div></td>
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
</body>
</html>
