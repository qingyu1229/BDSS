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
	//�����ļ�����ʱ�����ļ�������ķ�ʽ����   
	//����response.reset()
	//b�������еģ�>���治Ҫ���У��������һ����      

	String p=request.getRealPath("/");

	response.reset();//���Լ�Ҳ���Բ���  
	response.setContentType("application/x-download");
	
	String e_path=p+"\\demo.zip";//�����ļ���������excel�ļ�·�� 
	
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
		//Ҫ���������仰������ᱨ��  
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
		//���ﲻ�ܹر�    
		//if(outp != null)  
		//{  
		//outp.close();  
		//outp = null;  
		//}  
	}
%>
