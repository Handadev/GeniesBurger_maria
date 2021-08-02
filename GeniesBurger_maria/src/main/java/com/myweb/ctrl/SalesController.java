package com.myweb.ctrl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.myweb.domain.PurchaseVO;
import com.myweb.service.purchase.PurchaseServiceRule;

@RequestMapping("/sales/*")
@Controller
public class SalesController {
	private static Logger logger = LoggerFactory.getLogger(SalesController.class);

	@Inject
	private PurchaseServiceRule pursv;

	@GetMapping("sales_detail")
	public void salesList(Model model) {
		Calendar cal = Calendar.getInstance();
    
     // 연매출
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		List<Integer> ySalesList = new ArrayList<Integer>();
		
		for (int i = 0; i < 5; i++) {
			cal.setTime(new Date());
			cal.add(Calendar.YEAR, -i);
			String yearString = yyyy.format(cal.getTime());
			int yearSales = pursv.getYearSales(yearString);
			ySalesList.add(yearSales);
      }
		 model.addAttribute("yearSalesList", ySalesList);

    
		//일 매출
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		List<Integer> dateSalesList = new ArrayList<Integer>();
    
		for (int i = 0; i < 7; i++) {
			cal.setTime(new Date());
			cal.add(Calendar.DATE, -i);
			String todayString = sdf1.format(cal.getTime());
			int dateSales = pursv.getDateSales(todayString);
			dateSalesList.add(dateSales);
		}
		model.addAttribute("dateSalesList", dateSalesList);

    
		//월 매출
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		List<Integer> monthSalesList = new ArrayList<Integer>();

		for (int i = 0; i < 12; i++) {
			cal.setTime(new Date());
			cal.add(Calendar.MONTH, -i);
			String monthString = sdf2.format(cal.getTime());
			int monthSales = pursv.getMonthSales(monthString);
			monthSalesList.add(monthSales);
		}
		model.addAttribute("monthSalesList", monthSalesList);
		
    
		//메뉴 판매량 top5
		cal.setTime(new Date());
		String monthString = sdf2.format(cal.getTime());
		List<PurchaseVO> productRateList = pursv.getSalesRateList(monthString);
		List<String> rateList = new ArrayList<String>();
    
		Gson gson = new GsonBuilder().create();
		for (PurchaseVO purvo : productRateList) {
			String json = gson.toJson(purvo);
			rateList.add(json);
		}
		model.addAttribute("productRateList", rateList);
  
		/*-------------- 요일 별 매출 -------------*/
		cal = Calendar.getInstance();
		List<Integer> weekSales = new ArrayList<Integer>();
		for (int i = 0; i <= 6; i++) {
			cal.setTime(new Date());
			SimpleDateFormat sdf = new SimpleDateFormat("MM");
			String month = sdf.format(cal.getTime());
			weekSales.add(pursv.getWeekSales(month,i));
		}
		model.addAttribute("weekSales",weekSales);
		}
}

