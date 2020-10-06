package com.hm.project.admin.mapper;

import java.util.List;

import com.hm.project.domain.MemberVO;

 /**
  * @FileName	: AdminMemberMapper.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員関連のmapper
  */
public interface AdminMemberMapper {

	public List<MemberVO> adminUserGet();
	
	public MemberVO investorCountGet();
	
	public List<MemberVO> investRankGet();
}
