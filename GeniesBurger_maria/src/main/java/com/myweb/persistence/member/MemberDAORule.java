package com.myweb.persistence.member;

import java.util.List;

import com.myweb.domain.MemberVO;
import com.myweb.domain.MemberPageVO;

public interface MemberDAORule {
	public int insert(MemberVO mvo);
	public int selectEmail(String email);
	public List<MemberVO> selectList(MemberPageVO mpgvo);
	public MemberVO selectOne(MemberVO mvo);
	public MemberVO selectOne(int mno);
	public int update(MemberVO mvo);
	public int delete(int mno);
	public int selectOne(MemberPageVO mpgvo);
	public List<MemberVO> selectList(); // 쿠폰 발급용 멤버 리스트
	public String selectEmail(MemberVO mvo);
	public MemberVO selectQuestion(MemberVO mvo);
	public MemberVO selectPwd(MemberVO mvo);
}