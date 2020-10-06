package com.hm.project.front.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.project.domain.MemberVO;
import com.hm.project.front.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: MemberController.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員関連のcontroller
  */
@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

	@Autowired
	private MemberService service;

	 /**
	  * @MethodExplanation :　会員登録の完了
	  * @MethodName : joinsuccess
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping(value = "/joinsuccess")
	public String joinsuccess() {
		log.info("joinsuccess!");
		return "front/joinsuccess";
	}

	 /**
	  * @MethodExplanation :　投資家登録
	  * @MethodName : investorjoin
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param member
	  * @return
	  */
	@GetMapping(value = "/investorjoin")
	public String investorjoin(MemberVO member) {

		log.info("Welcome investorjoin!");

		return "front/investorjoin";
	}

	 /**
	  * @MethodExplanation :　投資家登録の完了
	  * @MethodName : investorsuccess
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping(value = "/investorsuccess")
	public String investorsuccess() {
		log.info("investorsuccess!");
		return "front/investorsuccess";
	}


	 /**
	  * @MethodExplanation :　会員登録
	  * @MethodName : register
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param member
	  * @param model
	  * @return
	  */
	@RequestMapping("/join")
	@PostMapping("/join")
	public String register(MemberVO member, Model model) {

		log.info("register...");

		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		String password = encoder.encode(member.getUserpw());
		member.setUserpw(password);

		service.regist(member);

		return "redirect:/joinsuccess";
	}

	 /**
	  * @MethodExplanation :　投資家会員登録
	  * @MethodName : joinInvest
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param member
	  * @param principal
	  * @return
	  */
	@RequestMapping("/investorjoin")
	@PostMapping("/investorjoin")
	public String joinInvest(MemberVO member, Principal principal) {

		log.info("register...");

		String userid = principal.getName();

		member.setUserid(userid);

		service.signupInvest(member);

		return "redirect:/investorsuccess";
	}

}
