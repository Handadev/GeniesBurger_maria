package com.myweb.persistence.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;

@Repository
public class ProductDAO implements ProductDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	private final String NS = "ProductMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(ProductVO pvo) {
		return sql.insert(NS+"reg", pvo);
	}

	@Override // 관리자 리스트
	public List<ProductVO> selectList(ProductPageVO ppgvo) {
		return sql.selectList(NS+"list", ppgvo);
	}
	
	@Override // 소비자 리스트
	public List<ProductVO> selectList(ProductCustomerPageVO pcpgvo) {
		return sql.selectList(NS+"listcustomer", pcpgvo);
	}
	
	@Override // 세트 메뉴구성을 위한 단품 리스트
	public List<ProductVO> selectList(ProductVO pvo) {
		return sql.selectList(NS+"singlemenu", pvo);
	}
	
	@Override // 소비자 - 단품 or 세트선택 화면리스트
	public List<ProductAndFileDTO> selectList(int pno, int category) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("category", category);
		return sql.selectList(NS+"selectmenu", map);
	}
		
	@Override // 단품, 세트를 선택하면 세트 / 라지 세트로 바꾸는지 
	public ProductAndFileDTO selectOne(int pno, int category) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("category", category);
		return sql.selectOne(NS+"wantLarger", map);
	}
	
	@Override // 3번 모달 추가 재료 리스트 출력
	public List<ProductVO> selectBurgerStockList() {
		return sql.selectList(NS+"getBurgerStock");
	}
	
	@Override // 4번 모달 사이드 리스트 출력
	public List<ProductVO> selectSideList() {
		return sql.selectList(NS+"getSides");
	}
	
	@Override // 5번 모달 음료 리스트 출력
	public List<ProductVO> selectBeverageList() {
		return sql.selectList(NS+"getBeverage");
	}
	
	@Override
	public int updateQty(int pno, int qty) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("sales", qty);
		return sql.update(NS+"salesUp", map);
	}
	
	@Override
	public ProductVO selectOne(int pno) {
		return sql.selectOne(NS+"detail", pno);
	}

	@Override // 상품 결제시 AE에 있는 title을 가지고 pno를 출력해서 재고에서 빼야함
	public int selectPno(String title) {
		return sql.selectOne(NS+"getPno", title);
	}

	@Override
	public int update(ProductVO pvo) {
		return sql.update(NS+"mod", pvo);
	}

	@Override
	public int delete(int pno) {
		return sql.delete(NS+"del", pno);
	}

	@Override // 사진추가를 위한 현재 pno
	public int selectOne() {
		return sql.selectOne(NS+"curpno");
	}

	@Override // 관리자 리스트 글의 개수 구하기
	public int selectOne(ProductPageVO ppgvo) {
		return sql.selectOne(NS+"totalcount", ppgvo);
	}

	@Override // 소비자 리스트 글의 개수 구하기
	public int selectOne(ProductCustomerPageVO pcpgvo) {
		return sql.selectOne(NS+"totalcountcustomer", pcpgvo);
	}

	@Override // 상품 등록시 재고 리스트 받아오기
	public List<StockVO> selectList() {
		return sql.selectList(NS+"stocklist");
	}


}
