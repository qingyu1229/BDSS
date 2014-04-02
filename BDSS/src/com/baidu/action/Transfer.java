package com.baidu.action;

import java.sql.SQLException;
import java.util.HashMap;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class Transfer extends ActionSupport {
	private int s_id;
	private int s_id2;
	private HashMap<String,String> resultMap=new HashMap<String,String>();
	
	public String transfer(){
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("s_id", s_id);
		map.put("s_id2",s_id2);
		try {
			
			int count=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getRecordCount", s_id);
			if(count>0){
				int i= IbatisConnectionFactory.getSqlMapClient().update("transfer",map);
				System.out.println(i+"--");
				if(i>0){
					resultMap.put("result", "success");
				}
			}else{
				resultMap.put("result", "nodata");
			}
		} catch (SQLException e){
			resultMap.put("result","error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public int getS_id(){
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getS_id2() {
		return s_id2;
	}
	public void setS_id2(int s_id2) {
		this.s_id2 = s_id2;
	}
	public HashMap<String, String> getResultMap() {
		return resultMap;
	}
}
