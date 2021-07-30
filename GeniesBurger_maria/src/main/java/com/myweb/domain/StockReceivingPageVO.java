package com.myweb.domain;

public class StockReceivingPageVO {
	private String stock_regdate;
	private String range; // 검색범위
	private String keyword; // 검색어
	private int pageIndex; // 몇 번째 페이지네이션 번호인지?
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄지?
	
	public StockReceivingPageVO() {
		this(1,10);
	} 
	public StockReceivingPageVO(int pageIndex, int countPerPage) { // paging
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	public StockReceivingPageVO(String stock_regdate) {
		this.stock_regdate = stock_regdate;
	}
	public StockReceivingPageVO(String range, String keyword) { // search
		this.range = range;
		this.keyword = keyword;
	}
	
	public StockReceivingPageVO(String stock_regdate, int pageIndex) {
		this.stock_regdate = stock_regdate;
		this.pageIndex = pageIndex;
	}
	
	public StockReceivingPageVO(String stock_regdate, String range, String keyword, int pageIndex) {
		this.stock_regdate = stock_regdate;
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}
	public StockReceivingPageVO( int pageIndex, String range, String keyword) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}
	
	public StockReceivingPageVO(String stock_regdate, String range, String keyword, int pageIndex, int countPerPage) {
		this.stock_regdate = stock_regdate;
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	public StockReceivingPageVO(String range, String keyword, int pageIndex, int countPerPage) { // paging + search
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
	public String getStock_regdate() {
		return stock_regdate;
	}
	public void setStock_regdate(String stock_regdate) {
		this.stock_regdate = stock_regdate;
	}
	
}
