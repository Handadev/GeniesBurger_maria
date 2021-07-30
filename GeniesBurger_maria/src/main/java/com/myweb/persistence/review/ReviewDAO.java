package com.myweb.persistence.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.myweb.domain.PurchaseVO;
import com.myweb.domain.ReviewPageVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.adCommentVO;

@Component
public class ReviewDAO implements ReviewDAORule {
	private static Logger logger = LoggerFactory.getLogger(ReviewDAO.class);
	private final String NS = "ReviewMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(ReviewVO rvo) {
		return sql.insert(NS + "add", rvo);
	}

	@Override
	public List<ReviewVO> selectList(ReviewPageVO rpgvo) {
		return sql.selectList(NS + "list", rpgvo);
	}

	@Override
	public int delete(int rno) {
		return sql.delete(NS + "del", rno);
	}

	@Override
	public int update(int rno, String rcontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", rno);
		map.put("rcontent", rcontent);
		return sql.delete(NS + "up", map);
	}

	@Override
	public int selectOne() {
		return sql.selectOne(NS + "curr");
	}

	@Override
	public int insertFile(ReviewVO rvo) {
		return sql.update(NS + "upImg", rvo);
	}

	@Override
	public List<adCommentVO> adCommentList(int rno) {
		return sql.selectList(NS + "clist", rno);
	}

	@Override
	public int adCommentInsert(int rno, String adComment) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", (Integer) rno);
		map.put("adcomment", adComment);
		return sql.insert(NS + "acReg", map);
	}

	@Override
	public int adCommentUpdate(int rno, String adComment) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", (Integer) rno);
		map.put("adcomment", adComment);
		return sql.update(NS + "acUp", map);
	}

	@Override
	public List<ReviewVO> getMyReview(String email, ReviewPageVO rpgvo) {
		int countPerPage = rpgvo.getCountPerPage();
		int pageIndex = rpgvo.getPageIndex();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", (String) email);
		map.put("countPerPage", (Integer) countPerPage);
		map.put("pageIndex", (Integer) pageIndex);
		return sql.selectList(NS + "myReview", map);
	}

	@Override
	public int selectTotalCount() {
		return sql.selectOne(NS + "tc");
	}

	@Override
	public int selectMyTotalCount(String email) {
		return sql.selectOne(NS + "myTc", email);
	}

	@Override
	public List<PurchaseVO> selectPurchase(int mno) {
		return sql.selectList(NS + "purchase", mno);
	}

	@Override
	public List<ReviewVO> purList(int purno) {
		return sql.selectList(NS + "getPur", purno);
	}

	@Override
	public int adDelete(int acno) {
		return sql.delete(NS + "adDel", acno);
	}

}
