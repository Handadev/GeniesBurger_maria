package com.myweb.service.coupon;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CouponListVO;
import com.myweb.domain.CouponPageVO;
import com.myweb.domain.CouponVO;
import com.myweb.persistence.coupon.CouponDAORule;

@Service
public class CouponService implements CouponServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CouponService.class);

	@Inject
	private CouponDAORule cpdao;
	
	@Override
	public int register(CouponVO cpvo) {
		return cpdao.insert(cpvo);
	}

	@Override
	public List<CouponVO> getList(CouponPageVO cpgvo) {
		return cpdao.selectList(cpgvo);
	}
	
	@Override
	public CouponVO detail(int cpno) {
		return cpdao.selectOne(cpno);
	}

	@Override
	public int modify(CouponVO cpvo) {
		return cpdao.update(cpvo);
	}

	@Override
	public int remove(int cpno) {
		return cpdao.delete(cpno);
	}

	@Override
	public int getTotalCount(CouponPageVO cpgvo) {
		return cpdao.totalCount(cpgvo);
	}

	@Override
	public int issue(CouponListVO cplvo) {
		return cpdao.issueInsert(cplvo);
	}

	@Override
	public List<CouponListVO> getIssueList(CouponPageVO cpgvo) {
		return cpdao.selectIssueList(cpgvo);
	}

	@Override
	public List<CouponVO> getList() {
		return cpdao.selectList();
	}

	@Override
	public int cancel(int cplno) {
		return cpdao.cancel(cplno);
	}

	@Override
	public int getIssueTotalCount(CouponPageVO cpgvo) {
		return cpdao.issueTotalCount(cpgvo);
	}

	@Override
	public List<CouponListVO> myCouponList(int mno) {
		return cpdao.myCouponList(mno);
	}

}
