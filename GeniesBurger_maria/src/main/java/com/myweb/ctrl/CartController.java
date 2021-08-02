package com.myweb.ctrl;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;
import com.myweb.domain.MemberPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.PurchaseVO;
import com.myweb.handler.MemberPagingHandler;
import com.myweb.service.add_extra.AddExtraServiceRule;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.coupon.CouponServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.product_stock.ProductStockServiceRule;
import com.myweb.service.purchase.PurchaseServiceRule;
import com.myweb.service.stock.StockServiceRule;

@RequestMapping("/cart/*")
@Controller
public class CartController {
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private CartServiceRule cartsv;

	@Inject
	private CouponServiceRule cpsv;

	@Inject
	private PurchaseServiceRule pursv;

	@Inject
	private ProductStockServiceRule pssv;

	@Inject
	private StockServiceRule ssv;
	
	@Inject
	private ProductServiceRule psv;
	
	@Inject
	private AddExtraServiceRule aesv;

	// 주문완료
	@GetMapping("/complete")
	public void complete() {
	}

	// 카드 결제 중
	@GetMapping("/creditcard")
	public void creditcard() {
	}

	// 결제 시 방법(카드 or 페이코 // 페이코는 현재 적용 안됨)
	@GetMapping("/method")
	public void method() {
	}

	// 첫 번째 결제창
	@GetMapping("/payment")
	public void payment(@RequestParam("mno") int mno, Model model, RedirectAttributes reAttr) {
		List<CartVO> list = cartsv.payment(mno);
		model.addAttribute("myCpList", cpsv.myCouponList(mno));
		if (list != null) {
			model.addAttribute("list", list);
		}
	}

	// 상품을 카트에 추가
	@ResponseBody
	@PostMapping("/register")
	public String register(CartVO cartvo, @RequestParam("pno") int pno, @RequestParam("mno") int mno,
			RedirectAttributes reAttr, HttpSession ses) {
		// 상품 카트에 추가할 시 중복체크 부분 삭제 
//		boolean isExist = cartsv.dupleCheck(pno, mno);
//		if (isExist) {
//			int isUp = cartsv.increRegister(pno, mno);
//			reAttr.addFlashAttribute("result", isUp > 0 ? "카트 수량증가 성공" : "카트 수량증가 실패");
//		} else {
//			int isUp = cartsv.register(cartvo);
//			reAttr.addFlashAttribute("result", isUp > 0 ? "카트 등록 성공" : "카트 등록 실패");
//		}
		int isUp = cartsv.register(cartvo); // 서비스에서 add_extra에 cartno 넣어줌
		reAttr.addFlashAttribute("result", isUp > 0 ? "카트 등록 성공" : "카트 등록 실패");
		return "redirect:/";
	}

