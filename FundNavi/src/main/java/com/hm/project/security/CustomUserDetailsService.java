package com.hm.project.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hm.project.domain.MemberVO;
import com.hm.project.front.mapper.MemberMapper;
import com.hm.project.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: CustomUserDetailsService.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : spring security가 적용된 회원 정보를 객체에 저장
  */
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper member;

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userid);

		// userName means userid
		MemberVO vo = member.read(userid);

		log.warn("queried by member mapper: " + vo);

		//return null;
		return vo == null ? null : new CustomUser(vo);
	}

}
