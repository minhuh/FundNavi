package com.hm.project.domain;

import java.util.List;

import lombok.Data;

 /**
  * @FileName	: MemberVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員関連
  */
@Data
public class MemberVO {

	// userid, userpw 이름은 그대로 사용하고 나머지는 프로젝트별 생성한 table 컬럼명에 맞춰 작성
	// spring security 적용으로 로그인 시 소스를 교재 소스 그대로 사용하기 위해.
	private String userid;
	private String userpw;
	private String phone;
	private String address;
	private String job;
	private String account;
	private String profile_image;
	private String interesting_category;
	private String self_introduce;
	private String name;
	private String bank;
	private String nickname;
	private String auth;
	private String title;
	private long money;
	private String dat;

	/* 어드민 멤버 전용 */
	private String nowJob;
	private String acc;

	private List<AuthVO> authList;

	private int id;
	private int rownum;
	private int su;

}
