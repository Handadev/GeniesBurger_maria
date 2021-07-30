package com.myweb.domain;


public class MemberPageVO {
	private String range; // 검색 범위
	private String keyword; // 검색어
	private int pageIndex; // 내가 몇 번째 페이지를 클릭 했는지 ( 몇 번째 페이지네이션 번호인지?)
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄지
	private int mno;
	
	public MemberPageVO() {
		this(1, 10);
	}
	
	public MemberPageVO(String range, String keyword) {
		this.range = range;
		this.keyword = keyword;
	}

	public MemberPageVO(int pageIndex, int countPerPage) {
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	
	public MemberPageVO(String range, String keyword, int pageIndex) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}

	public MemberPageVO(String range, String keyword, int pageIndex, int countPerPage) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
	}
	// member
	public MemberPageVO(int mno, String range, String keyword, int pageIndex) {
		this.mno = mno;
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
	}

	public MemberPageVO(String range, String keyword, int pageIndex, int countPerPage, int mno) {
		this.range = range;
		this.keyword = keyword;
		this.pageIndex = pageIndex;
		this.countPerPage = countPerPage;
		this.mno = mno;
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

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "MemberPageVO [range=" + range + ", keyword=" + keyword + ", pageIndex=" + pageIndex + ", countPerPage="
				+ countPerPage + ", mno=" + mno + "]";
	}
}
