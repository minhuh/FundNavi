package com.hm.project.front.controller;

import java.security.Principal;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.PageDTO;
import com.hm.project.domain.ProjectVO;
import com.hm.project.front.service.InvestorService;
import com.hm.project.front.service.MemberService;
import com.hm.project.front.service.ProjectService;
import com.hm.project.front.service.RippleService;
import com.hm.project.security.CustomUserDetailsService;
import com.hm.project.util.UploadUtils;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : ProjectController.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : プロジェクト関連のcontroller
 */
@Controller
@Log4j
@RequestMapping("front/*")
public class ProjectController {
	@Autowired
	private ProjectService service;
	@Autowired
	private InvestorService service2;
	@Autowired
	private RippleService service3;
	@Autowired
	private MemberService service4;

	// 자바 소스에서 경로 읽어오기 위해서
	// globalConfig.uploadPath라고하는 것을 읽어와서 uploadPath에 저장
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;

	/**
	 * @MethodExplanation : プロジェクトのページ
	 * @MethodName : project
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 */
	@GetMapping(value = "/project")
	public void project(Criteria cri, Model model) {
		log.info("Welcome project!");

		model.addAttribute("rank_list", service.getList(cri));
		cri.setP_type("ongoing");

		log.info("list: " + cri + " " + cri.getAmount() + " " + cri.getPageNum());
		model.addAttribute("list", service.getListWithPaging(cri));

		int total = service.project_getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/**
	 * @MethodExplanation : スタート予定のプロジェクトのリストページ
	 * @MethodName : open
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 */
	@GetMapping(value = "/open")
	public void open(Criteria cri, Model model) {

		log.info("Welcome open!");

		cri.setP_distinct("ongoing");
		cri.setP_type("open");
		log.info("list: " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.project_getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/**
	 * @MethodExplanation : 文化関連のプロジェクト
	 * @MethodName : culture
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 */
	@GetMapping(value = "/culture_project")
	public void culture(Criteria cri, Model model) {
		log.info("Welcome culture_project!");

		cri.setP_type("culture");
		model.addAttribute("rank_list", service.getList(cri));
		log.info("list: " + cri + " " + cri.getAmount() + " " + cri.getPageNum());
		model.addAttribute("list", service.getListWithPaging(cri));

		int total = service.project_getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	/**
	 * @MethodExplanation : 終わったプロジェクト
	 * @MethodName : end
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 */
	@GetMapping(value = "/end")
	public void end(Criteria cri, Model model) {
		log.info("Welcome end!");
		cri.setP_distinct("end");
		cri.setP_type("end");
		log.info("list: " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.project_getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/**
	 * @MethodExplanation : プロジェクトの作成
	 * @MethodName : projectwrite
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 */
	@GetMapping(value = "/project_write")
	@PreAuthorize("isAuthenticated()") // 인증된 사용자 라는 뜻 true
	public void projectwrite() {

		log.info("Welcome writer!");

	}

	/**
	 * @MethodExplanation : プロジェクトの作成機能
	 * @MethodName : projectwrite
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param uploadFile
	 * @param project
	 * @param rttr
	 * @return
	 */
	@PostMapping("/project_write1")
	public String projectwrite(MultipartFile[] uploadFile, ProjectVO project, RedirectAttributes rttr) {

		int index = 0;
		for (MultipartFile multipartFile : uploadFile) {
			if (multipartFile.getSize() > 0) {
				switch (index) {
				case 0:
					project.setTitle_image(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 1:
					project.setAttach_1(UploadUtils.uploadFormPost(multipartFile, uploadPath)); // 배열로 처리되기때문에 index가
																								// 0일경우
					break;
				case 2:
					project.setContents_image1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 3:
					project.setContents_image2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 4:
					project.setAttach_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				default:
					project.setAttach_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				}
				index++;
			}
		}

		log.info("register: " + project);
		service.register(project);
		rttr.addFlashAttribute("result", project.getProject_num());

		return "redirect:/front/project";
	}

	/**
	 * @MethodExplanation : 作成が完了した後
	 * @MethodName : projectwriteFinish
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @return
	 */
	@GetMapping(value = "/project_write_finish")
	public String projectwriteFinish() {

		log.info("Welcome writer_finish!");

		return "front/project_write_finish";
	}

	/**
	 * @MethodExplanation : プロジェクトの詳細ページ
	 * @MethodName : projectDetail
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param pno
	 * @param cri
	 * @param model
	 * @param principal
	 */
	@GetMapping("/single")
	public void projectDetail(@RequestParam("project_num") Long pno, @ModelAttribute("cri") Criteria cri, Model model,
			Principal principal) {

		log.info("Welcome projectDetail!");

		log.info("project_log" + service.get(pno));
		model.addAttribute("project", service.get(pno));

		// 로그인 값 안넣어도 들어가게끔 if문
		log.info("testtest" + principal);
		if (principal != null) {
			String id = principal.getName();
			log.info("get_test: " + service4.get(id));
			model.addAttribute("login_user", service4.get(id));
		}

		log.info("investorList_log" + service2.getList(pno));
		model.addAttribute("investorList", service2.getList(pno));

		log.info("service3_log " + service3.getList(pno));
		model.addAttribute("ripple", service3.getList(pno));

		if (principal != null) {
			String id = principal.getName();
			log.info("service4_log : " + service4.myPage(id));
			model.addAttribute("login_info", service4.myPage(id));
			model.addAttribute("princ", principal.getName());
		}
	}

	/**
	 * @MethodExplanation : 終わったプロジェクトの詳細ページ
	 * @MethodName : projectDetail2
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param pno
	 * @param cri
	 * @param model
	 * @param principal
	 */
	@GetMapping("/single_end")
	public void projectDetail2(@RequestParam("project_num") Long pno, @ModelAttribute("cri") Criteria cri, Model model,
			Principal principal) {

		log.info("Welcome projectDetailEnd!");

		log.info("project_log" + service.get(pno));
		model.addAttribute("project", service.get(pno));

		// 로그인 값 안넣어도 들어가게끔 if문
		log.info("testtest" + principal);
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("login_user", service4.get(id));
		}

		log.info("investorList_log" + service2.getList(pno));
		model.addAttribute("investorList", service2.getList(pno));

		log.info("service3_log " + service3.getList(pno));
		model.addAttribute("ripple", service3.getList(pno));

		if (principal != null) {
			model.addAttribute("princ", principal.getName());
		}
	}

	/**
	 * @MethodExplanation : スタート予定のプロジェクトの詳細ページ
	 * @MethodName : projectDetail3
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param pno
	 * @param cri
	 * @param model
	 * @param principal
	 */
	@GetMapping("/single_open")
	public void projectDetail3(@RequestParam("project_num") Long pno, @ModelAttribute("cri") Criteria cri, Model model,
			Principal principal) {

		log.info("Welcome projectDetailOpen!");

		log.info("project_log" + service.get(pno));
		model.addAttribute("project", service.get(pno));

		// 로그인 값 안넣어도 들어가게끔 if문
		log.info("testtest" + principal);
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("login_user", service4.get(id));
		}

		log.info("investorList_log" + service2.getList(pno));
		model.addAttribute("investorList", service2.getList(pno));

		log.info("service3_log " + service3.getList(pno));
		model.addAttribute("ripple", service3.getList(pno));

	}

	/**
	 * @MethodExplanation : 削除の待機状態機能
	 * @MethodName : remove_standBy
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param pno
	 * @param cri
	 * @param rttr
	 * @param userid
	 * @return
	 */
	@PostMapping("/remove_standBy")
	@PreAuthorize("principal.username == #userid")
	public String remove_standBy(@RequestParam("pno") Long pno, Criteria cri, RedirectAttributes rttr, String userid) {

		log.info("remove..." + pno);
		if (service.remove_standBy(pno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/front/project" + cri.getListLink();
	}

	/**
	 * @MethodExplanation : 完全に削除する機能
	 * @MethodName : remove
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param pno
	 * @param cri
	 * @param rttr
	 * @return
	 */
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") Long pno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + pno);
		if (service.remove(pno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/front/project" + cri.getListLink();
	}

}
