package com.myweb.persistence.productfile;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductFileVO;

@Repository
public class ProductFileDAO implements ProductFileDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductFileDAO.class);
	private final String NS = "ProductFileMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(ProductFileVO pfvo) {
		return sql.insert(NS+"reg", pfvo);
	}

	@Override
	public List<ProductFileVO> selectList(int pno) {
		return sql.selectList(NS+"list", pno);
	}

	@Override // 파일 스위퍼용 전체 리스트
	public List<ProductFileVO> selectList() {
		return sql.selectList(NS+"allList");
	}
	
	@Override // 상품 삭제시 파일도 삭제
	public int delete(int pno) {
		return sql.delete(NS+"del", pno);
	}

	@Override // 수정시 파일 삭제
	public int delete(String puuid) {
		return sql.delete(NS+"delfile", puuid);
	}


}
