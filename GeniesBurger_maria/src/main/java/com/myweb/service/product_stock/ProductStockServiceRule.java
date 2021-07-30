package com.myweb.service.product_stock;

import java.util.List;

import com.myweb.domain.ProductStockVO;

public interface ProductStockServiceRule {
	public int register(ProductStockVO psvo, int pno);
	public List<ProductStockVO> getList(int pno);
	public int remove(int pno);
}
