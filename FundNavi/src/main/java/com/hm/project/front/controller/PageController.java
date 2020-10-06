package com.hm.project.front.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.PageDTO;
import com.hm.project.front.service.InvestorService;
import com.hm.project.front.service.MemberService;
import com.hm.project.front.service.NoticeService;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : PageController.java
 * @Date : 2020. 2. 26.
 * @Author : ホミン
 * @ProgramExplanation :
 */
@Controller
@Log4j
public class PageController {
	@Autowired
	private NoticeService nService;

	@Autowired
	private MemberService mService;

	@Autowired
	private InvestorService iService;

	/**
	 * @MethodExplanation : マイページページ
	 * @MethodName : mypage
	 * @Date : 2020. 2. 26.
	 * @Author : ホミン
	 * @param userid
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping(value = "/myPage")
	public String mypage(String userid, Model model, Principal principal) {
		log.info("Welcome mypage!");

		userid = principal.getName();

		model.addAttribute("member", mService.myPage(userid));

		model.addAttribute("project", iService.myPageProject(userid));

		return "front/myPage";
	}

	 /**
	  * @MethodExplanation : お知らせページ
	  * @MethodName : notice
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param cri
	  * @param model
	  * @return
	  */
	@GetMapping(value = "/notice")
	public String notice(Criteria cri, Model model) {

		log.info("list: " + cri);
		int total = nService.getTotal(cri);
		log.info("total: " + total);

//	      List<NoticeVO> list = service.boardList(NoticeVO);
//	      model.addAttribute("list", list);

		model.addAttribute("list", nService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/front/notice";
	}
	
	/**
	  * @MethodExplanation : FAQのページ
	  * @MethodName : faq
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping(value = "/faq")
	public String faq() {

		log.info("Welcome faq!");
	
		return "front/faq";
	}
	
	    /**
	  * @MethodExplanation : 会員登録
	  * @MethodName : join
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping(value = "/join")
	   public String join() {

	      log.info("Welcome join!");
	   
	      return "front/join";
	   }

}