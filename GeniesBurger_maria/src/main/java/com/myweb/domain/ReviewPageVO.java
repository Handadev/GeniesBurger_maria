package com.myweb.domain;


public class ReviewPageVO {
	private int pageIndex; // 내가 몇 번째 페이지를 클릭 했는지 ( 몇 번째 페이지네이션 번호인지?)
	private int countPerPage; // 한 페이지에 몇 개의 글을 보여줄지
	
	public ReviewPageVO() {
		this(1, 10);
	}
	
	public ReviewPageVO(int pageIndex, int countPerPage) {
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

}
