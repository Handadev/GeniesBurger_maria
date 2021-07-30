package com.myweb.service.product_stock;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.ProductStockVO;
import com.myweb.persistence.product_stock.ProductStockDAORule;

@Service
public class ProductStockService implements ProductStockServiceRule{
	private static Logger logger = LoggerFactory.getLogger(ProductStockService.class);

	@Inject
	private ProductStockDAORule psdao;

	@Override
	public int register(ProductStockVO psvo, int pno) {
		// 여기서 String을 리스트로 풀어야함
		List<ProductStockVO> pslist = new ArrayList<ProductStockVO>();
		String[] snameArr = psvo.getSname().split(",");
		
		for (String sname : snameArr) {
			pslist.add(new ProductStockVO(sname, pno));
		}
		return psdao.insert(pslist);
	}

	@Override
	public List<ProductStockVO> getList(int pno) {
		return psdao.selectList(pno);
	}

	@Override
	public int remove(int pno) {
		return 0;
	}
	
}
