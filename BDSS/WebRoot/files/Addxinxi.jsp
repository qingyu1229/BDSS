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
			$(function(){
				//$("#nextnotedate").daterangepicker({arrows:false}); 
				$("#nextnotedate").daterangepicker({presetRanges: [{text: '����', dateStart: 'today', dateEnd: 'today' },{text: '����', dateStart: 'today+1days', dateEnd: 'today+1days' },
				                             			{text: '����', dateStart: 'today+2days', dateEnd: 'today+2days' }],presets:{specificDate: 'ʱ��ѡ��'}}); 
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
			    				$("#selecterror").html("��ѡ������");
			    				return false;
			    			}else if(s_industry==0){
			    				$("#selecterror").html("��ѡ��������ҵ��");
			    				return false;
			    			}else if(s_town==0){
			    				$("#selecterror").html("��ѡ������������");
			    				return false;
			    			}else if(t_nextnotedate==""){
			    				$("#selecterror").html("��ѡ���´θ���ʱ�䣡");
			    				return false;
			    			}else if(!(thisReg.test(t_nextnotedate))){
			    				$("#selecterror").html("�´θ���ʱ���ʽ���ԣ�");
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
		             	   alert("���ʧ�ܣ�");
		                },
		                success: function(data){
		                    alert("��ӳɹ���");
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
		    	<td><a href="files/AddByExcel.jsp" style="margin-right: 20px;">�������</a></td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
    
    
  <tr>
      <th class="tablestyle_title" >��ӿͻ���Ϣ</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>��ӿͻ���Ϣ</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">��˾����:</td>
					    <td width="41%"><input id="companyname" name="companyname" autocomplete="off" class="text" style="width:250px" type="text" size="40" tip="����д��ȷ�����Ĺ�˾����" check="2" />
				        <span class="red"> *</span></td>
					    <td align="right" width="13%">��ϵ��:</td>
					    <td width="33%"><input name="linkman" id="linkman" autocomplete="off" type="text" class="text" style="width:154px" tip="����д��ȷ����������" check="2"/>
					    <span class="red"> *</span></td>
					    </tr>
					  <tr>
					    <td nowrap align="right">��ϵ�绰:</td>
					    <td><input id="phone" name="phone" class="text" style="width:120px" autocomplete="off" tip="������дһ����ϵ�绰" check="2"/><span class="red"> *</span>
					    	<input id="phone1"  class="text" style="width:120px" check="1"/>
					    	<input id="phone2"  class="text" style="width:120px" check="1"/>
					    </td>
					    <td align="right">������Դ:</td>
					    <td><input name="dataSource" id="dataSource" autocomplete="off" class="text" style="width:154px" tip="�����Ϊ��" check="2"/>
					    <span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">����:</td>
					    <td><select id="intention"  name="intention" >
                          <option  value="0" selected="selected" >==��ѡ��==</option>
                          <option value="A">A������</option>
                          <option value="B">B������</option>
                          <option value="C">C������</option>
                          <option value="D">D������</option>
                        </select><span class="red"> *</span></td>
					    <td align="right">��ҵ:</td>
					    <td><select id="industry" name="industry" >
                          <option value="0"  selected="selected">==��ѡ��==</option>
                          <option value="aqab">��ȫ����</option>
	   						<option value="bgwj">�칫�Ľ�</option>
	   						<option value="cp">��Ʊ</option>
	   						<option value="cryp">������Ʒ</option>
	   						<option value="dnyj">����Ӳ��</option>
					   		<option value="rjyx">�����Ϸ</option>
					   		<option value="dzdg">���ӵ繤</option>
					   		<option value="flfw">���ɷ���</option>
					   		<option value="fdc">���ز�</option>
					   		<option value="fzxm">��װЬñ</option>
					   		<option value="lpsp">��Ʒ��Ʒ</option>
					   		<option value="gbtx">�㲥ͨ��</option>
					   		<option value="ggjbz">��漰��װ</option>
					   		<option value="wlfu">�������</option>
					   		<option value="hgjcl">����������</option>
					   		<option value="jxsb">��е�豸</option>
					   		<option value="jzjzx">������װ��</option>
					   		<option value="jtys">��ͨ����</option>
					   		<option value="jypx">������ѵ</option>
					   		<option value="jnhb">���ܻ���</option>
					   		<option value="jrfw">���ڷ���</option>
					   		<option value="lsdx">��������</option>
					   		<option value="lyjpw">���μ�Ʊ��</option>
					   		<option value="nlmy">ũ������</option>
					   		<option value="swfw">�������</option>
					   		<option value="shfw">�������</option>
					   		<option value="spcy">ʳƷ����</option>
					   		 <option value="xxyl">��������</option>
					   		<option value="jydq">���õ���</option>
					   		<option value="tsyx">ͼ������</option>
					   		<option value="yljk">ҽ�ƽ���</option>
					   		<option value="zsjm">���̼���</option>
					   		<option value="hzp">��ױƷ</option>
					   		<option value="yyyp">��Ӥ��Ʒ</option>
					   		<option value="qt">����</option>
                        </select><span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">��˾��������:</td>
					    <td>
					      <select id="city">
					      <% if("sz".equals(company.trim())) {%>
                          <option  selected="selected">������</option>
                          <%}else if("gz".equals(company.trim())){ %>
                           <option  selected="selected">������</option>
                          <%} else if("dg".equals(company.trim())){%>
                           <option  selected="selected">��ݸ��</option>
                          <%} %>
                        </select>
                        	
					    <select name="town" id="town">
                          <option  value="0" selected="selected">==ѡ����==</option>
                         <%if("dg".equals(company.trim())) {%>
					   		<option value="gcjd">ݸ�ǽֵ�</option>
					   		<option value="ncjd">�ϳǽֵ�</option>
					   		<option value="dcjd">���ǽֵ�</option>
					   		<option value="wjjd">�򽭽ֵ�</option>
					   		<option value="sjz">ʯ����</option>
					   		<option value="slz">ʯ����</option>
					   		<option value="csz">��ɽ��</option>
					   		<option value="spz">ʯ����</option>
					   		<option value="qsz">��ʯ��</option>
					   		<option value="hlz">������</option>
					   		<option value="qtz">��ͷ��</option>
					   		<option value="xgz">л����</option>
					   		<option value="dkz">������</option>
					   		<option value="cpz">��ƽ��</option>
					   		<option value="lbz">弲���</option>
					   		<option value="dlz">������</option>
					   		<option value="hjz">�ƽ���</option>
					   		<option value="qxz">��Ϫ��</option>
					   		<option value="txz">������</option>
					   		<option value="fgz">�����</option>
					   		<option value="caz">������</option>
					   		<option value="humz">������</option>
					   		<option value="hjz">�����</option>
					   		<option value="stz">ɳ����</option>
					   		<option value="djz">������</option>
					   		<option value="hmz">��÷��</option>
					   		<option value="myz">��ӿ��</option>
					   		<option value="ztz">������</option>
					   		<option value="gbz">�߈���</option>
					   		<option value="zmtz">��ľͷ��</option>
					   		<option value="dlsz">����ɽ��</option>
					   		<option value="wndz">��ţ����</option>
					   		<option value="qt">����</option>
                          <%}else if("sz".equals(company.trim())){ %>
                           <option value="szlhq">�޺���</option>
                           <option value="szftq">������</option>
                           <option value="sznsq">��ɽ��</option>
                           <option value="szbaq">������</option>
                           <option value="szlgq">������</option>
                           <option value="szytq">������</option>
                           <option value="szqt">����</option>
                          <%} else if("gz".equals(company.trim())){%>
                          <option value="gzyxq">Խ����</option>
                          <option value="gzlwq">������</option>
                          <option value="gzhzq">������</option>
                          <option value="gzthq">�����</option>
                          <option value="gzbyq">������</option>
                          <option value="gzhpq">������</option>
                          <option value="gzhdq">������</option>
                          <option value="gzpyq">��خ��</option>
                          <option value="gzlgq">�ܸ���</option>
                          <option value="gznsq">��ɳ��</option>
                          <option value="gzchs">�ӻ���</option>
                          <option value="gzzcs">������</option>
                          <option value="gzqt">����</option>
                          <%} %>
                        </select><span class="red"> *</span></td>
					    <td align="right">��˾��ַ:</td>
					    <td><input name="address" id="address" autocomplete="off" class="text" style="width:154px" tip="�����Ϊ��" check="2"/><span class="red"> *</span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">�´θ���ʱ��:</td>
					    <td><input autocomplete="off" name="nextnotedate" id="nextnotedate"   class="text" style="width:154px" /><span class="red"> *</span>
					    </td>
					    <td align="right">��˾��ַ:</td>
					    <td><input autocomplete="off" name="website" id="website" class="text" style="width:154px" /></td>
					  </tr>
					    <tr>
					    <td nowrap align="right">����:</td>
					    <td><input name="fax" id="fax" autocomplete="off" class="text" style="width:154px" />
					    </td>
					    <td></td>
					    <td><span id="selecterror" style="font-size: 12px" class="red"></span></td>
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">��ע:</td>
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
			<input type="submit" id="bt_add" value="ȷ�����" class="button" />��
			<input type="reset" id="bt_reset" value="����" class="button" />��
			</TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>
