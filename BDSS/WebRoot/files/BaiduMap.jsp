<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String city=request.getParameter("city");
String keyword=request.getParameter("keyword");

city=new String(city.getBytes("ISO-8859-1"),"gbk");
keyword=new String(keyword.getBytes("ISO-8859-1"),"gbk");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ͻ���ַ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
<style type="text/css">  
 html{height:100%}    
 body{height:100%;margin:0px;padding:0px}    
 #container{height:100%}    
 </style> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=238c915931c81765fe443caf2cb644f3"></script>
  </head>
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
	var map = new BMap.Map("container");          // ������ͼʵ��  
	var point = new BMap.Point(116.300944, 40.051369);  // ����������  
	map.centerAndZoom(point, 11);                 // ��ʼ����ͼ���������ĵ�����͵�ͼ����  
	map.addControl(new BMap.NavigationControl());    
	map.addControl(new BMap.ScaleControl());    
	map.addControl(new BMap.OverviewMapControl());    
	map.addControl(new BMap.MapTypeControl()); 
	var local = new BMap.LocalSearch("<%=city%>", {    
		 renderOptions: {    
		   map: map,    
		   autoViewport: true,    
		   selectFirstResult: false    
		 },    
		  pageCapacity: 8    
		});    
		local.search("<%=keyword%>");    
		// ����һ���ؼ��࣬��function    
		function ZoomControl(){    
		    // ����Ĭ��ͣ��λ�ú�ƫ����  
		    this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;    
		    this.defaultOffset = new BMap.Size(10, 10);    
		}    
		// ͨ��JavaScript��prototype���Լ̳���BMap.Control   
		ZoomControl.prototype = new BMap.Control();  
</script>  
</body> 
</html>
