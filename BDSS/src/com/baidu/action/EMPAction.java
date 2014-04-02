package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.vo.User3;
import com.opensymphony.xwork2.ActionSupport;

public class EMPAction extends ActionSupport{
	private int u_id;
	private int permission;
	private int pagebegin;
	private String dept;
	private int group;
	private int saler;
	private HashMap<String,Object> EMPInfoMap=null;
	private HashMap<String,Object> ActivationMap=null;
	
	public String selectNoActivation(){
		EMPInfoMap=new HashMap<String,Object>();
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("u_id", u_id);
		map.put("pagebegin", pagebegin*10);
		List<User3> list=new ArrayList<User3>();
		try {
			int i=0;
			i=(Integer)IbatisConnectionFactory.getSqlMapClient().queryForObject("selectNoACtivationCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("selectNoACtivation", map);
			if(list.size()>0&&i>0){
				EMPInfoMap.put("result", "success");
				EMPInfoMap.put("totlecount", i);
				EMPInfoMap.put("info", list);
			}else{
				EMPInfoMap.put("result", "nodata");
			}
		} catch (SQLException e){
			EMPInfoMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String activation(){
		ActivationMap=new HashMap<String,Object>();
		try {
		    int i=	IbatisConnectionFactory.getSqlMapClient().update("activation", u_id);
		    if(i>0){
		    	ActivationMap.put("result", "success");
		    }else{
		    	ActivationMap.put("result", "error");
		    }
		}catch (SQLException e) {
			ActivationMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getEMPInfos(){
		EMPInfoMap=new HashMap<String,Object>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("dept", dept);
		map.put("group", group);
		map.put("salerid", saler);
		map.put("permission", permission);
		map.put("pagebegin", pagebegin*10);
		List<User3> list=new ArrayList<User3>();
		try {
			System.out.println(map.toString());
			int i=0;
			i=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getEMPInfosCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("getEMPInfos", map);
			if(list.size()>0&&i>0){
				EMPInfoMap.put("result", "success");
				EMPInfoMap.put("totlecount", i);
				EMPInfoMap.put("info", list);
			}else{
				EMPInfoMap.put("result", "error");
			}
		} catch (SQLException e){
			EMPInfoMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public HashMap<String, Object> getActivationMap() {
		return ActivationMap;
	}
	public HashMap<String, Object> getEMPInfoMap() {
		return EMPInfoMap;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public void setPagebegin(int pagebegin) {
		this.pagebegin = pagebegin;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public void setSaler(int saler) {
		this.saler = saler;
	}
}