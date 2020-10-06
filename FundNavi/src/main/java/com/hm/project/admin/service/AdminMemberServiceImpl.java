package com.hm.project.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.admin.mapper.AdminMemberMapper;
import com.hm.project.domain.Criteria;
import com.hm.project.domain.MemberVO;

import lombok.extern.log4j.Log4j;


 /**
  * @FileName	: AdminMemberServiceImpl.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員関連のservice implements
  */
@Log4j
@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberMapper mapper;

	@Override
	public List<MemberVO> adminUserGet() {
		log.info("user list get......" + mapper.adminUserGet());
		
		return mapper.adminUserGet();
	}

	@Override
	public MemberVO investorCountGet() {
		// TODO Auto-generated method stub
		log.info("investor count get......" + mapper.investorCountGet());
		
		return mapper.investorCountGet();
	}

	@Override
	public List<MemberVO> investRankGet() {
		// TODO Auto-generated method stub
		log.info("investor rank get......");
		
		return mapper.investRankGet();
	}

}
