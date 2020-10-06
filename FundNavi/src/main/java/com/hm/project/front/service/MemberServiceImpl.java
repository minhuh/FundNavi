package com.hm.project.front.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.domain.MemberVO;
import com.hm.project.domain.ProjectVO;
import com.hm.project.front.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


 /**
  * @FileName	: MemberServiceImpl.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員のservice implements
  */
@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;

	@Override
	public MemberVO get(String userid) {

		log.info("get......." + userid);
		
		return mapper.read(userid);
	}
//	
	public void regist(MemberVO member) {
		log.info("regist......." + member);
		
		mapper.insert(member);
	};

	@Override
	public boolean update(MemberVO member) {
		
		log.info("update......." + member);
		
		return mapper.update(member) == 1;
	}
	@Override
	public void signupInvest(MemberVO member) {
		// TODO Auto-generated method stub
		
		log.info("invester......" + member);
		
		mapper.signupInvest(member);
	}
	@Override
	public MemberVO myPage(String userid) {
		// TODO Auto-generated method stub
		log.info("myPage......." + userid);
		
		return mapper.myPage(userid);
	}
	@Override
	public List<ProjectVO> myPageProject(String userid) {
		// TODO Auto-generated method stub
		log.info("myPageProject......." + userid);
		
		return mapper.myPageProject(userid);
	}
	@Override
	public List<ProjectVO> myPageProjectEnd(String userid) {
		// TODO Auto-generated method stub
		
		return mapper.myPageProjectEnd(userid);
	}
	@Override
	public int member_total() {
		log.info("get member_total");
		return mapper.member_total();
	}
	
}
