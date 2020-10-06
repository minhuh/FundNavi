package com.hm.project.front.service;


import java.util.List;

import com.hm.project.domain.MemberVO;
import com.hm.project.domain.ProjectVO;


 /**
  * @FileName	: MemberService.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員のservice
  */
public interface MemberService {
	
	// 회원정보
	public MemberVO get(String userid);
	
	// 프로필 수정
	public boolean update(MemberVO member);
	
	// 회원가입
	public void regist(MemberVO member);
	
	// 투자회원 등록
	public void signupInvest(MemberVO member);
	
	// 마이 페이지
	public MemberVO myPage(String userid);
	
	// 마이페이지 프로젝트들
	public List<ProjectVO> myPageProject(String userid);
	
	public List<ProjectVO> myPageProjectEnd(String userid);
	
	public int member_total();

}
