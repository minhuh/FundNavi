package com.hm.project.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;
import com.hm.project.domain.PageDTO;
import com.hm.project.front.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @FileName : NoticeController.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : お知らせのcontroller
 */
@Controller
@Log4j
@RequestMapping("/front/*")
@AllArgsConstructor
public class NoticeController {

	@Autowired
	private NoticeService service;

	/**
	 * @MethodExplanation : お知らせのリストページ
	 * @MethodName : list
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/notice")
	public String list(Criteria cri, Model model) {

		log.info("list: " + cri);
		int total = service.getTotal(cri);
		log.info("total: " + total);

		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/front/notice";
	}

	// file upload가 추가된 게시판 등록
	/**
	 * @MethodExplanation : お知らせの登録機能
	 * @MethodName : register
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param board
	 * @param rttr
	 * @return
	 */
	@PostMapping("/register")
	public String register(NoticeVO board, RedirectAttributes rttr) { //

		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getNotice_num());

		return "redirect:/notice";
	}

	/**
	 * @MethodExplanation : お知らせの詳細ページ
	 * @MethodName : noticeGet
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param notice_num
	 * @param model
	 * @return
	 */
	@GetMapping("/notice_detail")
	public String noticeGet(@RequestParam long notice_num, Model model) {
		log.info("No." + notice_num + " content......");

		model.addAttribute("notice", service.get(notice_num));

		return "/front/notice_detail";
	}

	/**
	 * @MethodExplanation : お知らせの修正
	 * @MethodName : modify
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param board
	 * @param cri
	 * @param rttr
	 * @return
	 */
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.userid")
	public String modify(NoticeVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);

		// 정상적으로 update된 행이 있다면 service.modify(board)값은 true다.
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		// 위에 4줄은 remove도 있음. 실행은 되지만 중복은 제거해 줘야함 cri.getListLink를 만들어 줌으로써 제거가능 간결해짐
		// 한 부분만 쓰이면 안만들어도 됨
		return "redirect:/board/list" + cri.getListLink();
	}
	
	 

}
