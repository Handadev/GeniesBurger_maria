package com.myweb.persistence.coupon;

import java.util.List;

import com.myweb.domain.CouponListVO;
import com.myweb.domain.CouponPageVO;
import com.myweb.domain.CouponVO;

public interface CouponDAORule {
	public int insert(CouponVO cpvo); // 쿠폰 등록
	public List<CouponVO> selectList(CouponPageVO cpgvo); // 쿠폰 리스트
	public CouponVO selectOne(int cpno); // 쿠폰 디테일
	public int update(CouponVO cpvo); // 쿠폰 수정
	public int delete(int cpno); // 쿠폰 삭제
	public int totalCount(CouponPageVO cpgvo); // 페이징 totalcount
	// Coupon Issue
	public int issueInsert(CouponListVO cplvo); // 쿠폰 발급
	public List<CouponListVO> selectIssueList(CouponPageVO cpgvo); // 발급된 쿠폰 리스트
	public List<CouponVO> selectList(); // 발급용 쿠폰 리스트
	public int cancel(int cplno);
	public int issueTotalCount(CouponPageVO cpgvo);
	public List<CouponListVO> myCouponList(int mno);
	public List<CouponListVO> enddateList();
}
