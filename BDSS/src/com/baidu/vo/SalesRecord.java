package com.baidu.vo;

import java.sql.Date;

public class SalesRecord {
	private int id;//id
	private String companyname;//公司名称
	private String linkman;//联系人
	private String phone;//电话
	private String intention;//意向
	private String dataSource;//数据来源
	private String industry;//行业

	private String website;//网址
	private String fax;//传真
	private String comment;//备注
	private String address;//公司地址

	private int salerId;//销售人id
	private Date date;//信息添加日期
	
	private String nextnotedate;
	private String town;
	
	private boolean accomplished=false;//是否已成单
	private boolean repetition=false;//信息是否与公共库重复
	
	public boolean isRepetition() {
		return repetition;
	}

	public void setRepetition(boolean repetition) {
		this.repetition = repetition;
	}

	public boolean isAccomplished() {
		return accomplished;
	}

	public void setAccomplished(boolean accomplished) {
		this.accomplished = accomplished;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getIntention() {
		return intention;
	}

	public void setIntention(String intention) {
		this.intention = intention;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getWebsite() {
		
		return website;
	}

	public void setWebsite(String website) {
		if(website==null||website.trim()==""){
			this.website="无";
		}else{
			this.website = website;
		}
	
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		if(fax== null||fax.trim()==""){
			this.fax="无";
		}else{
			this.fax = fax;
		}
	
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		if(comment==null||comment.trim()==""){
			this.comment="无";
		}else{
			this.comment = comment;
		}
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSalerId() {
		return salerId;
	}

	public void setSalerId(int salerId) {
		this.salerId = salerId;
	}

	public String getNextnotedate() {
		return nextnotedate;
	}

	public void setNextnotedate(String nextnotedate) {
		this.nextnotedate = nextnotedate;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public SalesRecord(int id, String companyname, String linkman,
			String phone, String intention, String dataSource, String industry,
			String website, String fax, String comment, String address,
			int salerId, Date date, boolean accomplished) {
		super();
		this.id = id;
		this.companyname = companyname;
		this.linkman = linkman;
		this.phone = phone;
		this.intention = intention;
		this.dataSource = dataSource;
		this.industry = industry;
		this.website = website;
		this.fax = fax;
		this.comment = comment;
		this.address = address;
		this.salerId = salerId;
		this.date = date;
		this.accomplished = accomplished;
	}

	public SalesRecord() {
	}
}
