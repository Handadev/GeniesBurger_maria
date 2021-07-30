package com.myweb.domain;

public class CouponVO {
	private int cpno;
	private String cpname;
	private int discount;
	
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "CouponVO [cpno=" + cpno + ", cpname=" + cpname + ", discount=" + discount
				+ "]";
	}
}
