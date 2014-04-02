package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class SafeValidate extends ActionSupport {
	private String company;
	private String dept;
	private String group;
	private String username;
	
	HashMap<String,Object> map=null;
	HashMap<String,Object> resultMap=null;
	
	public String SafeStep1(){
		map=new HashMap<String,Object>();
		resultMap=new HashMap<String,Object>();
		map.put("company", company);
		map.put("dept", dept);
		map.put("group", group);
		map.put("username", username);
		List<String> list=new ArrayList<String>();
		int u_id=0;
		try {
			if(IbatisConnectionFactory.getSqlMapClient().queryForObject("safe_getid", map)==null)
			{
				resultMap.put("result", "usererror");
			}
			else{
				u_id=(Integer)IbatisConnectionFactory.getSqlMapClient().queryForObject("safe_getid", map);
				list=IbatisConnectionFactory.getSqlMapClient().queryForList("getquestions", u_id);
				if(list.size()==0){
					resultMap.put("result", "noquest");
				}else{
					resultMap.put("result", "success");
					resultMap.put("u_id", u_id);
					resultMap.put("info", list);
				}
			}
			System.out.println(u_id+"--"+list);
		}catch(SQLException e){
			//System.out.println(e.toString());
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}
}
