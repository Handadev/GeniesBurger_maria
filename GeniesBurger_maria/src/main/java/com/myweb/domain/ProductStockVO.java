package com.myweb.domain;


public class ProductStockVO {
	private String sname;
	private int pno;
	
	
	public ProductStockVO() {
	}
	
	public ProductStockVO(String sname, int pno) {
		this.sname = sname;
		this.pno = pno;
	}

	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
}
