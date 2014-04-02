<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String company=null;
	int id=0;
	if(session.getAttribute("company")!=null){
		company=(String)session.getAttribute("company");
		id=(Integer)session.getAttribute("id");
	}else{
		String url=basePath+"SessionTimeout.jsp";
		response.sendRedirect(url);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>百度华南客户资源信息管理系统</title>
		<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
		<link href="css/Tooltip.css" type="text/css" rel="stylesheet"/>
		<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
		<link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
		<script type="text/javascript" src="js/superValidator.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
		<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
		<script type="text/javascript">
			function showBg(ct,content){ 
var bH=$("body").height(); 
var bW=$("body").width()+16; 
var objWH=getObjWh(ct); 
$("#fullbg").css({width:bW,height:bH,display:"block"}); 
var tbT=objWH.split("|")[0]+"px"; 
var tbL=objWH.split("|")[1]+"px"; 
$("#form_file").submit();
$("#"+ct).css({top:tbT,left:tbL,display:"block"}); 
$("#"+content).html("<div style='text-align:center'>正在处理，请稍后...</div>"); 
$(window).scroll(function(){resetBg()}); 
$(window).resize(function(){resetBg()}); 

//return true;
} 
function getObjWh(obj){ 
var st=document.documentElement.scrollTop;//滚动条距顶部的距离 
var sl=document.documentElement.scrollLeft;//滚动条距左边的距离 
var ch=document.documentElement.clientHeight;//屏幕的高度 
var cw=document.documentElement.clientWidth;//屏幕的宽度 
var objH=$("#"+obj).height();//浮动对象的高度 
var objW=$("#"+obj).width();//浮动对象的宽度 
var objT=Number(st)+(Number(ch)-Number(objH))/2; 
var objL=Number(sl)+(Number(cw)-Number(objW))/2; 
return objT+"|"+objL; 
} 
function resetBg(){ 
//alert("-");

var fullbg=$("#fullbg").css("display"); 
if(fullbg=="block"){ 
var bH2=$("body").height(); 
var bW2=$("body").width()+16; 
$("#fullbg").css({width:bW2,height:bH2}); 
var objV=getObjWh("dialog"); 
var tbT=objV.split("|")[0]+"px"; 
var tbL=objV.split("|")[1]+"px"; 
$("#dialog").css({top:tbT,left:tbL}); 
} 

} 
		
		</script>
		<style type="text/css"> 
*{ 
font-family:Arial, Helvetica, sans-serif; 
font-size:12px; 
} 
#fullbg{ 
background-color: Gray; 
display:none; 
z-index:3; 
position:absolute; 
left:0px; 
top:0px; 
filter:Alpha(Opacity=30); 
/* IE */ 
-moz-opacity:0.4; 
/* Moz + FF */ 
opacity: 0.4; 
} 

#dialog { 
position:absolute; 
width:200px; 
height:200px; 
background:#F00; 
display: none; 
z-index: 5; 
} 

#main { 
height: 1500px; 
} 
</style> 
	</head>
	
<body >
<div class="MainDiv">

<form action="AddByExcel" id="form_file" enctype="multipart/form-data" method="post"  >
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">

 <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		    	<td><a href="files/download2.jsp" style="margin-right: 20px;">下载批量添加Excel模板</a></td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
    <tr>
      <th class="tablestyle_title" >批量添加客户信息</th>
  </tr>

		<TR>
		
			<TD colspan="2" align="center" height="50px">
			<div id="dd">
			上传Excel2003文件：<input type="file"  name="file" accept="application/vnd.ms-excel" value="浏览" />　
			<input type="button"  id="bt_upload"  onclick="showBg('30|30','dd');"  value="上传"/>
			</div>
			</TD>
			
		</TR>
			<TR>
		
			<TD colspan="2" align="left" height="50px" style="font-size: 14 ;left: 20px;">
			<br>
				&nbsp;&nbsp;批量添加客户信息说明：<br>
					&nbsp;&nbsp;&nbsp;&nbsp;1、添加的文件必须为Excel2003格式，且大小不能超过2M，行数不能超过1000行。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;2、客户信息内容必须存放于第一个Sheet表中；第一行各列必须为："公司名称","联系人"、
					   "电话","意向","资料来源","行业","城镇","地址","下次跟进时间",
					   "公司网站","传真","备注"，且顺序不能改变，从第二行开始的各项客户信息格式也必须严格依次顺序。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;3、"公司名称","联系人"、"电话","意向","资料来源","行业","城镇","地址","下次跟进时间"不能为空，
					   "录入时间","下次跟进时间"必须为日期格式，电话必须为正确的手机（11位）、座机（七位、八位、区号+七位、区号+八位）。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;4、城镇一项的填写必须为**镇或**区或**街道，与添加客户信息中城镇下拉选项中的内容一致;
					                                                                        行业一项必须与添加客户信息中行业下拉选项中的内容一致。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;5、所有需要批量添加的客户信息中如若有任意一项格式不符合要求将不会被添加到数据库中。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;6、为了减小服务器压力，请不要频繁提交。
			</TD>
			
		</TR>
		
		</TABLE>	</form>
</div>
<div id="fullbg"></div> 
</body>
</html>
