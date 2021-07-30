package com.myweb.service.purchase;

import java.util.List;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;

public interface PurchaseServiceRule {
	public int register(PurchaseVO purvo);

	public List<PurchaseVO> getList(MemberPageVO mpgvo);

	public List<PurchaseVO> getList(MemberPageVO mpgvo, int mno);

	public int getTotalCount(MemberPageVO mpgvo);

	public int getTotalCount(MemberPageVO mpgvo, int mno);

	public int getDateSales(String todayString);

	public int getMonthSales(String monthString);
  
	public List<PurchaseVO> getSalesRateList(String monthString);

	public Integer getWeekSales(String month, int i);
  
	public int getYearSales(String yearString);
}
