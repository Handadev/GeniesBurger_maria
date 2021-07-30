package com.myweb.service.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;
import com.myweb.domain.ReviewVO;
import com.myweb.persistence.purchase.PurchaseDAORule;
import com.myweb.persistence.review.ReviewDAORule;

@Service
public class PurchaseService implements PurchaseServiceRule {
	private static Logger logger = LoggerFactory.getLogger(PurchaseService.class);

	@Inject
	private PurchaseDAORule pdao;

	@Inject
	private ReviewDAORule rdao;

	@Override
	public int register(PurchaseVO purvo) {
		return pdao.insert(purvo);
	}

	@Override
	public List<PurchaseVO> getList(MemberPageVO mpgvo) {
		return pdao.selectList(mpgvo);
	}

	@Override
	public List<PurchaseVO> getList(MemberPageVO mpgvo, int mno) {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		List<PurchaseVO> purList = pdao.selectList(mpgvo, mno);
		for (PurchaseVO purVO : purList) {
			int purno = purVO.getPurno();
			logger.info("purno >>>>>>>>>>>>>>>" + purno);
			List<ReviewVO> rlist = rdao.purList(purno);
			purVO.setRlist(rlist);
			list.add(purVO);
		}
		return list;
	}

	@Override
	public int getTotalCount(MemberPageVO mpgvo) {
		return pdao.getTotalCount(mpgvo);
	}

	@Override
	public int getTotalCount(MemberPageVO mpgvo, int mno) {
		return pdao.getTotalCount(mpgvo, mno);
	}

	@Override
	public int getDateSales(String todayString) {
		return pdao.selectDateSales(todayString);
	}

	@Override
	public int getMonthSales(String monthString) {
		return pdao.selectMonthSales(monthString);
	}

	@Override
	public List<PurchaseVO> getSalesRateList(String monthString) {
		return pdao.selectSalesRateList(monthString);
  }
    
  @Override
	public Integer getWeekSales(String month, int i) {
		return pdao.selectWeekSales(month, i);
 }

  @Override
	public int getYearSales(String yearString) {
		return pdao.selectYearSales(yearString);
	}

}
