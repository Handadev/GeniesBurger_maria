package com.myweb.service.product;

import java.util.List;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;

public interface ProductServiceRule {
	public int register(ProductVO pvo);
	public List<ProductVO> getList(ProductPageVO ppgvo); // 관리자 리스트
	public List<ProductVO> getList(ProductCustomerPageVO pcpvo); // 소비자 리스트 
	public List<ProductVO> getList(ProductVO pvo); // 상품등록시 세트 메뉴구성을 위한 단품 리스트
	public List<ProductAndFileDTO> getProductList(int pno, int category); // 소비자 - 단품 or 세트선택 화면리스트
	public ProductAndFileDTO getLargerProduct(int pno, int category); // 단품, 세트를 선택하면 세트 / 라지 세트로 바꾸는지 
	public List<ProductVO> getBurgerStockList(); // 3번 모달 추가 재료 리스트 출력
	public List<ProductVO> getSideList(); // 4번 모달 사이드 리스트 출력
	public List<ProductVO> getBeverageList(); // 5번 모달 사이드 리스트 출력
	public int updateProductQty(int pno, int qty); // cart ctrl 주문시 재품 판매량 높이기
	public ProductVO detail(int pno);
	public int getPno(String title); // 상품 결제시 AE에 있는 title을 가지고 pno를 출력해서 재고에서 빼야함
	public int modify(ProductVO pvo);
	public int remove(int pno);
	public int getCurrPno(); // 사진추가를 위한 현재 pno
	public int getTotalCount(ProductPageVO ppgvo); // 관리자 리스트 글의 개수 구하기
	public int getTotalCount(ProductCustomerPageVO pcpvo); // 소비자 리스트 글의 개수 구하기
	// 상품 등록시 재고 리스트 받아오기
	public List<StockVO> getList();

}
