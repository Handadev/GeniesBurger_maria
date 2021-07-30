package com.myweb.orm;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.domain.ProductFileVO;
import com.myweb.persistence.productfile.ProductFileDAORule;

import net.coobird.thumbnailator.Thumbnails;

@Component
public class ProductFileProcessor {
	private static Logger logger = LoggerFactory.getLogger(ProductFileProcessor.class);
	
	@Inject
	private ProductFileDAORule pfdao;
	
	public int upload_file(MultipartFile[] files, int pno) {
		final String UP_DIR = "C:\\_javaweb\\_spring\\workspace\\upload\\";
		
		// 파일을 많이 올리면 올릴 수록 관리측으로 좋지 않기 때문에 폴더를 나눈다
		// ex upload/2012/06/28/uuid_fname.jpg -> 이미지라면 썸네일도 만들어야함 : uuid_th_fname.jpg
		LocalDate date = LocalDate.now(); //w3school > java 참고
		String today = date.toString(); // 2012\06\26 이런 형식으로 생성됨
		today = today.replace("-", File.separator); //실질적 '/'넣음
		
		File folder = new File(UP_DIR, today);
		if (!folder.exists()) folder.mkdirs(); //계층구조로 만들 때는 dirs를 많이 사용한다
		
		int isUp = 1;
		for (MultipartFile f : files) {
			ProductFileVO pfvo = new ProductFileVO();
			pfvo.setSavedir(today);
			String originalFileName = f.getOriginalFilename();
			logger.info("FileProcessor 에서 실제로 들어오는 파일 이름 = "+originalFileName);
			pfvo.setFname(originalFileName);
			// 암호화하는 것은 java 것을 그대로 쓰거나, 회사에서 사용하는 라이브러니나 알고리즘을 땡겨와서 사용하면 됨
			UUID uuid = UUID.randomUUID();
			pfvo.setPuuid(uuid.toString());
			
			String fullFileName = uuid.toString() + "_" + originalFileName;
			File storeFile = new File(folder, fullFileName); // 파일객체이름 생성
			
			try {
				f.transferTo(storeFile);
				
				if(isImageFile(storeFile)) {
					File thumbnail = new File(folder, uuid.toString() + "_th_" + originalFileName);
					Thumbnails.of(storeFile).size(250, 250).toFile(thumbnail); // Thumbnailator 라이브러리
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pfvo.setPno(pno);
			isUp *= pfdao.insert(pfvo); //기본적인 파일저장은 여기까지
			
		} 
		
		return isUp;
	}

	private boolean isImageFile(File storeFile) {
		try {
			String mimeType = new Tika().detect(storeFile);
			return mimeType.startsWith("image") ? true : false;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int deleteFile(String puuid) {
		return pfdao.delete(puuid);
	}
	
	
	
}
