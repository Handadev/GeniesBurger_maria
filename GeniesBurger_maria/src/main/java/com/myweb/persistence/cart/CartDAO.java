package com.myweb.persistence.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CartVO;

@Repository
public class CartDAO implements CartDAORule {
	private static Logger logger = LoggerFactory.getLogger(CartDAO.class);
	private final String NS = "CartMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(CartVO cartvo) {
		return sql.insert(NS + "reg", cartvo);
	}

	@Override
	public int delete(int cartno) {
		return sql.delete(NS + "del", cartno);
	}
	
	@Override
	public int deleteWithPno(int pno) {
		return sql.delete(NS + "delWithPno", pno);
	}

	@Override
	public int upQty(int cartno, int upqtystr) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cartno", cartno);
		map.put("upno", upqtystr);
		return sql.update(NS + "upQty", map);
	}

	@Override
	public int downQty(int cartno, int downqtystr) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cartno", cartno);
		map.put("downno", downqtystr);
		return sql.update(NS + "downQty", map);
	}

	@Override
	public int dupleProduct(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sql.selectOne(NS + "dupleProduct", map);
	}

	@Override
	public int upQtyDuple(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sql.update(NS + "upQtyDuple", map);
	}

	@Override
	public List<CartVO> selectList(int mno) {
		return sql.selectList(NS+"pay", mno);
	}

	@Override
	public int deleteWithMno(int mno) {
		return sql.delete(NS+"complete", mno);
	}

	@Override
	public List<CartVO> selectOrderList(int mno) {
		return sql.selectList(NS+"ol", mno);
	}

	@Override // 카트에 제품 등록 후 add_extra 테이블에 cartno 제공을 위한 최근 No. 받아오기
	public CartVO selectCurrCart() {
		return sql.selectOne(NS+"currCart");
	}

	

}
