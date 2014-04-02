package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.opensymphony.xwork2.ActionSupport;
public class LinkageAction extends ActionSupport {
	private String company;
	private String dept;
	private String group;
	
	public String reg_changeDept(){
		System.out.println("company-"+company+" dept-"+dept);
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("dept", dept);
		map.put("company", company);
		List<String> list=new ArrayList<String>();
		try {
			list= IbatisConnectionFactory.getSqlMapClient().queryForList("selectGroup", map);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("list--"+list.toString());
		JSONArray jsonArray=new JSONArray();
		for(int i=0;i<list.size();i++){
			JSONObject jo=new JSONObject();
			jo.put("group", list.get(i));
			jsonArray.add(jo);
		}
		group=jsonArray.toString();
		System.out.println("--dept--"+group);
		return SUCCESS;
		
	}
	
	public String reg_changCompany(){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("company", company);
		List<String> list=new ArrayList<String>();
		try {
			list= IbatisConnectionFactory.getSqlMapClient().queryForList("selectDept", map);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		JSONArray jsonArray=new JSONArray();
		for(int i=0;i<list.size();i++){
			JSONObject jo=new JSONObject();
			jo.put("dept", list.get(i));
			jsonArray.add(jo);
		}
		dept=jsonArray.toString();
		return SUCCESS;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
}
