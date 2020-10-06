package com.hm.project.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.domain.InvestorVO;
import com.hm.project.front.service.InvestorService;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: InvestorController.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : ファンディングのcontroller
  */
@Controller
@Log4j
@RequestMapping("invest/*")
public class InvestorController {
	@Autowired
	private InvestorService service;

	 /**
	  * @MethodExplanation :　ファンディング機能
	  * @MethodName : projectwrite
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param investor
	  * @param rttr
	  * @return
	  */
	@PostMapping("/funding")
//	@PreAuthorize("isAuthenticated()") //인증된 사용자 라는 뜻 true
	public String funding(InvestorVO investor, RedirectAttributes rttr) {

		log.info("Controller_funding: " + investor);
		service.funding(investor);
		log.info("funding_project_num: " + investor.getProject_num());
		service.update_current(investor);
		rttr.addFlashAttribute("result", investor.getProject_num());

		return "redirect:/front/single?project_num=" + investor.getProject_num();
	}

}
