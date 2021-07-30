package com.myweb.service.member;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.MemberVO;
import com.myweb.domain.MemberPageVO;
import com.myweb.persistence.member.MemberDAORule;

@Service
public class MemberService implements MemberServiceRule {
   private static Logger logger = LoggerFactory.getLogger(MemberService.class);
   
   @Inject
   private MemberDAORule mdao;

   @Override
   public int register(MemberVO mvo) {
      return mdao.insert(mvo);
   }

   @Override
   public int checkEmail(String email) {
      return mdao.selectEmail(email);
   }

   @Override
   public List<MemberVO> getList(MemberPageVO mpgvo) {
      return mdao.selectList(mpgvo);
   }

   @Override
   public MemberVO login(MemberVO mvo) {
      return mdao.selectOne(mvo);
   }

   @Override
   public MemberVO detail(int mno) {
      return mdao.selectOne(mno);
   }

   @Override
   public int modify(MemberVO mvo) {
      return mdao.update(mvo);
   }

   @Override
   public int remove(int mno) {
      return mdao.delete(mno);
   }

	@Override
	public int getTotalCount(MemberPageVO mpgvo) {
		return mdao.selectOne(mpgvo);
	}
	
	@Override
	public List<MemberVO> getList() { // 쿠폰 발급용 멤버 리스트
		return mdao.selectList();
	}
	
	@Override
	public String findID(MemberVO mvo) {
		return mdao.selectEmail(mvo);
	}
	
	@Override
	public MemberVO findQuestion(MemberVO mvo) {
		return mdao.selectQuestion(mvo);
	}

	@Override
	public MemberVO findPwd(MemberVO mvo) {
		return mdao.selectPwd(mvo);
	}
}