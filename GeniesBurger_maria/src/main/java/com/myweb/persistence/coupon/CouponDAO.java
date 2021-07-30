package com.myweb.persistence.coupon;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CouponListVO;
import com.myweb.domain.CouponPageVO;
import com.myweb.domain.CouponVO;

@Repository
public class CouponDAO implements CouponDAORule{
	private static Logger logger = LoggerFactory.getLogger(CouponDAO.class);
	private final String NS = "CouponMapper.";
	
	@Inject
	private SqlSession SQL;
	
	@Override
	public int insert(CouponVO cpvo) { 
		return SQL.insert(NS + "reg", cpvo);
	}

	@Override
	public List<CouponVO> selectList(CouponPageVO cpgvo) {
		return SQL.selectList(NS + "list", cpgvo);
	}
	
	@Override
	public CouponVO selectOne(int cpno) {
		return SQL.selectOne(NS + "detail", cpno);
	}

	@Override
	public int update(CouponVO cpvo) {
		return SQL.update(NS + "mod", cpvo);
	}

	@Override
	public int delete(int cpno) {
		return SQL.delete(NS + "del", cpno);
	}

	@Override
	public int totalCount(CouponPageVO cpgvo) {
		return SQL.selectOne(NS + "tc", cpgvo);
	}

	@Override
	public int issueInsert(CouponListVO cplvo) {
		return SQL.insert(NS + "issue", cplvo);
	}

	@Override
	public List<CouponListVO> selectIssueList(CouponPageVO cpgvo) {
		return SQL.selectList(NS + "issueList", cpgvo);
	}

	@Override
	public List<CouponVO> selectList() {
		return SQL.selectList(NS + "issueCpList");
	}

	@Override
	public int cancel(int cplno) {
		return SQL.delete(NS + "cancel", cplno);
	}

	@Override
	public int issueTotalCount(CouponPageVO cpgvo) {
		return SQL.selectOne(NS + "itc", cpgvo);
	}
	
	@Override
	public List<CouponListVO> myCouponList(int mno) {
		return SQL.selectList(NS + "myCpList", mno);
	}

	@Override
	public List<CouponListVO> enddateList() {
		return SQL.selectList(NS + "enddate");
	}
}