	// 카트 수량 증가, 감소
	@ResponseBody
	@PostMapping(value = "/{upqty}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> up(@PathVariable("upqty") int upqty,
			@RequestParam(value = "upqty_key", required = false) String upqtystr,
			@RequestParam(value = "downqty_key", required = false) String downqtystr) {
		logger.info("upqty String : " + upqtystr);
		logger.info("downqty String : " + downqtystr);
		logger.info("up : " + upqty);
		int isUp;
		if (upqtystr == null) {
			isUp = cartsv.decreQty(upqty, downqtystr);
		} else {
			isUp = cartsv.increQty(upqty, upqtystr);
		}
		return isUp > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 카트 삭제
	@ResponseBody
	@DeleteMapping(value = "/{cartno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("cartno") int cartno) {
		logger.info("controller : " + cartno);
		return cartsv.remove(cartno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 카트 => 주문내역
	@Transactional
	@ResponseBody
	@PostMapping(value = "/mno/", produces = MediaType.TEXT_PLAIN_VALUE)
	public String removeWithMno(@RequestParam("mno") int mno, @RequestParam(value = "list[]") List<Integer> list) {
		logger.info("*************" + list.toString());
		logger.info(">>> mno : " + mno);
		List<CartVO> cartvo = cartsv.getOrderList(mno);
		logger.info(">>> cartvo : " + cartvo);
		int isUp = 0;
		int isUp2 = 0;
		int isUp3 = 0;
		if (cartvo != null) {
			for (int i = 0; i < cartvo.size(); i++) {
				PurchaseVO purvo = new PurchaseVO(cartvo.get(i).getMno(), cartvo.get(i).getCartno(),
						cartvo.get(i).getPno(), cartvo.get(i).getTitle(), list.get(i),
						cartvo.get(i).getQuantity());
				isUp = pursv.register(purvo); // 주문내역에 cartvo에서 받아온 상품들 추가 
				isUp *= isUp;
				int pno = cartvo.get(i).getPno();
				int qty = cartvo.get(i).getQuantity();
				int cartno = cartvo.get(i).getCartno();
				isUp *= psv.updateProductQty(pno, qty); // 주문된 상품에서 판매량 올리기 
				// 재고 관련 for문
				List<ProductStockVO> productStockList = pssv.getList(pno);
				for (int t = 0; t < productStockList.size(); t++) {
					for (int j = 0; j < qty; j++) {
						String sname = productStockList.get(t).getSname();
						int sno = ssv.getUpsqSno(sname);
						isUp3 = ssv.modifyStockQty(sno);
						int stock_qty = ssv.checkStockQty(sno);
						if (stock_qty == 0) {
							ssv.remove(sno);
						}
					}
					isUp3 *= isUp3;
				}
				// add_extra에서 사용된 상품을 재고에서 삭제하는 for문
				List<AddExtraVO> addExtraList = aesv.getAddExtraList(cartvo.get(i));
				if (addExtraList.size() != 0) {
					for (int j = 0; j < addExtraList.size(); j++) {
						int extraPno = psv.getPno(addExtraList.get(j).getTitle());
						productStockList = pssv.getList(extraPno);
						for (int t = 0; t < productStockList.size(); t++) {
							for (int k = 0; k < qty; k++) {
								String sname = productStockList.get(t).getSname();
								int sno = ssv.getUpsqSno(sname);
								isUp3 = ssv.modifyStockQty(sno);
								int stock_qty = ssv.checkStockQty(sno);
								if (stock_qty == 0) {
									ssv.remove(sno);
								}
							}
							isUp3 *= isUp3;
						}
					}
				}
				isUp *= aesv.remove(cartno);
				isUp *= cartsv.remove(cartno);
			}
		}
		if (isUp > 0 && isUp3 > 0) {
			isUp2 = cartsv.removeWithMno(mno);
		}
		return isUp2 > 0 ? "redirect:/" : "/cart/complete";
	}

	// 카트 리스트
	@GetMapping("/cart")
	public void list(@RequestParam("mno") int mno, Model model) {
		List<CartVO> list = cartsv.getList(mno);
		model.addAttribute("cartList", list);
	}

	@GetMapping("/purchaseList")
	public void purList(Model model, MemberPageVO mpgvo) {
		int totalCount = pursv.getTotalCount(mpgvo);
		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo));

		int pageIndex = (mpgvo.getPageIndex()-1) * mpgvo.getCountPerPage();
		mpgvo.setPageIndex(pageIndex);
		model.addAttribute("purchaseList", pursv.getList(mpgvo));
	}
	
	@GetMapping("/purchaseListMember")
	public void purList(Model model, MemberPageVO mpgvo, @RequestParam("mno") int mno) {
		int totalCount = pursv.getTotalCount(mpgvo, mno);
		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo, mno));
		
		int pageIndex = (mpgvo.getPageIndex()-1) * mpgvo.getCountPerPage();
		mpgvo.setPageIndex(pageIndex);

		model.addAttribute("purchaseListMember", pursv.getList(mpgvo, mno));
	}

}