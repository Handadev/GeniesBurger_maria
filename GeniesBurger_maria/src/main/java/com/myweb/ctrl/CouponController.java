package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CouponListVO;
import com.myweb.domain.CouponPageVO;
import com.myweb.domain.CouponVO;
import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PageVO;
import com.myweb.handler.CouponPagingHandler;
import com.myweb.service.coupon.CouponServiceRule;
import com.myweb.service.member.MemberServiceRule;

@RequestMapping("/coupon/*")
@Controller
public class CouponController {
	private static Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Inject
	private CouponServiceRule cpsv;
	
	@Inject
	private MemberServiceRule msv;
	
	@DeleteMapping(value = "/{cplno}", produces = MediaType.TEXT_PLAIN_VALUE) 
	public ResponseEntity<String> remove(@PathVariable("cplno")int cplno) {
		return cpsv.cancel(cplno) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/issueList")
	public void issueList(Model model, CouponPageVO cpgvo) {
		model.addAttribute("issueList", cpsv.getIssueList(cpgvo));
		 int totalCount = cpsv.getIssueTotalCount(cpgvo); 
		 model.addAttribute("cpghdl", new CouponPagingHandler(totalCount, cpgvo));
	}
	
	@PostMapping("/issue")
	public String issue(CouponListVO cplvo, RedirectAttributes reAttr) {
		int isUp = cpsv.issue(cplvo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "쿠폰 발급 O" : "쿠폰 발급 X");
		return "redirect:/coupon/issueList";
	}
	
	@GetMapping("/issue")
	public void issue(Model model) {
		model.addAttribute("cpList", cpsv.getList());
		model.addAttribute("mList", msv.getList());
		logger.info("/WEB-INF/views/coupon/issue.jsp");
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("cpno") int cpno, CouponPageVO cpgvo, RedirectAttributes reAttr) {
		int isUp = cpsv.remove(cpno);
		reAttr.addFlashAttribute("result", isUp > 0 ? "쿠폰삭제 O" : "쿠폰삭제 X");
		return "redirect:/coupon/list";
	}
	
	@PostMapping("/modify")
	public String modify(CouponVO cpvo, CouponPageVO cpgvo, RedirectAttributes reAtrr) {
		int isUp = cpsv.modify(cpvo);
		reAtrr.addFlashAttribute("result", isUp > 0 ? "쿠폰수정 O" : "쿠폰 수정 X");
		reAtrr.addFlashAttribute("cpgvo", cpgvo);
		return "redirect:/coupon/detail?cpno=" + cpvo.getCpno();
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("cpno") int cpno,
			@ModelAttribute("cpgvo") CouponPageVO cpgvo) {
		model.addAttribute("cpvo", cpsv.detail(cpno));
	}
	
	@GetMapping("/list")
	public void list(Model model, CouponPageVO cpgvo) {
		model.addAttribute("list", cpsv.getList(cpgvo));
		int totalCount = cpsv.getTotalCount(cpgvo);
		model.addAttribute("cpghdl", new CouponPagingHandler(totalCount, cpgvo));
	}
	
	@PostMapping("/register")
	public String register(CouponVO cpvo, RedirectAttributes reAttr) {
		int isUp = cpsv.register(cpvo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "쿠폰 등록 O" : "쿠폰 등록 X");
		return "redirect:/coupon/list";
	}
	
	@GetMapping("/register")
	public void register() {
		logger.info("/WEB-INF/views/coupon/register.jsp");
	}
}
