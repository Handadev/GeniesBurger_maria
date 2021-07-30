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

import com.myweb.domain.CouponVO;
import com.myweb.persistence.coupon.CouponDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CouponDummyTest {
	private static Logger logger = LoggerFactory.getLogger(CouponDummyTest.class);
	
	@Inject
	private CouponDAO cpdao;
	
//	@Test
//	public void removeCouponTest() {
//		cpdao.delete(1);
//	}
	
//	@Test
//	public void modifyCouponTest() {
//		CouponVO cpvo = new CouponVO();
//		cpvo.setCpname("(수정) 30% 할인 쿠폰");
//		cpvo.setEnddate("2000-12-09");
//		cpvo.setDiscount(30);
//		cpvo.setCpno(7);
//		cpdao.update(cpvo);
//	}
	
//	@Test
//	public void detailCouponTest() {
//		CouponVO cpvo = new CouponVO();
//		cpvo = cpdao.selectOne(2);
//		logger.info(cpvo.toString());
//	}
	
//	@Test
//	public void selectCouponListTest() {
//		List<CouponVO> list = new ArrayList<CouponVO>();
//		list = (ArrayList<CouponVO>) cpdao.selectList();
//		for (CouponVO cpvo : list) {
//			logger.info(cpvo.toString());
//		}
//	}
	
	@Test
	public void insertCouponTest() {
		for (int i = 1; i < 101; i++) {
		CouponVO cpvo = new CouponVO();
		cpvo.setCpname(i + "% 할인 쿠폰");
		cpvo.setDiscount(i);
		cpdao.insert(cpvo);
		}
	}
}
