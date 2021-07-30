package com.myweb.domain;

import java.util.List;

public class ProductVO {
	private int pno;
	private String title;
	private String content;
	private int category; // 1 버거, 2버거세트, 3버거L세트, 4올데이킹, 5올데이킹세트, 6올데이킹L세트, 7사이드 , 8음료, 9햄버거추가재료
	private int price;
	private int calorie;
	private String regdate;
	private String moddate;
	private int sales; // 판매량
	private int cansale; // 일시품절용 - 0 판매 가능 / 1 판매 불가
	private int relate_pno; // 세트 상품 구성을 위한 단품 번호
	private List<ProductFileVO> flist;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getCansale() {
		return cansale;
	}
	public void setCansale(int cansale) {
		this.cansale = cansale;
	}
	public int getRelate_pno() {
		return relate_pno;
	}
	public void setRelate_pno(int relate_pno) {
		this.relate_pno = relate_pno;
	}
	public List<ProductFileVO> getFlist() {
		return flist;
	}
	public void setFlist(List<ProductFileVO> flist) {
		this.flist = flist;
	}
	
		
}
