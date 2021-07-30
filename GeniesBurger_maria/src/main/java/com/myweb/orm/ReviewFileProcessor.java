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

import com.myweb.domain.ReviewVO;
import com.myweb.persistence.review.ReviewDAORule;

import net.coobird.thumbnailator.Thumbnails;

@Component
public class ReviewFileProcessor {
	private static Logger logger = LoggerFactory.getLogger(ReviewFileProcessor.class);

	@Inject
	private ReviewDAORule rdao;

	public int upload_file(MultipartFile[] files, int rno) {
		final String UP_DIR = "C:\\_javaweb\\_spring\\workspace\\upload\\";

		// upload/2021/06/28/uuid_fname.jpg => if 이미지 : uuid_th_fname.jpg

		LocalDate date = LocalDate.now(); // w3school > java
		String today = date.toString(); // 2021-06-28
		today = today.replace("-", File.separator); // 2021\\06\\28

		File folder = new File(UP_DIR, today);

		if (!folder.exists())
			folder.mkdirs();

		int isUp = 1;

		for (MultipartFile r : files) {
			ReviewVO rvo = new ReviewVO();
//			today = today.replace("\\","/");
			rvo.setRsavedir(today);

			String originalFileName = r.getOriginalFilename();
			logger.info(">>> originalFileName ? : " + originalFileName);

			rvo.setRfname(originalFileName);

			UUID uuid = UUID.randomUUID();
			rvo.setRuuid(uuid.toString());

			String fullFileName = uuid.toString() + "_" + originalFileName;
			File storeFile = new File(folder, fullFileName);

			try {
				r.transferTo(storeFile);

				if (isImageFile(storeFile)) {
					rvo.setRftype(1);
					File thumbnail = new File(folder, uuid.toString() + "_th_" + originalFileName);
					Thumbnails.of(storeFile).size(100, 100).toFile(thumbnail);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			rvo.setRno(rno);
			isUp *= rdao.insertFile(rvo);
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

}
