package com.myweb.service.coupon;

import java.util.List;

import com.myweb.domain.CouponListVO;
import com.myweb.domain.CouponPageVO;
import com.myweb.domain.CouponVO;

public interface CouponServiceRule {
	public int register(CouponVO cpvo); // 쿠폰 등록
	public List<CouponVO> getList(CouponPageVO cpgvo); // 쿠폰 리스트
	public CouponVO detail(int cpno); // 쿠폰 디테일
	public int modify(CouponVO cpvo); // 쿠폰 수정
	public int remove(int cpno); // 쿠폰 삭제
	public int getTotalCount(CouponPageVO cpgvo);
	// Coupon Issue
	public int issue(CouponListVO cplvo);
	public List<CouponListVO> getIssueList(CouponPageVO cpgvo);
	public List<CouponVO> getList(); // 발급용 쿠폰 리스트
	public int cancel(int cplno);
	public int getIssueTotalCount(CouponPageVO cpgvo);
	public List<CouponListVO> myCouponList(int mno); // 나의 쿠폰 리스트
}
