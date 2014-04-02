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
			$(function(){
				//$("#nextnotedate").daterangepicker({arrows:false}); 
				$("#nextnotedate").daterangepicker({presetRanges: [{text: '今天', dateStart: 'today', dateEnd: 'today' },{text: '明天', dateStart: 'today+1days', dateEnd: 'today+1days' },
				                             			{text: '后天', dateStart: 'today+2days', dateEnd: 'today+2days' }],presets:{specificDate: '时间选择'}}); 
			 });
			
		</script>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var reg=/((\d{11})|((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})))/; 
			checkform("linkman:companyname","^[\u4e00-\u9fa5]+$");
			//checkform("phone",reg);
			checkform("dataSource:address","^([\u4e00-\u9fa5]|[0-9A-Za-z])+$");
			//checkform("dataSource",".*\\S.*");
			//checkform("intention","[^0]");
			//checkDate("nextnotedate");
			checkTell("phone");
			//checkform("nextnotedate",/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/);
			
			 $('#f_addInfo').submit(function(){ 
			    	$.ajax({
			    		beforeSend:function(xh){
			    			$("#selecterror").html("");
			    			
			    			var thisReg = new RegExp(/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/);
			    			
			    			var s_intention=$("#intention").val();
			    			var s_industry=$("#industry").val();
			    			var s_town=$("#town").val(); 
			    			var t_nextnotedate=$("#nextnotedate").val();
			    			if(s_intention==0){
			    				$("#selecterror").html("请选择意向！");
			    				return false;
			    			}else if(s_industry==0){
			    				$("#selecterror").html("请选择所属行业！");
			    				return false;
			    			}else if(s_town==0){
			    				$("#selecterror").html("请选择所属镇区！");
			    				return false;
			    			}else if(t_nextnotedate==""){
			    				$("#selecterror").html("请选择下次跟进时间！");
			    				return false;
			    			}else if(!(thisReg.test(t_nextnotedate))){
			    				$("#selecterror").html("下次跟进时间格式不对！");
			    				return false;
			    			}
			    			else{
			    				return true;
			    			}
			    		},
		                type: "POST",
		                url:'AddRecord',
		           
		                data:{
		                	companyname:$("#companyname").val(),
		                	linkman:$("#linkman").val(),
		                	phone:$("#phone").val(),
		                	phone1:$("#phone1").val(),
		                	phone2:$("#phone2").val(),
		                	dataSource:$("#dataSource").val(),
		                	intention:$("#intention").val(),
		                	industry:$("#industry").val(),
		                	town:$("#town").val(),
		                	address:$("#address").val(),
		                	nextnotedate:$("#nextnotedate").val(),
		                	website:$("#website").val(),
		                	fax:$("#fax").val(),
		                	comment:$("#comment").val(),
		                	u_id:<%=id%>
		                },
		                timeout:3000,
		                cache: false,  
		                async:false,
		                error:function(msg){
		             	   alert("添加失败！");
		                },
		                success: function(data){
		                    alert("添加成功！");
			                $("form:first").trigger("reset");
		                }
			    	});
			    });
			});
	</script>
