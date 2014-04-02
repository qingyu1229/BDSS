<%@page import="com.baidu.downfile.FileOperate"%>
<%@page import="javax.imageio.stream.FileImageInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" contentType="application/x-msdownload" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String id=null;
	if(session.getAttribute("id")!=null){
	id=session.getAttribute("id").toString();
	}else{
		String url=basePath+"SessionTimeout.jsp";
		response.sendRedirect(url);
	}		
%>
 
<%
	//关于文件下载时采用文件流输出的方式处理：   
	//加上response.reset()
	//b并且所有的％>后面不要换行，包括最后一个；      

	String p=request.getRealPath("/");

	response.reset();//可以加也可以不加  
	response.setContentType("application/x-download");
	
	String e_path=p+"\\demo.zip";//保存文件，并返回excel文件路径 
	
	String filedisplay2 = URLEncoder.encode("demo.zip","gbk");
	response.addHeader("Content-Disposition", "attachment;filename="
			+ filedisplay2);
	java.io.OutputStream outp = null;
	java.io.FileInputStream in = null;
	try {
		outp = response.getOutputStream();
		//String filenamedownload="";
		in = new java.io.FileInputStream(e_path);
		
		byte[] b = new byte[1024];
		int i = 0;

		while ((i = in.read(b)) > 0) {
			outp.write(b, 0, i);
		}
		//  
		outp.flush();
		//要加以下两句话，否则会报错  
		//java.lang.IllegalStateException: getOutputStream() has already been called for //this response    
		out.clear();
		out = pageContext.pushBody();
	} catch (Exception e) {
		System.out.println("Error!");
		e.printStackTrace();
	} finally {
		if (in != null) {
			in.close(); 
			in = null;
		}
		//这里不能关闭    
		//if(outp != null)  
		//{  
		//outp.close();  
		//outp = null;  
		//}  
	}
%>
