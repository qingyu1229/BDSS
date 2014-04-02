<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int permission=0;
int id=0;
if(session.getAttribute("id")!=null){
	id=(Integer)session.getAttribute("id");
	permission=(Integer)session.getAttribute("permission");
	System.out.println("permission---"+permission);
}else{
	String url=basePath+"SessionTimeout.jsp";
	response.sendRedirect(url);
}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>业务统计</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
    <link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
	<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
	<script type="text/javascript" src="js/statistics.js"></script>
	

	<script type="text/javascript" src="plugins/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="plugins/excanvas.min.js"></script>
	<script type="text/javascript" src="plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="plugins/jqplot.pieRenderer.min.js"></script>
	<script type="text/javascript" src="plugins/jqplot.categoryAxisRenderer.min.js"></script>
	<script type="text/javascript" src="plugins/jqplot.pointLabels.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
	</head>
	  <SCRIPT language=JavaScript>
	$(function(){
		$("#date").daterangepicker(); 
	 }); 
</SCRIPT>
	<body>
   <form  id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="30"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21">&nbsp;&nbsp;&nbsp; <img src="images/ico07.gif" width="20" height="18" /></td>
			  <td align="left">查询：录入时间：
				<input id="date"  type="text" size="12" style="width: 200px" />
		           &nbsp; &nbsp; <input  type="button" class="right-button02" value="查 询" onclick="statistics(<%=id%>,<%=permission%>);"/>
			  </td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
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
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> 
					 业务统计 </td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">统计时间:</td>
                    <td width="25%" align="left" bgcolor="#FFFFFF"><span id="t_date"></span></td>
                    <td rowspan="8" width="60%" bgcolor="#FFFFFF"><div id="chart" align="center" style="width:400px; height:150px;"></div></td>
                  </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">录入客户信息数:</td>
                    <td bgcolor="#FFFFFF"><span id="t_tcount"></span></td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">成单记录数:</td>
                    <td bgcolor="#FFFFFF"><span id="t_ccount"></span></td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">成单比:</td>
                    <td bgcolor="#FFFFFF"><span id="t_crate"></span></td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">A级意向数:</td>
                    <td bgcolor="#FFFFFF"><span id="Acount"></span></td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">B级意向数:</td>
                    <td bgcolor="#FFFFFF"><span id="Bcount"></span></td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">C级意向数:</td>
                    <td bgcolor="#FFFFFF"><span id="Ccount"></span></td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">D级意向数:</td>
                    <td bgcolor="#FFFFFF"><span id="Dcount"></span></td>
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
</td></tr>

</table>
</form>
  </body>
</html>
