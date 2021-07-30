package com.myweb.persistence.purchase;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;

@Repository
public class PurchaseDAO implements PurchaseDAORule {
	private static Logger logger = LoggerFactory.getLogger(PurchaseDAO.class);
	private final String NS = "PurchaseMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(PurchaseVO purvo) {
		int mno = purvo.getMno();
		int cartno = purvo.getCartno();
		int pno = purvo.getPno();
		String title = purvo.getTitle();
		int price = purvo.getPrice();
		int quantity = purvo.getQuantity();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cartno", cartno);
		map.put("pno", pno);
		map.put("title", title);
		map.put("price", price);
		map.put("quantity", quantity);
		return sql.insert(NS+"reg", map);
	}

	@Override
	public List<PurchaseVO> selectList(MemberPageVO mpgvo) {
		return sql.selectList(NS+"totalList", mpgvo);
	}
	@Override
	public List<PurchaseVO> selectList(MemberPageVO mpgvo, int mno) {
		Map<String, Object> map = new HashMap<String, Object>();
		String range = mpgvo.getRange();
		String keyword = mpgvo.getKeyword();
		int pageIndex = mpgvo.getPageIndex();
		int countPerPage = mpgvo.getCountPerPage();
		map.put("range", range);
		map.put("keyword", keyword);
		map.put("pageIndex", pageIndex);
		map.put("countPerPage", countPerPage);
		map.put("mno", mno);
		return sql.selectList(NS+"totalListMember", map);
	}

	@Override
	public int getTotalCount(MemberPageVO mpgvo) {
		return sql.selectOne(NS+"tc", mpgvo);
	}
	
	@Override
	public int getTotalCount(MemberPageVO mpgvo, int mno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mpgvo", mpgvo);
		map.put("mno", mno);
		return sql.selectOne(NS+"tcMember", map);
	}

	@Override
	public int selectDateSales(String todayString) {
		return sql.selectOne(NS + "dateSales", todayString);
	}

	@Override
	public int selectMonthSales(String monthString) {
		return sql.selectOne(NS + "monthSales", monthString);
	}

	@Override
	public List<PurchaseVO> selectSalesRateList(String monthString) {
		return sql.selectList(NS + "productSalesRate", monthString);
	}

  @Override
	public Integer selectWeekSales(String month, int i) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		map.put("i", i);
		return sql.selectOne(NS + "weekSales", map);
  }
  
  @Override
	public int selectYearSales(String yearString) {
		return sql.selectOne(NS + "yearSalesList", yearString);
	}

}
