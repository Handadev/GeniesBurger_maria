package com.myweb.ctrl;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.ProductFileVO;
import com.myweb.domain.ProductVO;
import com.myweb.persistence.product.ProductDAO;
import com.myweb.persistence.product.ProductDAORule;
import com.myweb.persistence.productfile.ProductFileDAORule;
import com.myweb.service.product.ProductServiceRule;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductDAOTest {
	private static Logger logger = LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Inject
	private ProductDAORule pdao;
	
	@Inject
	private ProductFileDAORule pfdao;
	
	@Test
	public void productRegister() throws Exception {
		for (int i = 0; i < 5; i++) {
			ProductVO pvo = new ProductVO();
			pvo.setTitle("상품 이름"+i);
			pvo.setContent("상품 텍스트"+i);
			pvo.setPrice(10000);
			pvo.setCategory(1);
			pvo.setCalorie(100);
			
			pdao.insert(pvo);
		}
	}
	
//	@Test
//	public void isfileTest() throws Exception {
//		final String BASE_PATH = "C:\\_javaweb\\_spring\\workspace\\upload\\";
//		
//		ArrayList<String> currFiles = new ArrayList<String>();
//		
//		List<ProductFileVO> dbFileList = pfdao.selectList(); 
//		for (ProductFileVO fvo : dbFileList) {
//			String file_path = fvo.getSavedir()+"\\"+fvo.getPuuid()+"_";
//			String file_name = fvo.getFname();
//			currFiles.add(BASE_PATH+file_path+file_name);
//			currFiles.add(BASE_PATH+file_path+"_th_"+file_name);
//			
//		}
//		for (String files : currFiles) {
//			logger.info("currFiles String = "+files);
//		}
//		
//		// 저장되어있는 모든 파일 검색
//		LocalDate now = LocalDate.now();
//		String today = now.toString();
//		today = today.replace("-", File.separator);
//		
//		File dir = Paths.get(BASE_PATH+today).toFile();
//		File[] allFileObj = dir.listFiles(); // 해당 위치에 있는 파일들을 전부 리스트화해서 배열 안에 넣음
//		if (allFileObj.length != 0) {
//			for (File file : allFileObj) {
//				String storedFileName = file.toPath().toString();
//				logger.info("storedFileName String = "+storedFileName);
//			}
//		}
//		
//	}
 	
//	@Test
//	public void productUpdate() throws Exception {
//			ProductVO pvo = new ProductVO();
//			pvo.setTitle("변경한 이름");
//			pvo.setContent("변경함");
//			pvo.setPrice(50000);
//			pvo.setCategory(4);
//			pvo.setPno(30);
//			pdao.update(pvo);
//	}

//	@Test
//	public void productList() throws Exception {
//		List<ProductVO> list = pdao.selectList();
//		
//	}
	
//	@Test
//	public void productDetail() throws Exception {
//		ProductVO pvo = pdao.selectOne(30);
//		logger.info("pvo3"+pvo);
//	}

//	@Test
//	public void productRemove() throws Exception {
//		pdao.delete(31);
//	}
}
