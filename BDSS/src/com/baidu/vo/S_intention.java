package com.baidu.vo;

public class S_intention {
	private int count;
	private String date;
	private String intention;
	
	@Override
	public String toString() {
		return "S_intention [count=" + count + ", date=" + date
				+ ", intention=" + intention + "]";
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
}
