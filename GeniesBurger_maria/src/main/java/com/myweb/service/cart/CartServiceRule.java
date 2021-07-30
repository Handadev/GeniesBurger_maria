package com.myweb.service.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartServiceRule {
	public int register(CartVO cartvo);
	public List<CartVO> getList(int mno);
	public int remove(int cartno);
	public int removeWithPno(int pno);
	public int increQty(int cartno, String upqtystr);
	public int decreQty(int cartno, String downqtystr);
	public boolean dupleCheck(int pno, int mno);
	public int increRegister(int pno, int mno);
	public List<CartVO> payment(int mno);
	public int removeWithMno(int mno);
	public List<CartVO> getOrderList(int mno);
}
