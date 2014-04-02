<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>note</title>
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
  </head>
   <script type="text/javascript">
	var timer1;
	var s_id;
  	function load(id,page){
  		s_id=id;
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
  		    		$("#address").html(data.info.address);
  		    		$("#phone").html(data.info.phone);
  		    		$("#date").html(data.info.date);
  		    		$("#intention").html(data.info.intention);
  		    		$("#lastnotedate").html(data.info.nextnotedate);
  		    		$("#website").html(data.info.website);
  		    		//$("#website").attr("href",data.info.website);
  		    	  } 		    	 
  		      }  			
  		});
  		$("#nextnotedate").daterangepicker({presetRanges: [{text: '今天', dateStart: 'today', dateEnd: 'today' },{text: '明天', dateStart: 'today+1days', dateEnd: 'today+1days' },
  					                             			{text: '后天', dateStart: 'today+2days', dateEnd: 'today+2days' }],presets:{specificDate: '时间选择'}}); 
  		init_timer();
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
	function init_timer(){
			timer1=setInterval("t_datetime()",1000);
		}
	function t_datetime(){
			 var myDate = new Date();
			 var s_date=document.getElementById("t_datetime");	
			 s_date.innerHTML=myDate.toLocaleString();
		}
	
	function addNote(){
		var reg=/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
		if($("#note").val()=="跟进字数0-200"){
			alert("请填写跟进信息！");
			return false;
		}else if($("#note").val().length>200){
			alert("跟进信息字数0-200");
			return false;
		}else if($("#nextnotedate").val()==""){
			alert("请填写下次跟进时间！");
			return false;
		}else if(!reg.test($("#nextnotedate").val())){
			alert("下次跟进时间格式不正确");
			return false;
		}else{
		$.ajax({
		      type: "post",
		      url:"addNote",
		      data:{
		    	  s_id:s_id,
		    	  note:$("#note").val(),
		    	  nextnotedate:$("#nextnotedate").val()
		      },
		     timeout:3000,
			 cache: false,  
			 async:false,
			 error:function(msg){
		  	 	alert("发生未知错误，错误信息:"+msg);
		     },
		     success:function(data){
		    	 //alert(data);
		    	if(data.result=="success"){
		    		 var myDate = new Date();
		    		  var bl=confirm("跟进信息添加成功！是否返回上一页？");
		    		  if(bl){
		    			  backpage();
		    		  }else{
		    			  $("#lastnotedate").html(myDate.toLocaleString());
		    			  $("#note").html("");
		    		  }
		    	}
		    } 		    	 
		});
		}
	}
</script>
  <body onload="load(<%=s_id%>,<%=c_page%>);">
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
					              添加跟进信息 </td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司名称:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="companyname"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系人:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="linkman"></div></td>
                    </tr>
					<tr>
				   <td width="15%" height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="phone"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">公司地址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="address"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">录入时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="date"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">上次跟进时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="lastnotedate"></div></td>
                    </tr>
                    <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">网址:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="website"></div></td>
                    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">当前时间:</td>
                    <td width="35%" align="left" bgcolor="#FFFFFF"><div id="t_datetime"></div></td>
                    </tr>
                    <tr>
                    	<td width="15%" height="20" align="right" bgcolor="#FFFFFF">下次跟进时间：</td>
                    	<td width="35%" align="left" bgcolor="#FFFFFF">
						<input name="nextnotedate" id="nextnotedate"  class="text" style="width:154px" /><span class="red"> *</span>
						</td>
                    	<td width="15%" height="20" align="right" bgcolor="#FFFFFF"></td>
                    	<td width="35%" align="left" bgcolor="#FFFFFF"></td>
                    </tr>
                     <tr>
				    	<td width="15%" height="50"  align="right" bgcolor="#FFFFFF" valign="top">跟进:</td>
                    	<td width="35%" align="left"  colspan="3"  bgcolor="#FFFFFF">
                    	<textarea id="note" onfocus="if(value=='跟进字数0-200'){value='';};"
							 rows="8" style="width: 60%"
							 onblur="if(value==''){value='跟进字数0-200';}">跟进字数0-200</textarea><span class="red"> *</span></td>
                    </tr>
                    <tr>
                    	<td bgcolor="#FFFFFF"  colspan="4" align="right">
                    	 	<input type="button" class="button" id="bt_note" value="添加跟进" onclick="addNote();"/>
                    	 	<input type="button"   value="返回" class="button" onclick="backpage();"/>
                    	</td>
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
