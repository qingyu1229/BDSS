package com.baidu.action;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.values.Values;
import com.baidu.vo.Note2;
import com.baidu.vo.SalesRecord2;
import com.baidu.xml.DoXML;
import com.opensymphony.xwork2.ActionSupport;

public class SalesRecordAction3 extends ActionSupport{
	private HashMap<String,String> datamap;
	private String companyname;
	private String phone;
	private String linkman;
	private String intention;
	private String industry;
	private String u_id;
	private String town;
	private String phone1;
	private String phone2;
	private String nextnotedate;
	private String address;
	private String dataSource;
	private String fax;
	private String website;
	private String comment;
	
	public String addRecord(){
		datamap=new HashMap<String,String>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		if(phone1!=null&&!"".equals(phone1.trim())){
			phone=phone+","+phone1;
		}
		if(phone2!=null&&!"".equals(phone2.trim())){
			phone=phone+","+phone2;
		}
		
		map.put("companyname", companyname);
		map.put("intention", intention);
		map.put("linkman", linkman);
		map.put("phone", phone);
		map.put("address", address);
		map.put("industry", industry);
		map.put("nextnotedate",nextnotedate);
		map.put("town",town);
		map.put("dataSource", dataSource);
		map.put("fax", fax);
		map.put("website", website);
		map.put("comment", comment);
		map.put("salerId", u_id);
		map.put("accomplished", 0);
		try {
			IbatisConnectionFactory.getSqlMapClient().insert("addRecord", map);
			datamap.put("result", "success");
		}catch (SQLException e){
			datamap.put("result", "error");
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public void setNextnotedate(String nextnotedate) {
		this.nextnotedate = nextnotedate;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}
	public void setFax(String fax) {
		if(fax== null||"".equals(fax.trim())){
			this.fax="нч";
			//System.out.println("fax is null");
		}else{
			this.fax = fax;
		}
		//System.out.println("fax-"+this.fax);
	}
	public void setWebsite(String website) {
		if(website==null||"".equals(website.trim())){
			this.website="нч";
			//System.out.println("website is null");
		}else{
			this.website = website;
		}
		///System.out.println("website-"+this.website);
	}
	public void setComment(String comment) {
		if(comment==null||"".equals(comment.trim())){
			this.comment="нч";
			//System.out.println("comment is null");
		}else{
			this.comment = comment;
		}
		//System.out.println("comment--"+this.comment);
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public HashMap<String, String> getDatamap() {
		return datamap;
	}
}
