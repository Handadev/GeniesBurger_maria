package com.myweb.persistence.productfile;

import java.util.List;

import com.myweb.domain.ProductFileVO;

public interface ProductFileDAORule {
	public int insert(ProductFileVO pfvo);
	public List<ProductFileVO> selectList(int pno);
	public List<ProductFileVO> selectList(); // 파일 스위퍼용 전체 리스트
	public int delete(int pno); // 상품 삭제시 사진 파일 동시 삭제
	public int delete(String puuid); // 상품 수정시 파일 삭제
	
}