<body >
<form action="" method="post" enctype="multipart/form-data"  id="f_addInfo" target="sypost" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">

 <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		    	<td><a href="files/AddByExcel.jsp" style="margin-right: 20px;">批量添加</a></td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
    
    
  <tr>
      <th class="tablestyle_title" >添加客户信息</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加客户信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">公司名称:</td>
					    <td width="41%"><input id="companyname" name="companyname" autocomplete="off" class="text" style="width:250px" type="text" size="40" tip="请填写正确的中文公司名称" check="2" />
				        <span class="red"> *</span></td>
					    <td align="right" width="13%">联系人:</td>
					    <td width="33%"><input name="linkman" id="linkman" autocomplete="off" type="text" class="text" style="width:154px" tip="请填写正确的中文姓名" check="2"/>
					    <span class="red"> *</span></td>
					    </tr>
					  <tr>
					    <td nowrap align="right">联系电话:</td>
					    <td><input id="phone" name="phone" class="text" style="width:120px" autocomplete="off" tip="至少填写一个联系电话" check="2"/><span class="red"> *</span>
					    	<input id="phone1"  class="text" style="width:120px" check="1"/>
					    	<input id="phone2"  class="text" style="width:120px" check="1"/>
					    </td>
					    <td align="right">资料来源:</td>
					    <td><input name="dataSource" id="dataSource" autocomplete="off" class="text" style="width:154px" tip="此项不能为空" check="2"/>
					    <span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">意向:</td>
					    <td><select id="intention"  name="intention" >
                          <option  value="0" selected="selected" >==请选择==</option>
                          <option value="A">A级意向</option>
                          <option value="B">B级意向</option>
                          <option value="C">C级意向</option>
                          <option value="D">D级意向</option>
                        </select><span class="red"> *</span></td>
					    <td align="right">行业:</td>
					    <td><select id="industry" name="industry" >
                          <option value="0"  selected="selected">==请选择==</option>
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
                        </select><span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">公司所属镇区:</td>
					    <td>
					      <select id="city">
					      <% if("sz".equals(company.trim())) {%>
                          <option  selected="selected">深圳市</option>
                          <%}else if("gz".equals(company.trim())){ %>
                           <option  selected="selected">广州市</option>
                          <%} else if("dg".equals(company.trim())){%>
                           <option  selected="selected">东莞市</option>
                          <%} %>
                        </select>
                        	
					    <select name="town" id="town">
                          <option  value="0" selected="selected">==选择区==</option>
                         <%if("dg".equals(company.trim())) {%>
					   		<option value="gcjd">莞城街道</option>
					   		<option value="ncjd">南城街道</option>
					   		<option value="dcjd">东城街道</option>
					   		<option value="wjjd">万江街道</option>
					   		<option value="sjz">石碣镇</option>
					   		<option value="slz">石龙镇</option>
					   		<option value="csz">茶山镇</option>
					   		<option value="spz">石排镇</option>
					   		<option value="qsz">企石镇</option>
					   		<option value="hlz">横沥镇</option>
					   		<option value="qtz">桥头镇</option>
					   		<option value="xgz">谢岗镇</option>
					   		<option value="dkz">东坑镇</option>
					   		<option value="cpz">常平镇</option>
					   		<option value="lbz">寮步镇</option>
					   		<option value="dlz">大朗镇</option>
					   		<option value="hjz">黄江镇</option>
					   		<option value="qxz">清溪镇</option>
					   		<option value="txz">塘厦镇</option>
					   		<option value="fgz">凤岗镇</option>
					   		<option value="caz">长安镇</option>
					   		<option value="humz">虎门镇</option>
					   		<option value="hjz">厚街镇</option>
					   		<option value="stz">沙田镇</option>
					   		<option value="djz">道滘镇</option>
					   		<option value="hmz">洪梅镇</option>
					   		<option value="myz">麻涌镇</option>
					   		<option value="ztz">中堂镇</option>
					   		<option value="gbz">高埗镇</option>
					   		<option value="zmtz">樟木头镇</option>
					   		<option value="dlsz">大岭山镇</option>
					   		<option value="wndz">望牛墩镇</option>
					   		<option value="qt">其他</option>
                          <%}else if("sz".equals(company.trim())){ %>
                           <option value="szlhq">罗湖区</option>
                           <option value="szftq">福田区</option>
                           <option value="sznsq">南山区</option>
                           <option value="szbaq">宝安区</option>
                           <option value="szlgq">龙岗区</option>
                           <option value="szytq">盐田区</option>
                           <option value="szqt">其他</option>
                          <%} else if("gz".equals(company.trim())){%>
                          <option value="gzyxq">越秀区</option>
                          <option value="gzlwq">荔湾区</option>
                          <option value="gzhzq">海珠区</option>
                          <option value="gzthq">天河区</option>
                          <option value="gzbyq">白云区</option>
                          <option value="gzhpq">黄浦区</option>
                          <option value="gzhdq">花都区</option>
                          <option value="gzpyq">番禺区</option>
                          <option value="gzlgq">萝岗区</option>
                          <option value="gznsq">南沙区</option>
                          <option value="gzchs">从化市</option>
                          <option value="gzzcs">增城市</option>
                          <option value="gzqt">其他</option>
                          <%} %>
                        </select><span class="red"> *</span></td>
					    <td align="right">公司地址:</td>
					    <td><input name="address" id="address" autocomplete="off" class="text" style="width:154px" tip="此项不能为空" check="2"/><span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">下次跟进时间:</td>
					    <td><input autocomplete="off" name="nextnotedate" id="nextnotedate"   class="text" style="width:154px" /><span class="red"> *</span>
					    </td>
					    <td align="right">公司网址:</td>
					    <td><input autocomplete="off" name="website" id="website" class="text" style="width:154px" /></td>
					  </tr>
					    <tr>
					    <td nowrap align="right">传真:</td>
					    <td><input name="fax" id="fax" autocomplete="off" class="text" style="width:154px" />
					    </td>
					    <td></td>
					    <td><span id="selecterror" style="font-size: 12px" class="red"></span></td>
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">备注:</td>
					    <td colspan="2"><textarea autocomplete="off" id="comment" name="comment" rows="5" cols="80"></textarea></td>
					    </tr>
					  </table>
			 <br />
				</fieldset>	</TD>
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" id="bt_add" value="确认添加" class="button" />　
			<input type="reset" id="bt_reset" value="重置" class="button" />　
			</TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>
