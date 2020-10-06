package com.hm.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hm.project.admin.service.AdminMemberService;
import com.hm.project.admin.service.AdminProjectService;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: AdminDashboardController.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 管理ページの統計　controller
  */
@Controller
@Log4j
public class AdminDashboardController {
	
	@Autowired
	private AdminProjectService service;
	
	@Autowired
	private AdminMemberService memberService;

	 /**
	  * @MethodExplanation : 全プロジェクトの統計　ページ
	  * @MethodName : dashboardProject
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "admin/admin_dashboardProject")
	public String dashboardProject(Model model) {

		log.info("Welcome dashboardProject!");
		
		model.addAttribute("count", service.projectDashboardCountGet());
		
		model.addAttribute("category", service.projectDashboardCategoryRankGet());
		
		model.addAttribute("project", service.projectDashboardProjectRankGet());
	
		return "admin/admin_dashboardProject";
	}	
	 
	 /**
	  * @MethodExplanation : 全投資の統計　ページ
	  * @MethodName : dashboardInvest
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_invest")
	public String dashboardInvest(Model model) {

		log.info("Welcome invest!");
		
		model.addAttribute("count", service.investCountProjectCount());
		
		model.addAttribute("idCnt", memberService.investorCountGet());
		
		model.addAttribute("member", memberService.investRankGet());
	
		return "admin/admin_invest";
	}
	
}
