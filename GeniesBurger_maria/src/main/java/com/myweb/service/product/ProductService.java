package com.myweb.service.product;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductFileVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;
import com.myweb.persistence.product.ProductDAORule;
import com.myweb.persistence.product_stock.ProductStockDAORule;
import com.myweb.persistence.productfile.ProductFileDAORule;

@Service
public class ProductService implements ProductServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Inject
	private ProductDAORule pdao;
	
	@Inject
	private ProductFileDAORule pfdao;
	
	@Inject
	private ProductStockDAORule psdao;
	
	@Override
	public int register(ProductVO pvo) {
		return pdao.insert(pvo) > 0  ? 1 : 0;
	}
	
	@Override // 관리자 상품 리스트
	public List<ProductVO> getList(ProductPageVO ppgvo) {
		return pdao.selectList(ppgvo);
	}

	@Override // 소비자 상품 리스트
	public List<ProductVO> getList(ProductCustomerPageVO pcpgvo) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<ProductVO> plist = pdao.selectList(pcpgvo);
		for (ProductVO pvo : plist) {
			int pno = pvo.getPno();
			List<ProductFileVO> flist = pfdao.selectList(pno);
			pvo.setFlist(flist);
			list.add(pvo);
		}
		return list;
	}
	
	@Override // 상품등록시 세트 메뉴구성을 위한 단품 리스트
	public List<ProductVO> getList(ProductVO pvo) {
		return pdao.selectList(pvo);
	}
	
	@Override // 소비자 - 단품 or 세트선택 화면리스트
	public List<ProductAndFileDTO> getProductList(int pno, int category) {
		return pdao.selectList(pno, category);
	}

	@Override // 단품, 세트를 선택하면 세트 / 라지 세트로 바꾸는지
	public ProductAndFileDTO getLargerProduct(int pno, int category) {
		return pdao.selectOne(pno, category);
	}
	
	@Override // 3번 모달 추가 재료 리스트 출력
	public List<ProductVO> getBurgerStockList() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<ProductVO> plist = pdao.selectBurgerStockList(); 
		for (ProductVO pvo : plist) {
			int pno =  pvo.getPno();
			List<ProductFileVO> flist = pfdao.selectList(pno);
			pvo.setFlist(flist);
			list.add(pvo);
		}
		return list;
	}
	
	@Override // 4번 모달 사이드 리스트 출력
	public List<ProductVO> getSideList() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<ProductVO> plist = pdao.selectSideList();
		for (ProductVO pvo : plist) {
			int pno = pvo.getPno();
			List<ProductFileVO> flist = pfdao.selectList(pno);
			pvo.setFlist(flist);
			list.add(pvo);
		}
		return list;
	}
	
	@Override // 5번 모달 음료 리스트 출력
	public List<ProductVO> getBeverageList() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<ProductVO> plist = pdao.selectBeverageList();
		for (ProductVO pvo : plist) {
			int pno = pvo.getPno();
			List<ProductFileVO> flist = pfdao.selectList(pno);
			pvo.setFlist(flist);
			list.add(pvo);
		}
		return list;
	}
	
	@Override // cart ctrl 주문시 재품 판매량 높이기
	public int updateProductQty(int pno, int qty) {
		return pdao.updateQty(pno, qty);
	}
	
	@Override
	public ProductVO detail(int pno) {
		ProductVO pvo = new ProductVO();
		pvo = pdao.selectOne(pno);
		if (pvo != null) {
			List<ProductFileVO> list = pfdao.selectList(pno);
			pvo.setFlist(list);
		}
		return pvo;
	}
	
	@Override // 상품 결제시 AE에 있는 title을 가지고 pno를 출력해서 재고에서 빼야함
	public int getPno(String title) {
		return pdao.selectPno(title);
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override 
	public int remove(int pno) {
		int isDel = 1;
		isDel *= pdao.delete(pno);
		isDel *= psdao.delete(pno);
		if (isDel > 0) {
			isDel *= pfdao.delete(pno);
		}
		return isDel;
	}

	@Override
	public int getCurrPno() {
		return pdao.selectOne();
	}

	@Override // 관리자 리스트 글의 개수 구하기
	public int getTotalCount(ProductPageVO ppgvo) {
		return pdao.selectOne(ppgvo);
	}

	@Override // 소비자 리스트 글의 개수 구하기
	public int getTotalCount(ProductCustomerPageVO pcpgvo) {
		return pdao.selectOne(pcpgvo);
	}

	@Override
	public List<StockVO> getList() {
		return pdao.selectList();
	}


}
