package com.myweb.domain;


public class ProductCustomerPageVO {
	private String range; // 검색 범위
	private String keyword; // 검색어
	private int pageIndex; // 몇 번째 페이지네이션 번호인지
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄 것인지
	
	public ProductCustomerPageVO() {
		this(1, 12);
	}

	public ProductCustomerPageVO(int pageIndex, int countPerPage) {
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}

	public ProductCustomerPageVO(String range, String keyword, int pageIndex, int countPerPage) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
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
	
	
	
	
}
