package com.baidu.vo;

import md5.DegistUtil;

public class User {
	private int id;
	private String username;
	private String realname;
	private String password;
	private String company;
	private String dept;
	private String group;
	private int permission=0;
	private int activation=0;
	private int  onJob=1;
	
	
	public User(){
		System.out.println("User对象被创建");
	}
	
	public int getOnJob() {
		return onJob;
	}
	public void setOnJob(int onJob) {
		this.onJob = onJob;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = DegistUtil.produceDegistCode(password);
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
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public int getActivation() {
		return activation;
	}
	public void setActivation(int activation) {
		this.activation = activation;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", realname="
				+ realname + ", password=" + password + ", company=" + company
				+ ", dept=" + dept + ", group=" + group + ", permission="
				+ permission + ", activation=" + activation + ", onJob="
				+ onJob + "]";
	}
	
	
}
