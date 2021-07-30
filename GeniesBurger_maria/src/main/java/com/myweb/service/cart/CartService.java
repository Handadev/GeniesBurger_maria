package com.myweb.service.cart;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;
import com.myweb.persistence.add_extra.AddExtraDAORule;
import com.myweb.persistence.cart.CartDAORule;

@Service
public class CartService implements CartServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CartService.class);

	@Inject
	private CartDAORule cartdao;
	
	@Inject
	private AddExtraDAORule aedao;
	
	@Transactional
	@Override
	public int register(CartVO cartvo) {
		int isUp = cartdao.insert(cartvo);
		if (isUp > 0 ) {
			CartVO cvo = cartdao.selectCurrCart();
			isUp = aedao.updateCartno(cvo);
		}
		return isUp;
	}

	@Override
	public List<CartVO> getList(int mno) {
		List<CartVO> list = new ArrayList<CartVO>();
		List<CartVO> clist =  cartdao.selectList(mno);
		for (CartVO cartvo : clist) {
			List<AddExtraVO> aelist = aedao.selectAddExtraList(cartvo);
			cartvo.setAelist(aelist);
			list.add(cartvo);
		}
		return list;
	}

	@Transactional
	@Override
	public int remove(int cartno) {
		return cartdao.delete(cartno) > 0 &&
				aedao.deleteFromCart(cartno) > 0 ?
				1 : 0;
	}
	
	@Override
	public int removeWithPno(int pno) {
		return cartdao.deleteWithPno(pno);
	}

	@Transactional
	@Override
	public int increQty(int cartno, String upqtystr) {
		return cartdao.upQty(cartno, Integer.parseInt(upqtystr)) > 0 &&
				aedao.updateQty(cartno, Integer.parseInt(upqtystr)) > 0 ?
				1 : 0;
	}

	@Transactional
	@Override
	public int decreQty(int cartno, String downqtystr) {
		return cartdao.downQty(cartno, Integer.parseInt(downqtystr)) > 0 &&
				aedao.updateQty(cartno, Integer.parseInt(downqtystr)) > 0 ?
				1 : 0;
	}

	// 카트 중복체크 기능 : 현재 사용 X
	@Override
	public boolean dupleCheck(int pno, int mno) {
		return cartdao.dupleProduct(pno, mno) > 0 ? true : false;
	}

	@Override
	public int increRegister(int pno, int mno) {
		int isUp = cartdao.upQtyDuple(pno, mno);
		logger.info("service increReg : " + isUp);
		return isUp;
	}

	@Override
	public List<CartVO> payment(int mno) {
		List<CartVO> list = new ArrayList<CartVO>();
		List<CartVO> clist =  cartdao.selectList(mno);
		for (CartVO cartvo : clist) {
			List<AddExtraVO> aelist = aedao.selectAddExtraList(cartvo);
			cartvo.setAelist(aelist);
			list.add(cartvo);
		}
		return list;
	}

	@Override
	public int removeWithMno(int mno) {
		return cartdao.deleteWithMno(mno);
	}

	@Override
	public List<CartVO> getOrderList(int mno) {
		return cartdao.selectOrderList(mno);
	}


	

}
