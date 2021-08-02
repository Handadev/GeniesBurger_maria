package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.MemberVO;
import com.myweb.handler.MemberPagingHandler;
import com.myweb.service.Kakao.KakaoService;
import com.myweb.service.coupon.CouponServiceRule;
import com.myweb.service.member.MemberServiceRule;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberServiceRule msv;

	@Inject
	private CouponServiceRule cpsv;
	
	@PostMapping("/findPwd")
	public String findPwd(MemberVO mvo, Model model, RedirectAttributes reAttr) {
		MemberVO result = msv.findPwd(mvo);
		logger.info("aaaaaaaaaaaaaaaa result : " + result);
		if (result != null) {
		    model.addAttribute("mvo", result);
		    return "/member/pwdResult";
		    } else {
		    reAttr.addFlashAttribute("result", "본인 확인 답변이 틀립니다!");
		    return "redirect:/member/findQuestion";
		    }   
		}
	
	@GetMapping("/question")
	public void findPwd() {
		logger.info("WEB-INF/views/member/question.jsp - GET");
	}
	
	@PostMapping("/findQuestion")
	public String findQuestion(MemberVO mvo, Model model, RedirectAttributes reAttr) {
		MemberVO eq = msv.findQuestion(mvo);
		if (eq != null) {
			logger.info("해당 회원의 email : " + eq.getEmail());
			logger.info("해당 회원의 question : " + eq.getQuestion());
		    model.addAttribute("mvo", eq);
		    return "/member/question";
		    } else {
		    reAttr.addFlashAttribute("result", "정보가 존재하지 않습니다!");
		    return "redirect:/member/findQuestion";
		    }   
		}
	
	@GetMapping("/findQuestion")
	public void findQuestion() {
		logger.info("WEB-INF/views/member/findQuestion.jsp - GET");
	}
	
	@PostMapping("/findID")
	public String findID(MemberVO mvo, Model model, RedirectAttributes reAttr) {
	String email = msv.findID(mvo);
	if (email != null) {
	    model.addAttribute("email", email);
	    return "/member/idResult";
	    } else {
	    reAttr.addFlashAttribute("result", "아이디가 존재하지 않습니다!");
	    return "redirect:/member/findID";
	    }   
	}
	
	@GetMapping("/findID")
	public void findID() {
	    logger.info("WEB-INF/views/member/findID.jsp - GET");
	}
	
	// kakao login
	@Autowired
    private KakaoService kakaoService;

    @RequestMapping("/kakaoLogin")
    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
        logger.info("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        logger.info("###access_Token#### : " + access_Token);
        return "redirect:/";
    }

	@GetMapping("/logout")
	public String logout(RedirectAttributes reAttr, HttpSession ses) {
		ses.invalidate();
		reAttr.addFlashAttribute("result", "로그아웃 되었습니다!");
		return "redirect:/";
	}

	@PostMapping("/modify")
	public String modify(MemberVO mvo, RedirectAttributes reAttr, HttpSession ses) {
		int isUp = msv.modify(mvo);
		if (isUp > 0) {
			MemberVO mvo2 = msv.login(mvo); // 수정된 mvo로 다시 로그인
			ses.setAttribute("ses", mvo2);
		}
		reAttr.addFlashAttribute("result", ses.getAttribute("ses") != null ? "회원정보 수정 성공~" : "회원정보 수정 실패!");
		return "redirect:/";
	}

	@GetMapping("/modify")
	public void modify(@RequestParam("mno") int mno, Model model) {
		model.addAttribute("mvo", msv.detail(mno));
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("mno") int mno, RedirectAttributes reAttr, HttpSession ses) {
		int isUp = msv.remove(mno);
		if (isUp > 0)
			ses.invalidate();
		reAttr.addFlashAttribute("result", isUp > 0 ? "회원삭제 성공~" : "회원삭제 실패!");
		return "redirect:/";
	}

	@GetMapping("/detail")
	public void detail(@RequestParam("mno") int mno, Model model) {
		model.addAttribute("mvo", msv.detail(mno));
		model.addAttribute("myCpList", cpsv.myCouponList(mno));
	}

	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses, RedirectAttributes reAttr) {
		MemberVO loginAccount = msv.login(mvo);
		if (loginAccount != null) {
			ses.setAttribute("ses", loginAccount);
			ses.setMaxInactiveInterval(30 * 60);
		}
		reAttr.addFlashAttribute("result", ses.getAttribute("ses") != null ? "로그인 성공~" : "로그인 실패!");
		return ses.getAttribute("ses") != null ? "redirect:/" : "redirect:/member/login";
	}

	@GetMapping("/login")
	public void login() {
		logger.info("WEB-INF/views/member/login.jsp - GET");
	}

	@GetMapping("/list")
	public void list(Model model, MemberPageVO mpgvo) {
//		int totalCount = msv.getTotalCount(mpgvo);
//		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo));
//		model.addAttribute("mList", msv.getList(mpgvo));
		
		int totalCount = msv.getTotalCount(mpgvo);
		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo));
		
		int pageIndex = (mpgvo.getPageIndex()-1) * mpgvo.getCountPerPage();
		mpgvo.setPageIndex(pageIndex);
		
		List<MemberVO> list = msv.getList(mpgvo);
		model.addAttribute("mList", list);
	}

	@ResponseBody
	@PostMapping("/checkEmail")
	public String emailCheck(@RequestParam("email") String email) {
		int isExist = msv.checkEmail(email);
		return isExist > 0 ? "1" : "0";
	}

	@PostMapping("/register")
	public String register(MemberVO mvo, RedirectAttributes reAttr) {
		int isUp = msv.register(mvo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "회원가입 성공~" : "회원가입 실패!");
		return isUp > 0 ? "redirect:/" : "redirect:/member/register";
	}

	@GetMapping("/register")
	public void register() {
		logger.info("WEB-INF/views/member/register.jsp - GET");
	}
}