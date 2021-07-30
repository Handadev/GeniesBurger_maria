package com.myweb.domain;

public class CouponPageVO {
	private String range; // 검색범위
	private String keyword; // 검색어
	private int pageIndex; // 몇 번째 페이지네이션 번호인지?
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄지?
	
	public CouponPageVO() {
		this(1,10);
	} 
	public CouponPageVO(int pageIndex, int countPerPage) { // paging
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	public CouponPageVO(String range, String keyword) { // search
		this.range = range;
		this.keyword = keyword;
	}
	
	public CouponPageVO( int pageIndex, String range, String keyword) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}
	public CouponPageVO(String range, String keyword, int pageIndex, int countPerPage) { // paging + search
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
