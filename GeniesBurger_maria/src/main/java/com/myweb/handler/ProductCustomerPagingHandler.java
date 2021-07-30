package com.myweb.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;

public class ProductCustomerPagingHandler {
	private static Logger logger = LoggerFactory.getLogger(ProductCustomerPagingHandler.class);
	private int totalCount; // 글의 총 개수
	private int firstPageIndex; // 현재 페이지네이션의 가장 앞 번호
	private int lastPageIndex; // 현재 페이지네이션의 가강 뒷 번호
	private boolean prev, next; // 앞, 뒤 단위로 이동하는 버튼의 생성 여부
	private ProductCustomerPageVO pcpgvo; 
	
	public ProductCustomerPagingHandler() {
	}

	// 두 개의 값만 추가하면 나머지 전역 변수를 계산해주는 생성자를 만든다
	public ProductCustomerPagingHandler(int totalCount, ProductCustomerPageVO pcpgvo) {
		this.totalCount = totalCount;
		this.pcpgvo = pcpgvo;
		
		
		//ex 17번의 페이지 인덱스 클릭(pgvo 안에 들어있음)
		// 첫번째 페이지 11 마지막 페이지 20
		// 17/10.0 = 1.7 > ceil(1.7) > 2.0 > int(2.0) > 2 * 10 > 20 마지막 번호
		this.lastPageIndex = (int)(Math.ceil(pcpgvo.getPageIndex()/10.0)) * 10;
		// firstpage = lastpage - 9
		this.firstPageIndex = this.lastPageIndex - 9;
		// 마지막쯤으로 가면 그냥 계산한 lastPageIndex보다 실제 글의 개수가 적 수도 있기 때문에
		// 직접 계산을 해야될 때가 온다
		// 글의 총 개수가 145번 이고 한 페이지에 글이 10개씩 들어간다면
		// 마지막 페이지네이션의 번호는 15번이어야한다
		int realLastPageIndex = (int)(Math.ceil((totalCount*1.0)/pcpgvo.getCountPerPage()));
		
		// 계산으로 만들어진 마지막 페이지 인덱스 번호가 
		// 실제 존재하는 글 수로 계산한 마지막 페이지 네이션의 번호보다 큰 경우
		// 조정을 해줘야함
		if(this.lastPageIndex >= realLastPageIndex) {
			this.lastPageIndex = realLastPageIndex;
		}
		
		// 이전으로 가기 다음으로 가기 버튼이 있어야하는 조건
		this.prev = firstPageIndex > 1;
		this.next = this.lastPageIndex < realLastPageIndex;
		logger.info(">>>>>>>>>>>>"+
					"글의 총 개수 = "+this.totalCount+"/"+
					"첫 번째 페이지 인덱스 = "+this.firstPageIndex+"/"+
					"몇 번째 페이지인지 = "+pcpgvo.getPageIndex()+"/"+
					"마지막 페이지 인덱스 = "+this.lastPageIndex+"/"+
					"검색범위 = "+pcpgvo.getRange()+"/"+
					"검색어 = "+pcpgvo.getKeyword());
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getFirstPageIndex() {
		return firstPageIndex;
	}

	public void setFirstPageIndex(int firstPageIndex) {
		this.firstPageIndex = firstPageIndex;
	}

	public int getLastPageIndex() {
		return lastPageIndex;
	}

	public void setLastPageIndex(int lastPageIndex) {
		this.lastPageIndex = lastPageIndex;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public ProductCustomerPageVO getPcpgvo() {
		return pcpgvo;
	}

	public void setPcpgvo(ProductCustomerPageVO pcpgvo) {
		this.pcpgvo = pcpgvo;
	}


	
}
