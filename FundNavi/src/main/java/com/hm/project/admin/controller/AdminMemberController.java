package com.hm.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hm.project.admin.service.AdminMemberService;
import com.hm.project.domain.Criteria;
import com.hm.project.domain.MemberVO;

import lombok.extern.log4j.Log4j;


 /**
  * @FileName	: AdminMemberController.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員管理　controller
  */
@Controller
@Log4j
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	
	 /**
	  * @MethodExplanation :　全会員のリストページ
	  * @MethodName : member
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_member")
	public String member(Model model) {

		log.info("Welcome member!");
		
		log.info("member call... " + service.adminUserGet());
		
		model.addAttribute("member", service.adminUserGet());
	
		return "admin/admin_member";
	}
	
}
