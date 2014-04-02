package com.baidu.action;

import java.sql.SQLException;
import java.util.HashMap;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.imp.SalesRecordImp;
import com.baidu.vo.SalesRecord;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SalesRecordAction extends ActionSupport implements ModelDriven<SalesRecord>{
	
	private SalesRecordImp srd=new SalesRecordImp();
	private SalesRecord sr=new SalesRecord();
	private int s_id;
	
	HashMap<String,Object> salesReocrdMap=new HashMap<String, Object>();
	HashMap<String,String> resultMap=new HashMap<String, String>();
	
	/**
	 * 根据ID查询客户信息
	 * @return
	 */
	public String getSalesRecorById(){
		SalesRecord sr=new SalesRecord();
		try {
		    sr=(SalesRecord) IbatisConnectionFactory.getSqlMapClient().queryForObject("selectSalesRecord", s_id);
		    salesReocrdMap.put("result", "success");
		    salesReocrdMap.put("info", sr);
		} catch (SQLException e) {
			e.printStackTrace();
			salesReocrdMap.put("result", "error");
		}
		return SUCCESS;
	}
	
	/**
	 * 添加客户信息
	 * @return
	 */
	public String add(){
		boolean bl=srd.add(sr);
		if(bl){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	/**
	 * 修改客户信息
	 * @return
	 */
	public String modifyInfo(){
		resultMap.put("result", srd.modify(sr));
		return SUCCESS;
	}
	
	public String chengdan(){
		resultMap.put("result",srd.chengdan(s_id));
		return SUCCESS;
	}
	
	public HashMap<String, String> getResultMap() {
		return resultMap;
	}
	public void setSrd(SalesRecordImp srd) {
		this.srd = srd;
	}
	public void setSr(SalesRecord sr) {
		this.sr = sr;
	}
	public SalesRecord getModel() {
		return sr;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public HashMap<String, Object> getSalesReocrdMap() {
		return salesReocrdMap;
	}
}
