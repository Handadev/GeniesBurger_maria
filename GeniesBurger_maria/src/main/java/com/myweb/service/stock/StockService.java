package com.myweb.service.stock;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.StockReceivingPageVO;
import com.myweb.domain.StockVO;
import com.myweb.persistence.stock.StockDAORule;

@Service
public class StockService implements StockServiceRule {
	private static Logger logger = LoggerFactory.getLogger(StockService.class);

	@Inject
	private StockDAORule sdao;
	
	@Override
	public int register(StockVO svo) {
		return sdao.insert(svo);
	}

	@Override
	public List<StockVO> getList() {
		return sdao.selectList();
	}

	@Override
	public int modify(StockVO svo) {
		return sdao.update(svo);
	}

	@Override
	public int modifyStockQty(int sno) {
		return sdao.updateStockQty(sno);
	}

	@Override
	public int remove(int sno) {
		return sdao.delete(sno);
	}

	@Override
	public List<StockVO> getOneList(String sname) {
		return sdao.selectOneList(sname);
	}

	@Override
	public List<StockVO> getTotalCntList() {
		return sdao.selectTotalCntList();
	}

	@Override
	public int removeAll(String sname) {
		return sdao.deleteAll(sname);
	}
	
	@Override
	public int getUpsqSno(String sname) {
		return sdao.selectUpsqSno(sname);

	}

	@Override
	public int checkStockQty(int sno) {
		return sdao.checkStockQty(sno);
	}

	@Override
	public List<StockVO> getSlifeList() {
		return sdao.selectSlifeList();
	}

	@Override
	public List<StockVO> getRegList(StockReceivingPageVO srpgvo) {
		return sdao.selectRegList(srpgvo);
	}

	@Override
	public int getTotalRegCount(StockReceivingPageVO srpgvo) {
		return sdao.selectTotalRegCount(srpgvo);
	}

}
