package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.vo.User2;
import com.opensymphony.xwork2.ActionSupport;

public class GetUserStructure extends ActionSupport {
	
	private String u_id;
	private String permission;
	private String dept;
	private String group;
	
	HashMap<String,String> map=new HashMap<String, String>();//请求参数map
	HashMap<String,Object> salerMap=new HashMap<String, Object>();//销售（id realname）map
	HashMap<String,Object> groupMap=new HashMap<String, Object>();//小部map
	HashMap<String,Object> deptMap=new HashMap<String, Object>();//大部map
	
	/**
	 * 经理级别账号-加载页面中销售select
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String loadsaler(){
		List<User2> salerdata=new ArrayList<User2>();
		map.put("u_id", u_id);
		map.put("permission", permission);
		try {
			salerdata=IbatisConnectionFactory.getSqlMapClient().queryForList("loadsaler", map);
			salerMap.put("result", "success");
			salerMap.put("info", salerdata);
		}catch (SQLException e){
			e.printStackTrace();
			salerMap.put("result", "error");
		}
		return SUCCESS;
	}
	
	/**
	 * 高经级别账号-加载小部select
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String loadgroup(){
		map.put("u_id", u_id);
		map.put("permission", permission);
		System.out.println("map---"+map);
		List<String> list=new ArrayList<String>();
		try {
			list= IbatisConnectionFactory.getSqlMapClient().queryForList("loadgroup", map);
			System.out.println("list-"+list);
			groupMap.put("info", list);
			groupMap.put("result", "success");
		} catch (SQLException e) {
			groupMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 总监级别账号--加载大部select
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String loaddept(){
		map.put("u_id", u_id);
		map.put("permission", permission);
		List<String> list=new ArrayList<String>();
		try {
			list= IbatisConnectionFactory.getSqlMapClient().queryForList("loaddept", map);
			System.out.println("list-"+list);
			deptMap.put("info", list);
			deptMap.put("result", "success");
		} catch (SQLException e) {
			deptMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 大部select选择改变时
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String changedept(){
		map.put("u_id", u_id);
		map.put("permission", permission);
		map.put("dept", dept);
		List<String> list=new ArrayList<String>();
		try {
			list= IbatisConnectionFactory.getSqlMapClient().queryForList("loadgroup", map);
			groupMap.put("info", list);
			System.out.println("deptlist-"+list);
			groupMap.put("result", "success");
		} catch (SQLException e) {
			groupMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String changegroup(){
		map.put("u_id", u_id);
		map.put("permission", permission);
		map.put("dept", dept);
		map.put("group",group);
		List<User2> salerdata=new ArrayList<User2>();
		try {
			salerdata=IbatisConnectionFactory.getSqlMapClient().queryForList("loadsaler", map);
			salerMap.put("info", salerdata);
			salerMap.put("result", "success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			salerMap.put("result", "error");
		}
		  return SUCCESS;
	}
	
	public HashMap<String, Object> getSalerMap() {
		return salerMap;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getU_id() {
		return u_id;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getPermission() {
		return permission;
	}
	public HashMap<String, Object> getGroupMap() {
		return groupMap;
	}
	public HashMap<String, Object> getDeptMap() {
		return deptMap;
	}
}
