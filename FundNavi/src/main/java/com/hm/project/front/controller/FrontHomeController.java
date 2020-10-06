package com.hm.project.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.PageDTO;
import com.hm.project.front.service.MemberService;
import com.hm.project.front.service.ProjectService;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: FrontHomeController.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : メインページのcontroller
  */
@Controller
@Log4j
public class FrontHomeController {
	@Autowired
	private ProjectService service;
	@Autowired
	private MemberService service2;

	 /**
	  * @MethodExplanation :　front/home.jsp　メインページ
	  * @MethodName : home
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param cri
	  * @param model
	  * @return　call jsp view
	  */
	@GetMapping(value = "/")
	public String home(Criteria cri, Model model) {

		log.info("Welcome home!");
		model.addAttribute("rank_list", service.getList(cri));
		model.addAttribute("main_slide", service.homeGetList());
		
		cri.setP_type("0");

	    log.info("list: " + cri + " " + cri.getAmount() + " " +cri.getPageNum());
	    model.addAttribute("list", service.getList(cri));
	    model.addAttribute("openProject", service.getHomeOpenProject());
	    
	    int total = service.project_getTotal(cri);
	    cri.setP_type("end");
	    
	    int total2 = service.project_getTotal(cri);
	    model.addAttribute("projectCnt", total);
	    model.addAttribute("projectEndCnt", total2);
	    
	    log.info("total:" + service2.member_total());
	    int total3 = service2.member_total();
	    model.addAttribute("memberCnt", total3);
	    
		return "front/home";
	}
	
}
