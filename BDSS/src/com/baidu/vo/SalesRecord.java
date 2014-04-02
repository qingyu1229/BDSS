package com.baidu.vo;

import java.sql.Date;

public class SalesRecord {
	private int id;//id
	private String companyname;//��˾����
	private String linkman;//��ϵ��
	private String phone;//�绰
	private String intention;//����
	private String dataSource;//������Դ
	private String industry;//��ҵ

	private String website;//��ַ
	private String fax;//����
	private String comment;//��ע
	private String address;//��˾��ַ

	private int salerId;//������id
	private Date date;//��Ϣ�������
	
	private String nextnotedate;
	private String town;
	
	private boolean accomplished=false;//�Ƿ��ѳɵ�
	private boolean repetition=false;//��Ϣ�Ƿ��빫�����ظ�
	
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
			this.website="��";
		}else{
			this.website = website;
		}
	
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		if(fax== null||fax.trim()==""){
			this.fax="��";
		}else{
			this.fax = fax;
		}
	
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		if(comment==null||comment.trim()==""){
			this.comment="��";
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
