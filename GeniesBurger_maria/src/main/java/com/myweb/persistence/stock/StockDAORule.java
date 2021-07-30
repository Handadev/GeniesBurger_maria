package com.myweb.persistence.stock;

import java.util.List;

import com.myweb.domain.StockReceivingPageVO;
import com.myweb.domain.StockVO;

public interface StockDAORule {
	public int insert(StockVO svo);
	public List<StockVO> selectList();
	public int update(StockVO svo);
	public int updateStockQty(int sno);
	public int delete(int sno);
	public List<StockVO> selectOneList(String sname);
	public List<StockVO> selectTotalCntList();
	public int deleteAll(String sname);
	public int selectUpsqSno(String sname);
	public int checkStockQty(int sno);
	public List<StockVO> selectSlifeList();
	public List<StockVO> selectRegList(StockReceivingPageVO srpgvo);
	public int selectTotalRegCount(StockReceivingPageVO srpgvo);
}
