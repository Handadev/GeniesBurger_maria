package com.myweb.persistence.add_extra;


import java.util.List;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;

public interface AddExtraDAORule {
	public void insert(AddExtraVO aevo);
	public int delete(int cartno); // 주문 성공시 해당 add_extra 삭제 
	public List<AddExtraVO> selectList(int mno, int pno); // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해 cartno없는 정보 가져옴
	public List<AddExtraVO> selectAddExtraList(CartVO cartvo); // 카트리스트,payment,결제완료에서 cartvo와 연동되는 add_extra 정보 가져옴
	public void deletePno(int mno, int pno); // 주문 취소한 제품 AE만 지우기
	public int deleteFromCart(int cartno); // 카트에서 상품 삭제시 해당 AE지우기
	public int updateCartno(CartVO cartvo); // 최근 추가된 cartno mno pno 받아와서 tbl_AE cartno 컬럼 수정하기
	public int updateQty(int cartno, int num); // 카트에서 상품 수량을 변경하면 crtno연동된 add_extra 수량 동일변경
}	
