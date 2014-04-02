package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class Safe extends ActionSupport {
	private int u_id;
	private String wt1;
	private String wt2;
	private String wt3;
	private String da1;
	private String da2;
	private String da3;
	private HashMap<String,String> addMap;
	private HashMap<String,Object> resultMap;
	private HashMap<String,Object> map=new HashMap<String,Object>();
	
	public String addSafeQuestion(){
		addMap=new HashMap<String, String>();
		List<HashMap> list=new ArrayList<HashMap>(); 
		map.put("u_id", u_id);
	
		HashMap<String,Object>	map1=new HashMap<String,Object>();
			map1.put("wt", wt1);
			map1.put("da", da1);
			map1.put("u_id", u_id);
			list.add(map1);
		HashMap<String,Object>	map2=new HashMap<String,Object>();
			map2.put("wt", wt2);
			map2.put("da", da2);
			map2.put("u_id", u_id);
			list.add(map2);
		HashMap<String,Object>	map3=new HashMap<String,Object>();
			map3.put("wt", wt3);
			map3.put("da", da3);
			map3.put("u_id", u_id);
			list.add(map3);
	
		SqlMapClient sqlmapClient=IbatisConnectionFactory.getSqlMapClient();
		try {
			sqlmapClient.startTransaction();
			sqlmapClient.delete("deleteSafeQuestion", map);
			for(int i=0;i<3;i++){
				sqlmapClient.insert("addSafe", list.get(i));
			}
			sqlmapClient.commitTransaction();
			addMap.put("result", "success");
		} catch (SQLException e) {
			e.printStackTrace();
			addMap.put("result", "error");
		}finally{
			try {
				sqlmapClient.endTransaction();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 return SUCCESS;
	}
	
	public String fire(){
		resultMap=new HashMap<String,Object>();
		try {
			int i= IbatisConnectionFactory.getSqlMapClient().update("fire", u_id);
			if(i>0){
				resultMap.put("result", "success");
			}else{
				resultMap.put("result", "error");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			resultMap.put("result", "error");
		}
		return SUCCESS;
	}
	
	public String checkAnswer(){
		resultMap=new HashMap<String,Object>();
		List<HashMap<String,Object>> list=new ArrayList<HashMap<String,Object>>(); 
		HashMap<String,Object>	map1=new HashMap<String,Object>();
		map1.put("wt", wt1);
		map1.put("da", da1);
		map1.put("u_id", u_id);
		list.add(map1);
		HashMap<String,Object>	map2=new HashMap<String,Object>();
		map2.put("wt", wt2);
		map2.put("da", da2);
		map2.put("u_id", u_id);
		list.add(map2);
		HashMap<String,Object>	map3=new HashMap<String,Object>();
		map3.put("wt", wt3);
		map3.put("da", da3);
		map3.put("u_id", u_id);
		list.add(map3);
		SqlMapClient sqlmapClient=IbatisConnectionFactory.getSqlMapClient();
		int count=0;
		try {
			for(int i=0;i<3;i++)
			{
			   count+=(Integer)sqlmapClient.queryForObject("checkanswer", list.get(i));
			   System.out.println("-----"+count);
			}
			if(count==3){
				resultMap.put("result", "success");
				resultMap.put("u_id", u_id);
			}else{
				resultMap.put("result", "error");
			}
		}catch (SQLException e){
			resultMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public HashMap<String, String> getAddMap() {
		return addMap;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public void setWt1(String wt1) {
		this.wt1 = wt1;
	}
	public void setWt2(String wt2){
		this.wt2 = wt2;
	}
	public void setWt3(String wt3) {
		this.wt3 = wt3;
	}
	public void setDa1(String da1) {
		this.da1 = da1;
	}
	public void setDa2(String da2) {
		this.da2 = da2;
	}
	public void setDa3(String da3) {
		this.da3 = da3;
	}
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}
}
