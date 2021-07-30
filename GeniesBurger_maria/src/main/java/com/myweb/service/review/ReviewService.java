package com.myweb.service.review;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.PurchaseVO;
import com.myweb.domain.ReviewPageVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.adCommentVO;
import com.myweb.persistence.review.ReviewDAORule;

@Service
public class ReviewService implements ReviewServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ReviewService.class);

	@Inject
	private ReviewDAORule rdao;

	@Override
	public int ReviewAdd(ReviewVO rvo) {
		return rdao.insert(rvo);
	}

	@Override
	public List<ReviewVO> ReviewList(ReviewPageVO rpgvo) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		List<ReviewVO> rlist = rdao.selectList(rpgvo);
		for (ReviewVO rvo : rlist) {
			int rno = rvo.getRno();
			List<adCommentVO> clist = rdao.adCommentList(rno);
			rvo.setClist(clist);
			list.add(rvo);
		}
		return list;
	}

	@Override
	public int reviewDel(int rno) {
		return rdao.delete(rno);
	}

	@Override
	public int reviewUp(int rno, String rcontent) {
		return rdao.update(rno, rcontent);
	}

	@Override
	public int ReviewCurrRno() {
		return rdao.selectOne();
	}

	@Override
	public int adCommentAdd(int rno, String adComment) {
		return rdao.adCommentInsert(rno, adComment);
	}

	@Override
	public int adCommentUp(int rno, String adComment) {
		return rdao.adCommentUpdate(rno, adComment);
	}

	@Override
	public List<ReviewVO> getMyReview(String email, ReviewPageVO rpgvo) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		List<ReviewVO> rlist = rdao.getMyReview(email, rpgvo);
		for (ReviewVO rvo : rlist) {
			int rno = rvo.getRno();
			List<adCommentVO> clist = rdao.adCommentList(rno);
			rvo.setClist(clist);
			list.add(rvo);
		}
		return list;
	}

	@Override
	public int getTotalCount() {
		return rdao.selectTotalCount();
	}

	@Override
	public int getMyTotalCount(String email) {
		return rdao.selectMyTotalCount(email);
	}

	@Override
	public List<PurchaseVO> getMyPurchase(int mno) {
		return rdao.selectPurchase(mno);
	}

	@Override
	public int adDelete(int acno) {
		return rdao.adDelete(acno);
	}

}
