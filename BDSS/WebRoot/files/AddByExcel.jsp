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
		<title>�ٶȻ��Ͽͻ���Դ��Ϣ����ϵͳ</title>
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
$("#"+content).html("<div style='text-align:center'>���ڴ������Ժ�...</div>"); 
$(window).scroll(function(){resetBg()}); 
$(window).resize(function(){resetBg()}); 

//return true;
} 
function getObjWh(obj){ 
var st=document.documentElement.scrollTop;//�������ඥ���ľ��� 
var sl=document.documentElement.scrollLeft;//����������ߵľ��� 
var ch=document.documentElement.clientHeight;//��Ļ�ĸ߶� 
var cw=document.documentElement.clientWidth;//��Ļ�Ŀ�� 
var objH=$("#"+obj).height();//��������ĸ߶� 
var objW=$("#"+obj).width();//��������Ŀ�� 
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
		    	<td><a href="files/download2.jsp" style="margin-right: 20px;">�����������Excelģ��</a></td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
    <tr>
      <th class="tablestyle_title" >������ӿͻ���Ϣ</th>
  </tr>

		<TR>
		
			<TD colspan="2" align="center" height="50px">
			<div id="dd">
			�ϴ�Excel2003�ļ���<input type="file"  name="file" accept="application/vnd.ms-excel" value="���" />��
			<input type="button"  id="bt_upload"  onclick="showBg('30|30','dd');"  value="�ϴ�"/>
			</div>
			</TD>
			
		</TR>
			<TR>
		
			<TD colspan="2" align="left" height="50px" style="font-size: 14 ;left: 20px;">
			<br>
				&nbsp;&nbsp;������ӿͻ���Ϣ˵����<br>
					&nbsp;&nbsp;&nbsp;&nbsp;1����ӵ��ļ�����ΪExcel2003��ʽ���Ҵ�С���ܳ���2M���������ܳ���1000�С�<br>
					&nbsp;&nbsp;&nbsp;&nbsp;2���ͻ���Ϣ���ݱ������ڵ�һ��Sheet���У���һ�и��б���Ϊ��"��˾����","��ϵ��"��
					   "�绰","����","������Դ","��ҵ","����","��ַ","�´θ���ʱ��",
					   "��˾��վ","����","��ע"����˳���ܸı䣬�ӵڶ��п�ʼ�ĸ���ͻ���Ϣ��ʽҲ�����ϸ�����˳��<br>
					&nbsp;&nbsp;&nbsp;&nbsp;3��"��˾����","��ϵ��"��"�绰","����","������Դ","��ҵ","����","��ַ","�´θ���ʱ��"����Ϊ�գ�
					   "¼��ʱ��","�´θ���ʱ��"����Ϊ���ڸ�ʽ���绰����Ϊ��ȷ���ֻ���11λ������������λ����λ������+��λ������+��λ����<br>
					&nbsp;&nbsp;&nbsp;&nbsp;4������һ�����д����Ϊ**���**����**�ֵ�������ӿͻ���Ϣ�г�������ѡ���е�����һ��;
					                                                                        ��ҵһ���������ӿͻ���Ϣ����ҵ����ѡ���е�����һ�¡�<br>
					&nbsp;&nbsp;&nbsp;&nbsp;5��������Ҫ������ӵĿͻ���Ϣ������������һ���ʽ������Ҫ�󽫲��ᱻ��ӵ����ݿ��С�<br>
					&nbsp;&nbsp;&nbsp;&nbsp;6��Ϊ�˼�С������ѹ�����벻ҪƵ���ύ��
			</TD>
			
		</TR>
		
		</TABLE>	</form>
</div>
<div id="fullbg"></div> 
</body>
</html>
