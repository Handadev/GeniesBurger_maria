package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.domain.ReviewPageVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.adCommentVO;
import com.myweb.handler.ReviewPagingHandler;
import com.myweb.orm.ReviewFileProcessor;
import com.myweb.service.review.ReviewServiceRule;

@RequestMapping("/review/*")
@Controller
public class ReviewController {
	private static Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	private ReviewServiceRule rsv;

	@Inject
	private ReviewFileProcessor fp;

	@PostMapping
	public String register(ReviewVO rvo, @RequestParam(name = "files", required = false) MultipartFile[] files) {
		if (files[0].getSize() > 0) {
			int isUp = rsv.ReviewAdd(rvo);
			if (isUp > 0) {
				int rno = rsv.ReviewCurrRno();
				isUp = fp.upload_file(files, rno);
			}
		} else {
			int isUp = rsv.ReviewAdd(rvo);
		}
		return "redirect:/review/list";
	}

	@GetMapping("/list")
	public void list(Model model, ReviewPageVO rpgvo) {
		int totalCount = rsv.getTotalCount();
		model.addAttribute("rpghdl", new ReviewPagingHandler(totalCount, rpgvo));
		int pageIndex = (rpgvo.getPageIndex() -1) * rpgvo.getCountPerPage();
		rpgvo.setPageIndex(pageIndex);
		model.addAttribute("list", rsv.ReviewList(rpgvo));
	}

	@ResponseBody
	@PostMapping("/addAdComment")
	public String acRegister(@RequestParam("rno") int rno, @RequestParam("adComment") String adComment) {
		logger.info(">>>>>>>>>>>>> rno" + rno);
		logger.info(">>>>>>>>>>>>> adComment" + adComment);
		int isUp = rsv.adCommentAdd(rno, adComment);
		return isUp > 0 ? "1" : "0";
	}

	@ResponseBody
	@PostMapping("/acUpdate")
	public String acUpdate(@RequestParam("rno") int rno, @RequestParam("adComment") String adComment) {
		int isUp = rsv.adCommentUp(rno, adComment);
		return isUp > 0 ? "1" : "0";
	}

	@GetMapping("/myReview")
	public void myReview(Model model, @RequestParam("email") String email, ReviewPageVO rpgvo) {
		int totalCount = rsv.getMyTotalCount(email);
		model.addAttribute("rpghdl", new ReviewPagingHandler(totalCount, rpgvo));
		int pageIndex = (rpgvo.getPageIndex() -1) * rpgvo.getCountPerPage();
		rpgvo.setPageIndex(pageIndex);
		model.addAttribute("list", rsv.getMyReview(email, rpgvo));
	}
	
	@ResponseBody
	@PostMapping("/acDelete")
	public String acUpdate(@RequestParam("acno")int acno) {
		int isUp = rsv.adDelete(acno);
		return isUp > 0 ? "1" : "0";
	}
}
