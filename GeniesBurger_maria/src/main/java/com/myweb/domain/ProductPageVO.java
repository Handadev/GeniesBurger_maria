package com.myweb.domain;

//여기에 페이징도 할꺼임
//vo보단 dto 객체에 가까운 느낌
public class ProductPageVO {
	private String range; // 검색 범위
	private String keyword; // 검색어
	private int pageIndex; // 몇 번째 페이지네이션 번호인지
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄 것인지
	
	public ProductPageVO() {
		this(1,10);
	}
	
	//페이징handdler
	public ProductPageVO(int pageIndex, int countPerPage) {
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}

	// comment 페이징
	public ProductPageVO(int pageIndex ,String range, String keyword) {
		this.pageIndex = pageIndex;
		this.range = range;
		this.keyword = keyword;
	}
	
	
	//검색 후에도 페이징이 되야함/ 병합이 된 상태도 필요함
	public ProductPageVO(String range, String keyword, int pageIndex, int countPerPage) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	
	
	public int getPageIndex() {
		return pageIndex;
	}


	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
