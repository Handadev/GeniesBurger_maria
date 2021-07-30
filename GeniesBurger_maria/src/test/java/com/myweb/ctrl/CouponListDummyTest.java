package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.CouponListVO;
import com.myweb.persistence.coupon.CouponDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CouponListDummyTest {
	private static Logger logger = LoggerFactory.getLogger(CouponListDummyTest.class);
	
	@Inject
	private CouponDAO cpdao;
	
//	@Test
//	public void enddate() {
//		cpdao.enddateList();
//		System.out.println(cpdao.enddateList().toString());
//	}
	
//	@Test
//	public void selectCouponListTest() {
//		List<CouponListVO> list = new ArrayList<CouponListVO>();
//		list = (ArrayList<CouponListVO>) cpdao.SelectIssueList();
//		for (CouponListVO cplvo : list) {
//			logger.info(cplvo.toString());
//		}
//	}
		
//	@Test
//	public void insertCouponListTest() {
//		CouponListVO cplvo = new CouponListVO();
//		cplvo.setCpno(160);
//		cplvo.setMno(1);
//		cpdao.issueInsert(cplvo);
//	}
}
