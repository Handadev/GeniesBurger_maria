package com.myweb.domain;

public class CouponListVO {
	private int cplno;
	private int cpno;
	private String cpname;
	private int mno;
	private String email;
	private String enddate;
	private int discount;
	
	public int getCplno() {
		return cplno;
	}
	public void setCplno(int cplno) {
		this.cplno = cplno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCpno() {
		return cpno;
	}
	public void setCpno(int cpno) {
		this.cpno = cpno;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
}
