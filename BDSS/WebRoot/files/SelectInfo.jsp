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
    <title>百度华南客户资源信息管理系统</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
    <link href="css/Tooltip.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.1.custom.min.js"></script>
	<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
	<script type="text/javascript" src="js/selectinfo.js"></script>
	<script type="text/javascript" src="js/loadStructure.js"></script>
	<script type="text/javascript">
			$(function(){
				$("#date").daterangepicker(); 
				$("#bt_selectinfo").click(function(){
					getSalesinfos(<%=id%>,<%=permission%>,0);
					return false;
				});
			 });
			function pageload(){
				loadstr(<%=id%>,<%=permission%>);
				getSalesinfos(<%=id%>,<%=permission%>,<%=c_page%>);
			}
		</script>
  </head>
  <body onload="pageload()">
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
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <th class="tablestyle_title" >查询客户信息</th>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table id="t_info" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle">
                     <%if(permission==3){%>
                       <td height="22" colspan="9" align="center" style="font-size:16px ;font-family: 黑体;">客户信息详细列表
                    	<div align="right"><a href="files/download.jsp"  style="font-size: 12px;">导出数据</a></div></td>
                     <%}else{%>
                       <td height="22" colspan="9" align="center" style="font-size:16px ;font-family: 黑体;">客户信息详细列表</td>
                     <%} %>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">序号</td>
                    <td align="center" width="14%">公司名称</td>
					<td align="center" width="4%">联系人</td>
                    <td align="center" width="8%">联系电话</td>
                    <td align="center" width="4%">意向</td>
					<td align="center" width="6%">录入时间</td>
					<td align="center" width="6%">下次跟进时间</td>
					<td align="center" width="5%">销售</td>
					<td align="center" width="10%">基本操作</td>
                  </tr>
            	</table>
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
<tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" >
          <form id="f_selectinfo" action="" method="post">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td align="right">查询：录入时间：</td>
			  <td width="250">
				<input name="date" id="date" type="text" size="12" style="width: 180px"/>
				</td>
				<td align="right">公司名称：</td>
				<td><input name="companyname" id="companyname"  type="text" size="12" style="width: 180px"/>
					(<input type="radio" name="querytype" value="1" checked="checked"/>精确
		             <input type="radio" name="querytype" value="0"/>模糊)
				</td>
		    </tr>
		    <tr>
		    <td>&nbsp;</td>
		       <td align="right">联系电话：</td>
		       <td><input name="phone" id="phone" type="text" size="12" /></td>
		        <td align="right">行业：</td>
		        <td><select id="industry" name="industry">
		        			<option value="0">==请选择==</option>
		        	 		<option value="aqab">安全安保</option>
	   						<option value="bgwj">办公文教</option>
	   						<option value="cp">彩票</option>
	   						<option value="cryp">成人用品</option>
	   						<option value="dnyj">电脑硬件</option>
					   		<option value="rjyx">软件游戏</option>
					   		<option value="dzdg">电子电工</option>
					   		<option value="flfw">法律服务</option>
					   		<option value="fdc">房地产</option>
					   		<option value="fzxm">服装鞋帽</option>
					   		<option value="lpsp">礼品饰品</option>
					   		<option value="gbtx">广播通信</option>
					   		<option value="ggjbz">广告及包装</option>
					   		<option value="wlfu">网络服务</option>
					   		<option value="hgjcl">化工及材料</option>
					   		<option value="jxsb">机械设备</option>
					   		<option value="jzjzx">建筑及装修</option>
					   		<option value="jtys">交通运输</option>
					   		<option value="jypx">教育培训</option>
					   		<option value="jnhb">节能环保</option>
					   		<option value="jrfw">金融服务</option>
					   		<option value="lsdx">铃声短信</option>
					   		<option value="lyjpw">旅游及票务</option>
					   		<option value="nlmy">农林牧渔</option>
					   		<option value="swfw">商务服务</option>
					   		<option value="shfw">生活服务</option>
					   		<option value="spcy">食品餐饮</option>
					   		 <option value="xxyl">休闲娱乐</option>
					   		<option value="jydq">家用电器</option>
					   		<option value="tsyx">图书音像</option>
					   		<option value="yljk">医疗健康</option>
					   		<option value="zsjm">招商加盟</option>
					   		<option value="hzp">化妆品</option>
					   		<option value="yyyp">孕婴用品</option>
					   		<option value="qt">其他</option>
		        </select></td>
		    </tr>
		     <tr>
		    <td>&nbsp;</td>
		       <td align="right">联系人：</td>
		       <td><input name="linkman" id="linkman" type="text" size="12" /></td>
		        <td align="right">意向：</td>
		        <td>
		        <select id="intention" name="intention">
		        	<option value="0">==请选择==</option>
		        	<option value="A">A级意向</option>
                    <option value="B">B级意向</option>
                    <option value="C">C级意向</option>
                    <option value="D">D级意向</option>
		        </select></td>
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
		    	</tr>
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
		    	</tr>
		    <%}else if(permission==1){ %>
		    	<tr>
		    		<td></td>
					<td align="right">销售：</td>	
					<td>
					<select id="saler"> <!-- 销售 -->
						<option value="0">==所有==</option>
					</select>
					</td>	    	
		    	</tr>
		    <%} %>
		     <tr>
		    <td>&nbsp;</td>
		       <td align="right">排序原则：</td>
		       <td> <input type="radio" name="pxyz" value="0" checked="checked"/>按导入时间排序	<br>
		       		<input type="radio" name="pxyz" value="1" />按下次跟进时间排序
		       </td>
		       <td><input  type="submit" id="bt_selectinfo" class="right-button02" value="查 询" /></td>
		    </tr>
          </table>
          </form>
          </td>
        </tr>
    </table></td></tr>
</table>
</body>
</html>
