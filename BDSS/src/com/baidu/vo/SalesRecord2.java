package com.baidu.vo;

public class SalesRecord2 {
	private String companyname;
	private String linkman;
	private String phone;
	private String date;
	private String nextnotedate;
	private int id;
	private String realname;
	private int repetition;
	private String intention;
	private String datasource;
	private String dept;
	private String _group;
	private String industry;
	
	
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String get_group() {
		return _group;
	}
	public void set_group(String _group) {
		this._group = _group;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public String getDatasource() {
		return datasource;
	}
	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}
	public int getRepetition() {
		return repetition;
	}
	public void setRepetition(int repetition) {
		this.repetition = repetition;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getNextnotedate() {
		return nextnotedate;
	}
	public void setNextnotedate(String nextnotedate) {
		if(nextnotedate==null){
			this.nextnotedate="2013-01-01";
		}else{
			this.nextnotedate = nextnotedate;
		}
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
}
