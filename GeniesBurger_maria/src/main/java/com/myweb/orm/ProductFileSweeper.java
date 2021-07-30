package com.myweb.orm;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.domain.ProductFileVO;
import com.myweb.persistence.productfile.ProductFileDAORule;

@Component
public class ProductFileSweeper {
	private static Logger logger = LoggerFactory.getLogger(ProductFileSweeper.class);
	private final String BASE_PATH = "C:\\_javaweb\\_spring\\workspace\\upload\\";
	
	@Inject
	private ProductFileDAORule pfdao;
	
	// db 확인하고 실제 파일 위치 확인하고 db에 존재하지 않는 파일은 싹다 지움
	// 초 - 분 - 시 - 일 - 월 - 요일 - 연도(옵션) * = 매/일.월.요일
	@Scheduled(cron = "59 59 23 * * *")
	public void fileSweep() throws Exception{
		logger.info(">>>>> FileSweeper > fileSweep() 시작");
		logger.info(">>>>> fileSweep() 시작 시간" + LocalDateTime.now());
		
		// DB에 등록된 파일 저장경로
		ArrayList<String> currFiles = new ArrayList<String>();
		
		List<ProductFileVO> dbFileList = pfdao.selectList(); 
		for (ProductFileVO fvo : dbFileList) {
			String file_path = fvo.getSavedir()+"\\"+fvo.getPuuid()+"_";
			String file_name = fvo.getFname();
			currFiles.add(BASE_PATH+file_path+file_name);
			currFiles.add(BASE_PATH+file_path+"_th_"+file_name);
			
		}
		for (String files : currFiles) {
			logger.info("currFiles String = "+files);
		}
		
		// 저장되어있는 모든 파일 검색
		LocalDate now = LocalDate.now();
		String today = now.toString();
		today = today.replace("-", File.separator);
		
		File dir = Paths.get(BASE_PATH+today).toFile();
		File[] allFileObj = dir.listFiles(); // 해당 위치에 있는 파일들을 전부 리스트화해서 배열 안에 넣음
		if (allFileObj.length != 0) {
			for (File file : allFileObj) {
				String storedFileName = file.toPath().toString();
				logger.info("storedFileName String = "+storedFileName);
				if(!currFiles.contains(storedFileName)) 
					file.delete();
			}
		}
		
	}
	
	
	
}
