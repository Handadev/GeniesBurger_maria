package com.myweb.persistence.product_stock;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductStockVO;

@Repository
public class ProductStockDAO implements ProductStockDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductStockDAO.class);
	private final String NS = "ProductStockMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(List<ProductStockVO> pslist) {
		return sql.insert(NS+"reg", pslist);
	}

	@Override
	public List<ProductStockVO> selectList(int pno) {
		return sql.selectList(NS+"list", pno);
	}

	@Override
	public int delete(int pno) {
		return sql.delete(NS+"del", pno);
	}

}
