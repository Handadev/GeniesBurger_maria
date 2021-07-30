package com.myweb.domain;


public class ProductAndFileDTO {
	private int pno;
	private String content;
	private int category; // 1 버거, 2버거세트, 3버거L세트, 4올데이킹, 5올데이킹세트, 6올데이킹L세트, 7사이드 , 8음료
	private int price;
	private int relate_pno;
	private String puuid;
	private String savedir;
	private String fname;
	private String title;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public int getRelate_pno() {
		return relate_pno;
	}
	public void setRelate_pno(int relate_pno) {
		this.relate_pno = relate_pno;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public String getSavedir() {
		return savedir;
	}
	public void setSavedir(String savedir) {
		this.savedir = savedir;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
