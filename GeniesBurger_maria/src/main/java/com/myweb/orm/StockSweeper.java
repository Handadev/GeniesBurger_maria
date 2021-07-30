package com.myweb.orm;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.domain.StockVO;
import com.myweb.persistence.stock.StockDAORule;

@Component
public class StockSweeper {
	private static Logger logger = LoggerFactory.getLogger(StockSweeper.class);

	@Inject
	private StockDAORule sdao;

	@Scheduled(cron = "0 59 23 * * *")
	public void stockSweep() throws Exception {
		logger.info("swepper 시작!!!!!!!");
		LocalDate now = LocalDate.now();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayString = now.toString();
		Date slife = null;
		Date today = sdf.parse(todayString);

		List<StockVO> slifeList = sdao.selectSlifeList();
		for (StockVO svo : slifeList) {
			int sno = svo.getSno();
			String shelf_life = svo.getShelf_life();
			slife = sdf.parse(shelf_life);
			if (slife.before(today) || slife.equals(today)) {
				sdao.delete(sno);
			}
		}

	}

}
