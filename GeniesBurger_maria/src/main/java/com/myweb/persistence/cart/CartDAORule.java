package com.myweb.persistence.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartDAORule {
	public int insert(CartVO cartvo); 
	public int delete(int cartno); 
	public int deleteWithPno(int pno);
	public int upQty(int cartno, int upqtystr); // 카트 수량 증가
	public int downQty(int cartno, int downqtystr); // 카트 수량 감소
	public int dupleProduct(int pno, int mno);
	public int upQtyDuple(int pno, int mno);
	public List<CartVO> selectList(int mno);  // 장바구니목록과 결제목록에서 같이사용
	public int deleteWithMno(int mno);
	public List<CartVO> selectOrderList(int mno);
	public CartVO selectCurrCart(); // 카트에 제품 등록 후 add_extra 테이블에 cartno 제공을 위한 최근 No. 받아오기
}
