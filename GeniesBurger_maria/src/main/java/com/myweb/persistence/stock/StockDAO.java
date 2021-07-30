package com.myweb.persistence.stock;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.StockReceivingPageVO;
import com.myweb.domain.StockVO;

@Repository
public class StockDAO implements StockDAORule {
	private static Logger logger = LoggerFactory.getLogger(StockDAO.class);
	private final String NS = "StockMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(StockVO svo) {
		return sql.insert(NS + "reg", svo);
	}

	@Override
	public List<StockVO> selectList() {
		return sql.selectList(NS + "list");
	}

	@Override
	public int update(StockVO svo) {
		return sql.update(NS + "mod", svo);
	}

	@Override
	public int updateStockQty(int sno) {
		return sql.update(NS + "upsq", sno);
	}

	@Override
	public int delete(int sno) {
		return sql.delete(NS + "del", sno);
	}

	@Override
	public List<StockVO> selectOneList(String sname) {
		return sql.selectList(NS + "oneList", sname);
	}

	@Override
	public List<StockVO> selectTotalCntList() {
		return sql.selectList(NS + "totalCntList");
	}

	@Override
	public int deleteAll(String sname) {
		return sql.delete(NS + "delAll", sname);
	}
	
	@Override
	public int selectUpsqSno(String sname) {
		return sql.selectOne(NS + "upsqSno", sname);

	}

	@Override
	public int checkStockQty(int sno) {
		return sql.selectOne(NS + "checkQty", sno);
	}

	@Override
	public List<StockVO> selectSlifeList() {
		return sql.selectList(NS + "slifeList");
	}

	@Override
	public List<StockVO> selectRegList(StockReceivingPageVO srpgvo) {
		return sql.selectList(NS + "regList", srpgvo);
	}

	@Override
	public int selectTotalRegCount(StockReceivingPageVO srpgvo) {
		return sql.selectOne(NS + "totalRegCount", srpgvo);
	}


}
