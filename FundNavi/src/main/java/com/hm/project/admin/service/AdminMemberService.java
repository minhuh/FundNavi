package com.hm.project.admin.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.MemberVO;


 /**
  * @FileName	: AdminMemberService.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員関連のservice
  */
public interface AdminMemberService {
	
	public List<MemberVO> adminUserGet();
	
	public MemberVO investorCountGet();
	
	public List<MemberVO> investRankGet();
}
