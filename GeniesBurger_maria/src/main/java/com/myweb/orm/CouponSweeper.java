package com.myweb.orm;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.domain.CouponListVO;
import com.myweb.persistence.coupon.CouponDAORule;

@Component
public class CouponSweeper {
	private static Logger logger = LoggerFactory.getLogger(CouponSweeper.class);
	
	@Inject
	private CouponDAORule cpdao;
	
	// db 확인하고 실제 파일 위치 확인하고 db에 존재하지 않는 파일은 싹다 지움
	// 초 - 분 - 시 - 일 - 월 - 요일 - 연도(옵션) * = 매/일.월.요일
	@Scheduled(cron = "0 59 23 * * *")
	public void couponSweeper() throws Exception{
		logger.info(">>>>> CouponSweeper > 유효기간 지난 쿠폰 삭제");
		logger.info(">>>>> CouponSweep() 시작 시간" + LocalDateTime.now());
		LocalDate now = LocalDate.now(); // 
		SimpleDateFormat ed = new SimpleDateFormat("yyyy-mm-dd");
		String tdString = now.toString();
		Date edate = null;
		Date today = ed.parse(tdString);
		
		List<CouponListVO> enddate = cpdao.enddateList();
		for (CouponListVO cplvo : enddate) {
			String cpEnddate = cplvo.getEnddate();
			int cplno = cplvo.getCplno();
			edate = ed.parse(cpEnddate);
			if(edate.before(today) || edate.equals(today)) {
				cpdao.cancel(cplno);
			}
		}
	}
}
