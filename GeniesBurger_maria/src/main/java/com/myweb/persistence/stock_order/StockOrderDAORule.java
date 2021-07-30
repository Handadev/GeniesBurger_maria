package com.myweb.persistence.stock_order;

import java.util.List;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderPageVO;
import com.myweb.domain.StockOrderVO;

public interface StockOrderDAORule {
	public int insert(StockOrderVO sovo); // 재고 주문
	public int totalCount(StockOrderPageVO sopgvo);
	public List<StockOrderVO> selectDateList(StockOrderPageVO sopgvo);
}
