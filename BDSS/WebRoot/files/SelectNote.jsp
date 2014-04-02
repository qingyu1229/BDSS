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
int c_page=0;
if(request.getParameter("page")!=null){
	c_page= Integer.valueOf(request.getParameter("page"));
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查询跟进信息</title>
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
	<script type="text/javascript" src="js/loadStructure.js"></script>
	<script type="text/javascript" src="js/selectNotes.js"></script>
  </head>
  	<script type="text/javascript">
			$(function(){
				$("#date").daterangepicker(); 
				$("#bt_selectinfo").click(function(){
					getNotes(<%=id%>,<%=permission%>,0);
					return false;
				});	
			 });
			function pageload(){
				loadstr(<%=id%>,<%=permission%>);
				getNotes(<%=id%>,<%=permission%>,<%=c_page%>);
			}
		</script>
  <body onload="pageload();">
<form  id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="../images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td align="right">查询：跟进时间：</td>
			  <td width="250">
					<input name="date" id="date" type="text" size="12" style="width: 180px"/>
				</td>
				<td align="right">公司名称：</td><td><input name="companyname" id="companyname"  type="text" size="12" style="width: 180px"/>
					(<input type="radio" name="querytype" value="1" checked="checked"/>精确
		             <input type="radio" name="querytype" value="0"/>模糊)
				</td>
		    </tr>
		      <%if(permission==3){ %>
		    	<tr><td></td>
					<td align="right">销售：</td>	
					<td><select id="dept" onchange="change_dept(<%=id%>,<%=permission%>)"> <!-- 大部 -->
						<option value="0">==所有==</option>
					</select>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- 小部 -->
						<option value="0">==所有==</option>
					</select>
					<select id="saler" > <!-- 销售 -->
						<option value="0">==所有==</option>
					</select>
					</td>	    	
		    <%}else if(permission==2){%>
		    	<tr>
		    		<td></td>
					<td align="right">销售：</td>	
					<td>
					<select id="group" onchange="change_group(<%=id%>,<%=permission%>)"> <!-- 小部 -->
						<option value="0">==所有==</option>
					</select>
					<select id="saler" > <!-- 销售 -->
						<option value="0">==所有==</option>
					</select>
					</td>	    	
		    <%}else if(permission==1){ %>
		    	<tr>
		    		<td></td>
					<td align="right">销售：</td>	
					<td>
					<select id="saler"> <!-- 销售 -->
						<option value="0">==所有==</option>
					</select>
					</td>	    	
		    <%} %>
		   	 <td>
		   	 <input id="bt_selectNotes" onclick="getNotes(<%=id%>,<%=permission%>,0)" type="button" class="right-button02" value="查 询" /></td>
		   </tr>
          </table></td>
        </tr>
    </table></td></tr>
          </table></td>
        </tr>
    </table></td></tr>

  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <th class="tablestyle_title" >查询跟进信息</th>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table id="t_info" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    <td height="22" colspan="8" align="center" style="font-size:16px ;font-family: 黑体;">查询跟进信息</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">序号</td>
                    <td width="12%" align="center">公司名称</td>
					<td width="6%" align="center">销售</td>
					<td width="6%" align="center">录入时间</td>
					<td width="8%" align="center">跟进时间</td>
					<td width="20%" align="center">跟进内容</td>
					<td width="5%" align="center">基本操作</td>
                  </tr>
                </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span id="t_count" class="right-text09">1</span> 条记录 | 第 <span id="c_page" class="right-text09">1/1</span> 页</td>
                <td width="46%" align="right"><div id="pagechange">[<a href="#" class="right-font08">首页</a>| 
                								<a href="#" class="right-font08">上一页</a>| 
                								<a href="#" class="right-font08">下一页</a>| 
                								<a href="#" class="right-font08">末页</a>]转至：</div>
                							</td>
                <td width="4%">
                	<table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="8%"><input type="text" class="right-textfield03" size="1" /></td>
                      <td width="80%"><input type="submit" class="right-button06" value=""/></td>
                    </tr>
                   </table>
                </td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</td></tr>
</table>
</form>
</body>
</html>
