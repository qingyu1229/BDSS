package com.baidu.vo;

import java.util.Date;

public class Note {
	private int id;
	private String content;
	private int SalesRecordId;
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSalesRecordId() {
		return SalesRecordId;
	}
	public void setSalesRecordId(int salesRecordId) {
		SalesRecordId = salesRecordId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Note(int id, String content, int salesRecordId, Date date) {
		super();
		this.id = id;
		this.content = content;
		SalesRecordId = salesRecordId;
		this.date = date;
	}
	
	public Note() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Note [id=" + id + ", content=" + content + ", SalesRecordId="
				+ SalesRecordId + ", date=" + date + "]";
	}
}
