package com.myweb.persistence.product_stock;

import java.util.List;

import com.myweb.domain.ProductStockVO;

public interface ProductStockDAORule {
	public int insert(List<ProductStockVO> pslist);
	public List<ProductStockVO> selectList(int pno);
	public int delete(int pno);
}
