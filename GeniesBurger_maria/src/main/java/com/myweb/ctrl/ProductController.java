package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;
import com.myweb.handler.ProductPagingHandler;
import com.myweb.orm.ProductFileProcessor;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.product_stock.ProductStockServiceRule;

@RequestMapping("/product/*")
@Controller
public class ProductController {
	private static Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductServiceRule psv;
	
	@Inject
	private ProductStockServiceRule pssv;
	
	@Inject
	private ProductFileProcessor pfp;
	
	@Inject
	private CartServiceRule cartsv;
	
	@GetMapping("/register")
	public void register(Model model, ProductVO pvo) {
		model.addAttribute("stock_list", psv.getList());
		model.addAttribute("single_list", psv.getList(pvo));
	}
	
	@ResponseBody // 상품등록시 연동상품을 설정하면 연동상품에 연결되어있는 stocklist 리턴
	@GetMapping(value = "/getRelateStock/{pno}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductStockVO>> getRelateStock (@PathVariable("pno") int pno) {
		return new ResponseEntity<List<ProductStockVO>> (pssv.getList(pno), HttpStatus.OK);
	}
	
	@PostMapping("/register")
	public String register(ProductStockVO psvo, RedirectAttributes reAttr
						,@RequestParam(name="files", required=false) MultipartFile[] files, ProductVO pvo) {
		int isUp = psv.register(pvo);
		if (isUp > 0) {
			int pno = psv.getCurrPno();
			isUp *= pssv.register(psvo, pno);
			if (files[0].getSize() > 0) {
				isUp *= pfp.upload_file(files, pno);
			}
		}
		reAttr.addFlashAttribute("result", isUp > 0 ? "물품 등록 성공" : "물품 삭제 성공");
		return "redirect:/product/list";
	}
	
	@GetMapping("/list")
	public void list(Model model, ProductPageVO ppgvo) {
		model.addAttribute("product_list", psv.getList(ppgvo));
		int totalCount = psv.getTotalCount(ppgvo);
		model.addAttribute("product_paging", new ProductPagingHandler(totalCount, ppgvo));
	}
	
	
	@GetMapping("/detail")
	public void detail(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("pvo", psv.detail(pno));
		model.addAttribute("stock_list", pssv.getList(pno));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("pno") int pno, Model model, ProductVO pvo) {
		model.addAttribute("pvo", psv.detail(pno));
		model.addAttribute("single_list", psv.getList(pvo));
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO pvo, RedirectAttributes reAttr
					,@RequestParam(name="files", required=false) MultipartFile[] files) {
		int isMod = psv.modify(pvo);
		if (isMod > 0) {
			if (files[0].getSize() > 0) {
				int pno = pvo.getPno();
				isMod = pfp.upload_file(files, pno);
			}
		}
		reAttr.addFlashAttribute("result", isMod > 0 ? "물품 등록 성공" : "물품 삭제 성공");
		return "redirect:/product/detail?pno=" + pvo.getPno();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") int pno, RedirectAttributes reAttr) {
		int isDel = psv.remove(pno); // 상품 삭제와 함께 사진, product_sock도 삭제
		int isDelCart = cartsv.removeWithPno(pno);
		return "redirect:/product/list";
	}
	
	@ResponseBody
	@PostMapping("/del_product_file")
	public String del_product_file(@RequestParam("puuid") String fuuid) {
		int isDel = pfp.deleteFile(fuuid);
		return isDel > 0 ? "1" : "0";
	}
	
}
