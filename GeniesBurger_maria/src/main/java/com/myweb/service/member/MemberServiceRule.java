package com.myweb.service.member;

import java.util.List;

import com.myweb.domain.MemberVO;
import com.myweb.domain.MemberPageVO;

public interface MemberServiceRule {
   public int register(MemberVO mvo);
   public int checkEmail(String email);
   public List<MemberVO> getList(MemberPageVO mpgvo);
   public MemberVO login(MemberVO mvo);
   public MemberVO detail(int mno);
   public int modify(MemberVO mvo);
   public int remove(int mno);
   public int getTotalCount(MemberPageVO mpgvo);
   public List<MemberVO> getList(); // 쿠폰 발급용 멤버 리스트
   public String findID(MemberVO mvo);
   public MemberVO findQuestion(MemberVO mvo);
   public MemberVO findPwd(MemberVO mvo);
}