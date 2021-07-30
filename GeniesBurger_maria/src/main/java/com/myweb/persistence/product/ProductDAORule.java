package com.myweb.persistence.product;

import java.util.List;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;

public interface ProductDAORule {
	public int insert(ProductVO pvo); // 추가
	public List<ProductVO> selectList(ProductPageVO ppgvo); // 관리자 상품 리스트
	public List<ProductVO> selectList(ProductCustomerPageVO pcpvo); // 소비자 상품 리스트
	public List<ProductVO> selectList(ProductVO pvo); // 세트 메뉴구성을 위한 단품 리스트
	public List<ProductAndFileDTO> selectList(int pno, int category); // 소비자 - 단품 or 세트선택 화면리스트
	public ProductAndFileDTO selectOne(int pno, int category); // 단품, 세트를 선택하면 세트 / 라지 세트로 바꾸는지
	public List<ProductVO> selectBurgerStockList(); // 3번 모달 추가 재료 리스트 출력
	public List<ProductVO> selectSideList(); // 4번 모달 사이드 리스트 출력
	public List<ProductVO> selectBeverageList(); // 5번 모달 음료 리스트 출력
	public int updateQty(int pno, int qty); // cart ctrl 주문시 재품 판매량 높이기
	public ProductVO selectOne(int pno); // detail
	public int selectPno(String title); // 상품 결제시 AE에 있는 title을 가지고 pno를 출력해서 재고에서 빼야함
	public int update(ProductVO pvo); 
	public int delete(int pno);
	public int selectOne(); // 사진추가를 위한 현재 pno
	public int selectOne(ProductPageVO ppgvo); // 관리자 리스트 글의 개수 구하기
	public int selectOne(ProductCustomerPageVO pcpvo); // 소비자 리스트 글의 개수 구하기
	// 상품 등록시 재고 리스트 받아오기
	public List<StockVO> selectList();
	
	/**
	 * 상품 구매시 카운트 올리기 ns+"salesup" 
	 */
}
