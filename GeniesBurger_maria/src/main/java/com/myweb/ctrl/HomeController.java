package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

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

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;
import com.myweb.handler.ProductCustomerPagingHandler;
import com.myweb.service.add_extra.AddExtraServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.stock.StockServiceRule;

/**
 * Handles requests for the application home page.
 */
@RequestMapping("/*")
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private ProductServiceRule psv;

	@Inject
	private AddExtraServiceRule aesv;

	@GetMapping("/")
	public String home(Model model, ProductCustomerPageVO pcpgvo) {
		int totalCount = psv.getTotalCount(pcpgvo);
		model.addAttribute("product_paging", new ProductCustomerPagingHandler(totalCount, pcpgvo));
		// 페이징jsp에서 페이지 번호를 누를 때마다 pcpgvo.getPageIndex()에 페이지 번호가 들어오는데
		// mariaDB는 limit을 사용해서 -> limit (시작할 숫자), (출력할 아이템 개수) 이렇게 sql을 작성해야함
		// 그래서 위에 페이징은 그대로 출력하고 페이징jsp에서 받은 pageindex 값을 아래서 수정해서
		// 객체에 넣어서 그대로 mapper에 던져준다
		int pageIndex = (pcpgvo.getPageIndex() -1) * pcpgvo.getCountPerPage();
		pcpgvo.setPageIndex(pageIndex);
		
		List<ProductVO> list = psv.getList(pcpgvo);
		model.addAttribute("product_list", list);
		return "index";
	}
	
	@GetMapping("/dash_index")
	public String dash_index() {
		return "dash_index";
		
	}
	
	@ResponseBody // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해서 일단 테이블 정보 가져옴
	@GetMapping(value = "/isAddExtra/{mno}/{pno}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AddExtraVO>> isAddExtra (@PathVariable("mno") int mno,
														@PathVariable("pno") int pno) {
		return new ResponseEntity<List<AddExtraVO>> (aesv.getList(mno, pno), HttpStatus.OK);
	}
	
	@ResponseBody // 주문 취소시 add_extra 테이블의 mno의 해당 pno add_extra 삭제
	@PostMapping("/delAddExtra")
	public void delAddExtra(@RequestParam("mno") int mno,
							@RequestParam("pno") int pno) {
		aesv.removePno(mno, pno);
	}
	
	
	@ResponseBody // 단품 혹은 세트 골랐을 때 사이즈업을 위해서 세트 / 라지세트 가져옴
	@GetMapping(value = "/select/{pno}/{category}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductAndFileDTO>> select (@PathVariable("pno") int pno,
															@PathVariable("category") int category) {	
		return new ResponseEntity<List<ProductAndFileDTO>>(psv.getProductList(pno, category), HttpStatus.OK);
	}

	@ResponseBody // 단품, 세트를 선택하면 세트 / 라지 세트 선택 화면
	@GetMapping(value = "/wantLarger/{pno}/{category}", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ProductAndFileDTO> getLargerOne(@PathVariable("pno") int pno,
			@PathVariable("category") int category) {
		return new ResponseEntity<ProductAndFileDTO>(psv.getLargerProduct(pno, category), HttpStatus.OK);

	}

	@ResponseBody // 버거 재료 선택 화면
	@GetMapping(value = "/getBurgerStock", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ProductVO>> getBurgerStock() {
		return new ResponseEntity<List<ProductVO>>(psv.getBurgerStockList(), HttpStatus.OK);
	}

	@ResponseBody // 선택한 재료 tbl_add_extra에 추가
	@PostMapping("/addExtra")
	public void addExtra(@RequestParam(value = "titleList[]") List<String> titleList,
						@RequestParam(value = "priceList[]") List<Integer> priceList,
						@RequestParam("mno") int mno,
						@RequestParam("pno") int pno) {
		for (int i = 0; i < titleList.size(); i++) {
			aesv.register(new AddExtraVO(mno, pno, titleList.get(i), priceList.get(i)));
		}
	}

	@ResponseBody // 4번 모달 사이드 리스트 출력
	@GetMapping(value = "/getSideList", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ProductVO>> getSideList() {
		return new ResponseEntity<List<ProductVO>>(psv.getSideList(), HttpStatus.OK);
	}

	@ResponseBody // 선택한 사이드 추가
	@PostMapping("/addSide")
	public void addSide(@RequestParam("title") String title, @RequestParam("price") int price,
			@RequestParam("mno") int mno, @RequestParam("pno") int pno) {
		aesv.register(new AddExtraVO(mno, pno, title, price));
	}

	@ResponseBody // 5번 모달 음료 리스트 출력
	@GetMapping(value = "/getBeverageList", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ProductVO>> getBeverageList() {
		return new ResponseEntity<List<ProductVO>>(psv.getBeverageList(), HttpStatus.OK);
	}

	@ResponseBody // 선택한 음료 추가
	@PostMapping("/addBeverage")
	public void addBeverage(@RequestParam("title") String title, @RequestParam("price") int price,
			@RequestParam("mno") int mno, @RequestParam("pno") int pno) {
		aesv.register(new AddExtraVO(mno, pno, title, price));
	}
	
	@ResponseBody // 카트 추가하기 위해 상품 객체 가져오기
	@GetMapping(value = "/getSelectedProduct/{pno}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProductVO> getSelectedProduct (@PathVariable("pno") int pno) {
		return new ResponseEntity<ProductVO> (psv.detail(pno), HttpStatus.OK);
	}

}
