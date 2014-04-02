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

public class SalesRecordAction2 extends ActionSupport{
	private HashMap<String,Object> datamap;
	private HashMap<String,Object> ACPMap;
	private HashMap<String,Object> notesMap;
	
	private String date;
	private String companyname;
	private String querytype;
	private String phone;
	private String linkman;
	private String pxyz;
	private String intention;
	private String industry;
	private String u_id;
	private String permission;
	private int pagebegin;
	private String dept;
	private String group;
	private int saler;
	
	@Override
	public String toString(){
		return "SalesRecordAction2 [datamap=" + datamap + ", date=" + date
				+ ", companyname=" + companyname + ", querytype=" + querytype
				+ ", phone=" + phone + ", linkman=" + linkman + ", pxyz="
				+ pxyz + ", intention=" + intention + ", industry=" + industry
				+ ", u_id=" + u_id + ", permission=" + permission
				+ ", pagebegin=" + pagebegin + "]";
	}
	
	@SuppressWarnings("unchecked")
	public String getACPInfos(){
		ACPMap=new HashMap<String,Object>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		if(date!=null&&!"".equals(date.trim())){
			System.out.println("date--"+date);
				String[] dates=date.split("-");
				System.out.println("--dates"+dates[0]+dates[1]);
				map.put("date1", dates[0].replace("/", "-"));
				map.put("date2", dates[1].replace("/", "-"));
		}
		System.out.println("companyname---"+companyname);
		map.put("companyname", companyname);
		map.put("u_id", u_id);
		map.put("premission", permission);
		map.put("pagebegin", pagebegin*10);
		map.put("pagecount", 10);
		map.put("accomplished", 1);
		map.put("querytype", querytype);//公司名称精确查询
		map.put("sort_flag", 0);//按录入时间排序
		int count=0;
		List<SalesRecord2> list = new ArrayList<SalesRecord2>();
		try {
			count=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getSalesRecordsCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("getSalesRecords", map);
			ACPMap.put("totlecount", count);
			ACPMap.put("info", list);
			ACPMap.put("result", "success");
			System.out.println("datamap--"+ACPMap);
		}catch (Exception e) {
			e.printStackTrace();
			ACPMap.put("result", "error");
		}
		if(list!=null){
			ACPMap.put("success", true);
		}else {
			ACPMap.put("success", false);
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String selectInfos() throws Exception {
		System.out.println(this.toString());
		datamap=new HashMap<String, Object>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		
		if(date!=null&&!"".equals(date.trim())){
			System.out.println("date--"+date);
				String[] dates=date.split("-");
				System.out.println("--dates"+dates[0]+dates[1]);
				map.put("date1", dates[0].replace("/", "-"));
				map.put("date2", dates[1].replace("/", "-"));
		}
		
		map.put("companyname", companyname);
		map.put("phone", phone);
		map.put("linkman", linkman);
		map.put("sort_flag", pxyz);//排序原则
		map.put("intention", intention);
		map.put("industry", industry);
		map.put("u_id", u_id);
		map.put("querytype", querytype);
		map.put("premission", permission);
		map.put("pagebegin", pagebegin*10);
		map.put("pagecount", 10);
		map.put("dept", dept);
		map.put("group", group);
		map.put("salerid", saler);
		map.put("accomplished", 0);
		System.out.println("---selectmap"+map);

		if("3".equals(permission)){
			String path=Values.XMLPath+"//"+u_id+".xml";
			File foder = new File(Values.XMLPath);
			if(!foder.exists()){
				foder.mkdirs();//多级目录
			}
			DoXML doxml=new DoXML(path, Values.XMLRoot);
			doxml.writeXML(map);
		}
		
		int count=0;
		List<SalesRecord2> list = new ArrayList<SalesRecord2>();
		try {
			count=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getSalesRecordsCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("getSalesRecords", map);
			datamap.put("totlecount", count);
			datamap.put("info", list);
			datamap.put("result", "success");
			System.out.println("datamap--"+datamap);
		}catch (Exception e){
			datamap.put("result", "error");
			e.printStackTrace();
		}
		if(list!=null){
			datamap.put("success", true);
		}else {
			datamap.put("success", false);
		}
		return SUCCESS;
	}
	
	public String getNotes(){
		notesMap=new HashMap<String,Object>();
		
		List<Note2> list=new ArrayList<Note2>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		
		if(date!=null&&!"".equals(date.trim())){
			System.out.println("date--"+date);
				String[] dates=date.split("-");
				System.out.println("--dates"+dates[0]+dates[1]);
				map.put("date1", dates[0].replace("/", "-"));
				map.put("date2", dates[1].replace("/", "-"));
		}
		map.put("companyname", companyname);
		map.put("u_id", u_id);
		map.put("querytype", querytype);
		map.put("premission", permission);
		map.put("pagebegin", pagebegin*10);
		map.put("pagecount", 10);
		map.put("dept", dept);
		map.put("group", group);
		map.put("salerid", saler);
		map.put("accomplished", 0);
		
		try {
			int i=0;
			i=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("selectNotesCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("selectNotes", map);
			if(i==0){
				notesMap.put("result", "nodata");
			}else{
				notesMap.put("result", "success");
				notesMap.put("totlecount", i);
				notesMap.put("info", list);
			}
		} catch (SQLException e) {
			notesMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getNoNoteInfos(){
		datamap=new HashMap<String, Object>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("pagebegin", pagebegin*10);
		map.put("pagecount", 10);
		int count=0;
		List<SalesRecord2> list = new ArrayList<SalesRecord2>();
		try {
			count=(Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getNoNoteInfoCount", map);
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("getNoNoteInfo", map);
			datamap.put("totlecount", count);
			datamap.put("info", list);
			datamap.put("result", "success");
		}catch (SQLException e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public void setPagebegin(int pagebegin) {
		this.pagebegin = pagebegin;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public void setQuerytype(String querytype) {
		this.querytype = querytype;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public void setPxyz(String pxyz) {
		this.pxyz = pxyz;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public void setSaler(int saler) {
		this.saler = saler;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public HashMap<String, Object> getDatamap() {
		return datamap;
	}
	public HashMap<String, Object> getACPMap() {
		return ACPMap;
	}

	public HashMap<String, Object> getNotesMap() {
		return notesMap;
	}
	
}
