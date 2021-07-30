package com.myweb.service.add_extra;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;
import com.myweb.persistence.add_extra.AddExtraDAORule;

@Service
public class AddExtraService implements AddExtraServiceRule {
	private static Logger logger = LoggerFactory.getLogger(AddExtraService.class);

	@Inject
	private AddExtraDAORule aedao;
	
	
	@Override
	public void register(AddExtraVO aevo) {
		aedao.insert(aevo);
	}

	@Override
	public int remove(int cartno) {
		return aedao.delete(cartno);
	}

	@Override // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해 cartno없는 정보 가져옴
	public List<AddExtraVO> getList(int mno, int pno) {
		return aedao.selectList(mno, pno);
	}
	
	@Override // 카트리스트,payment,결제완료에서 cartvo와 연동되는 add_extra 정보 가져옴
	public List<AddExtraVO> getAddExtraList(CartVO cartvo) {
		return aedao.selectAddExtraList(cartvo);
	}

	@Override // 주문 취소한 제품 AE만 지우기
	public void removePno(int mno, int pno) {
		aedao.deletePno(mno, pno);
	}

}