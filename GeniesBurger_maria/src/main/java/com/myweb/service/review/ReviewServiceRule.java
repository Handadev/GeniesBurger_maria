package com.myweb.service.review;

import java.util.List;

import com.myweb.domain.PurchaseVO;
import com.myweb.domain.ReviewPageVO;
import com.myweb.domain.ReviewVO;

public interface ReviewServiceRule {
	public int ReviewAdd(ReviewVO rvo);

	public List<ReviewVO> ReviewList(ReviewPageVO rpgvo);

	public int reviewDel(int rno);

	public int reviewUp(int rno, String rcontent);

	public int ReviewCurrRno();

	public int adCommentAdd(int rno, String adComment);

	public int adCommentUp(int rno, String adComment);

	public List<ReviewVO> getMyReview(String email, ReviewPageVO rpgvo);

	public int getTotalCount();

	public int getMyTotalCount(String email);

	public List<PurchaseVO> getMyPurchase(int mno);

	public int adDelete(int acno);
}
