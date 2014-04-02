package com.baidu.test;

import com.baidu.action.AddByExcel;

public class Test1 {
	public static void main(String[] args) {
		AddByExcel ae=new AddByExcel();
		String path="D:\\development\\apache-tomcat-7.0.26\\webapps\\BDSS\\ExcelFiles\\79.xls";
		ae.saveInfo(path, 79);
		
	}
}
