package com.myweb.domain;

public class StockOrderPageVO {
	private String order_date;
	private String range; // 검색범위
	private String keyword; // 검색어
	private int pageIndex; // 몇 번째 페이지네이션 번호인지?
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄지?
	
	public StockOrderPageVO() {
		this(1,10);
	} 
	public StockOrderPageVO(int pageIndex, int countPerPage) { // paging
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	public StockOrderPageVO(String order_date) {
		this.order_date = order_date;
	}
	public StockOrderPageVO(String range, String keyword) { // search
		this.range = range;
		this.keyword = keyword;
	}
	
	public StockOrderPageVO(String order_date, int pageIndex) {
		this.order_date = order_date;
		this.pageIndex = pageIndex;
	}
	
	public StockOrderPageVO(String order_date, String range, String keyword, int pageIndex) {
		this.order_date = order_date;
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}
	public StockOrderPageVO( int pageIndex, String range, String keyword) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}
	
	public StockOrderPageVO(String order_date, String range, String keyword, int pageIndex, int countPerPage) {
		this.order_date = order_date;
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	public StockOrderPageVO(String range, String keyword, int pageIndex, int countPerPage) { // paging + search
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
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	
}
