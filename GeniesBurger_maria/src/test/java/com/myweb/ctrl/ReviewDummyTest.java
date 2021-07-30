package com.myweb.ctrl;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.ReviewVO;
import com.myweb.persistence.review.ReviewDAORule;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewDummyTest {
	private static Logger logger = LoggerFactory.getLogger(ReviewDummyTest.class);

	@Inject
	private ReviewDAORule rdao;

	@Test
	public void ReviewRegister() throws Exception {
		for (int i = 0; i < 30; i++) {
			ReviewVO rvo = new ReviewVO();
			rvo.setPno(1);
			rvo.setEmail("user@user.com");
			rvo.setRcontent("좋아요!");
			rdao.insert(rvo);
		}
	}
}
