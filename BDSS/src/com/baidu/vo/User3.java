package com.baidu.vo;

public class User3 {

	private int id;
	private String username;
	private String realname;
	
	private String company;
	private String dept;
	private String mygroup;
	private int permission;

	private int  onJob;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}


	public String getMygroup() {
		return mygroup;
	}

	public void setMygroup(String mygroup) {
		this.mygroup = mygroup;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public int getOnJob() {
		return onJob;
	}
	public void setOnJob(int onJob) {
		this.onJob = onJob;
	}
}
