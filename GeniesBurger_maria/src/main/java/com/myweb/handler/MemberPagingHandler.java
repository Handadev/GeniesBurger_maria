package com.myweb.handler;

import org.slf4j.LoggerFactory;

import com.myweb.domain.MemberPageVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MemberPagingHandler {
	private static Logger logger = LoggerFactory.getLogger(MemberPagingHandler.class);

	private int totalCount; // 글의 총 갯수
	private int fPageIndex; // 현재 페이지네이션의 가장 앞 번호
	private int lPageIndex; // 현재 페이지네이션의 가장 뒷 번호
	private boolean pBtn, nBtn; // 앞 뒤 단위로 이동하는 버튼의 생성 여부
	private MemberPageVO mpgvo;
	private int mno;
	
	
	public MemberPagingHandler() {}

	public MemberPagingHandler(int totalCount, MemberPageVO mpgvo) {
		this.totalCount = totalCount;
		this.mpgvo = mpgvo;
		// lastPageIndex logic
		// 15번을 클릭했다고 가정(페이지네이션)
		// 15/10.0 = 1.5
		// ceil(1.5) = 2.0
		// int(2.0) = 2
		// 2*10 = 20(last index)
		// 11~20 까지는 무조건 올림을 하여 last page를 20으로 만들어줌
		this.lPageIndex = (int)(Math.ceil(mpgvo.getPageIndex() / 10.0)) * 10;
		this.fPageIndex = this.lPageIndex - 9; 
		
		// 데이터 베이스에서 가져온 실제 글의 갯수를 기준으로 만들어져야 하는
		// last page의 번호
		int realLastPageIndex = (int) (Math.ceil((totalCount * 1.0) / 10));
		
		// 실제 총 글의 갯수가 136개 라고 가정
		// 마지막 페이지네이션의 번호는 14번
		
		// 연산에 의해서 만들어진 마지막 페이지 인덱스 번호가
		// 실제 존재하는 총 글의 수로 만든 페이지 번호보다 큰 경우
		// 조정을 해주어야 함.
		if(this.lPageIndex >= realLastPageIndex) {
			this.lPageIndex = realLastPageIndex;
		}
		
		this.pBtn = fPageIndex > 1; // 첫 번째 페이지가 1보다 클 경우에만 이전 버튼이 생김
		this.nBtn = this.lPageIndex < realLastPageIndex; // 마지막 페이지에 도달했을 경우 다음 버튼 없음
		
		logger.info("글의 총 갯수 :" + this.totalCount +
					"// 첫번째 페이지 : " + this.fPageIndex +
					"// 마지막 페이지 : " + this.lPageIndex +
					"// 검색범위 : " + mpgvo.getRange() + 
					"// 현재 페이지네이션 : " + mpgvo.getPageIndex()+
					"// 마지막 페이지 : " + this.lPageIndex +
					"// 검색범위 : " + mpgvo.getRange() +
					"// 검색어" + mpgvo.getKeyword());
	}
	
	public MemberPagingHandler(int totalCount, MemberPageVO mpgvo, int mno) {
		this.totalCount = totalCount;
		this.mpgvo = mpgvo;
		this.mno = mno;
		logger.info("paging handler >> mno : " + mno);
		// lastPageIndex logic
		// 15번을 클릭했다고 가정(페이지네이션)
		// 15/10.0 = 1.5
		// ceil(1.5) = 2.0
		// int(2.0) = 2
		// 2*10 = 20(last index)
		// 11~20 까지는 무조건 올림을 하여 last page를 20으로 만들어줌
		this.lPageIndex = (int)(Math.ceil(mpgvo.getPageIndex() / 10.0)) * 10;
		this.fPageIndex = this.lPageIndex - 9; 
		
		// 데이터 베이스에서 가져온 실제 글의 갯수를 기준으로 만들어져야 하는
		// last page의 번호
		int realLastPageIndex = (int) (Math.ceil((totalCount * 1.0) / 10));
		
		// 실제 총 글의 갯수가 136개 라고 가정
		// 마지막 페이지네이션의 번호는 14번
		
		// 연산에 의해서 만들어진 마지막 페이지 인덱스 번호가
		// 실제 존재하는 총 글의 수로 만든 페이지 번호보다 큰 경우
		// 조정을 해주어야 함.
		if(this.lPageIndex >= realLastPageIndex) {
			this.lPageIndex = realLastPageIndex;
		}
		
		this.pBtn = fPageIndex > 1; // 첫 번째 페이지가 1보다 클 경우에만 이전 버튼이 생김
		this.nBtn = this.lPageIndex < realLastPageIndex; // 마지막 페이지에 도달했을 경우 다음 버튼 없음
		
		logger.info("글의 총 갯수 :" + this.totalCount +
					"// 첫번째 페이지 : " + this.fPageIndex +
					"// 마지막 페이지 : " + this.lPageIndex +
					"// 검색범위 : " + mpgvo.getRange() + 
					"// 현재 페이지네이션 : " + mpgvo.getPageIndex()+
					"// 마지막 페이지 : " + this.lPageIndex +
					"// 검색범위 : " + mpgvo.getRange() +
					"// 검색어" + mpgvo.getKeyword());
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getfPageIndex() {
		return fPageIndex;
	}

	public void setfPageIndex(int fPageIndex) {
		this.fPageIndex = fPageIndex;
	}

	public int getlPageIndex() {
		return lPageIndex;
	}

	public void setlPageIndex(int lPageIndex) {
		this.lPageIndex = lPageIndex;
	}

	public boolean ispBtn() {
		return pBtn;
	}

	public void setpBtn(boolean pBtn) {
		this.pBtn = pBtn;
	}

	public boolean isnBtn() {
		return nBtn;
	}

	public void setnBtn(boolean nBtn) {
		this.nBtn = nBtn;
	}

	public MemberPageVO getMpgvo() {
		return mpgvo;
	}

	public void setMpgvo(MemberPageVO mpgvo) {
		this.mpgvo = mpgvo;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	
	

	
	
	
	
}






















