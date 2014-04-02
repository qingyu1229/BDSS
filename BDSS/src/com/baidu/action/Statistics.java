package com.baidu.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.vo.S_intention;
import com.opensymphony.xwork2.ActionSupport;

public class Statistics extends ActionSupport {
	private int u_id;
	private int permission;
	private String date;
	HashMap<String,Object> map;
	HashMap<String,Object> resultMap;
		
	@SuppressWarnings("unchecked")
	public String statistics(){
		map=new HashMap<String,Object>();
		resultMap=new HashMap<String,Object>();
		int t_count=0,Acount=0,Bcount=0,Ccount=0,Dcount=0,acc_count=0;
		if(date!=null&&!"".equals(date.trim())){
			System.out.println("date--"+date);
				String[] dates=date.split("-");
				System.out.println("--dates"+dates[0]+dates[1]);
				map.put("date1", dates[0].replace("/", "-"));
				map.put("date2", dates[1].replace("/", "-"));
		}
		map.put("u_id", u_id);
		map.put("permission", permission);
	
		List<S_intention> list=new ArrayList<S_intention>();
		try {
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("statistics_intention", map);
			acc_count=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("statistics_acc", map);
			for(int i=0;i<list.size();i++){
				//System.out.println(list.get(i).toString());
				S_intention cell=list.get(i);
				t_count+=cell.getCount();
				if("A".equals(cell.getIntention())){
					Acount+=cell.getCount();
				}else if("B".equals(cell.getIntention())){
					Bcount+=cell.getCount();
				}
				else if("C".equals(cell.getIntention())){
					Ccount+=cell.getCount();
				}
				else if("D".equals(cell.getIntention())){
					Dcount+=cell.getCount();
				}
			}
			if(t_count!=0){
				resultMap.put("result","success");
				resultMap.put("t_count",t_count);
				resultMap.put("Acount",Acount);
				resultMap.put("Bcount",Bcount);
				resultMap.put("Ccount",Ccount);
				resultMap.put("Dcount",Dcount);
				resultMap.put("acc_count",acc_count);
				resultMap.put("rate",String.format("%.2f", acc_count*100/(double)t_count));
			}else{
				resultMap.put("result","nodata");
			}
		} catch (SQLException e){
			resultMap.put("result","error");
			e.printStackTrace();
		}
		System.out.println("t_count-"+t_count+"  Acount-"+Acount+"  " +
				"Bcount-"+Bcount+"  Ccount-"+Ccount+"  Dcount-"+Dcount);
		return SUCCESS;
	}
	
	/*public static void main(String[] args){
		Statistics s=new Statistics();
		s.s_intention();
	}*/
	
	public int getU_id() {
		return u_id;
	}
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
