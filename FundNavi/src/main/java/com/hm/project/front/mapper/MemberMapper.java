package com.hm.project.front.mapper;

import java.util.List;

import com.hm.project.domain.MemberVO;
import com.hm.project.domain.ProjectVO;

 /**
  * @FileName	: MemberMapper.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員の Mapper interface
  */
public interface MemberMapper {

	public MemberVO read(String userid);
	
	public int insert(MemberVO member);
	
	public int update(MemberVO member);
	
	public void signupInvest(MemberVO member);

	public MemberVO myPage(String userid);
	
	public List<ProjectVO> myPageProject(String userid);
	
	public List<ProjectVO> myPageProjectEnd(String userid);
	
	public int member_total();

}
