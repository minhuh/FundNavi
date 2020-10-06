package com.hm.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hm.project.admin.service.AdminProjectService;
import com.hm.project.domain.ProjectVO;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: AdminProjectController.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : プロジェクトの管理　controller
  */
@Controller
@Log4j
public class AdminProjectController {
	
	@Autowired
	private AdminProjectService service;
	
	 /**
	  * @MethodExplanation :　進行中のプロジェクトの照会ページ
	  * @MethodName : project
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_project")
	public String project(Model model) {

		log.info("Welcome admin Project!");
		
		model.addAttribute("project", service.adminProjectGet());
	
		return "admin/admin_project";
	}

	 /**
	  * @MethodExplanation :　プロジェクトのスタート機能
	  * @MethodName : projectStarting
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param project_num
	  * @return
	  */
	@PostMapping(value="/admin/start")
	public String projectStarting(long project_num) {
		
		service.ProjectStarting(project_num);
		
		return "redirect:/admin/admin_openProject";
	}
	

	 /**
	  * @MethodExplanation :　プロジェクトの中止機能
	  * @MethodName : projectStopping
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param project_num
	  * @return
	  */
	@PostMapping(value="/admin/stop")
	public String projectStopping(long project_num) {
		
		service.ProjectStopping(project_num);
		
		return "redirect:/admin/admin_project";
	}
	
	
	 /**
	  * @MethodExplanation :　プロジェクトの削除準備機能
	  * @MethodName : projectDeleting
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param project_num
	  * @return
	  */
	@PostMapping(value="/admin/delete")
	public String projectDeleting(long project_num) {
		
		service.ProjectDeleting(project_num);
		
		return "redirect:/admin/admin_project";
	}
	
	
	 /**
	  * @MethodExplanation :　スタート予定のプロジェクトの照会ページ
	  * @MethodName : openProject
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_openProject")
	public String openProject(Model model) {

		log.info("Welcome openProject!");
		
		model.addAttribute("project", service.adminOpenProjectGet());
	
		return "admin/admin_openProject";
	}
	
	 /**
	  * @MethodExplanation :　終わったプロジェクトの照会ページ
	  * @MethodName : endproject
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_endProject")
	public String endproject(Model model) {

		log.info("Welcome endProject!");
		
		model.addAttribute("project", service.adminEndProjectGet());
	
		return "admin/admin_endProject";
	}
	
	 /**
	  * @MethodExplanation :　申し込んだプロジェクトのリストページ
	  * @MethodName : writeproject
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_writeProject")
	public String writeproject(Model model) {

		log.info("Welcome writeProject!");
		
		model.addAttribute("project", service.adminRequestProjectGet());
	
		return "admin/admin_writeProject";
	}
	
	 /**
	  * @MethodExplanation :　プロジェクトのスタート予定機能
	  * @MethodName : projectStandBying
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param project_num
	  * @return
	  */
	@PostMapping(value="/admin/standBy")
	public String projectStandBying(long project_num) {
		
		service.ProjectStandBying(project_num);
		
		return "redirect:/admin/admin_writeProject";
	}
	
	 /**
	  * @MethodExplanation :　申し込みのプロジェクトの詳細ページ
	  * @MethodName : admin_writeProject_View
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param project_num
	  * @param vo
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_writeProject_View")
	public String admin_writeProject_View(@RequestParam long project_num,ProjectVO vo,Model model) {

		log.info("Welcome writeProject!");
		
		vo = service.RequestProject(project_num);
		
		vo.setProject_num(project_num);
		
		model.addAttribute("project", vo);
	
		return "admin/admin_writeProject_View";
	}
	
	
	 /**
	  * @MethodExplanation :　プロジェクトの削除申請リストページ
	  * @MethodName : removeProject
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_removeProject")
	public String removeProject(Model model) {

		log.info("Welcome removeProject!");
		
		model.addAttribute("project", service.adminRemoveRequestProjectGet());
		
		log.info(service.adminRemoveRequestProjectGet());
	
		return "admin/admin_removeProject";
	}
	
	
	 /**
	  * @MethodExplanation :　全コメントの管理ページ
	  * @MethodName : admin_comment
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param vo
	  * @param model
	  * @return
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/admin/admin_comment")
	public String admin_comment(ProjectVO vo,Model model) {

		log.info("Welcome writeProject!");
		
		model.addAttribute("comment", service.adminCommentGet());
		
		model.addAttribute("ripple", service.adminRRippleGet());
	
		return "admin/admin_comment";
	}
	
	
	 /**
	  * @MethodExplanation :　コメントの削除機能
	  * @MethodName : CommentDelete
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param ripple_num
	  * @return
	  */
	@PostMapping(value="/admin/com_delete")
	public String CommentDelete(long ripple_num) {
		
		service.ProjectStandBying(ripple_num);
		
		return "redirect:/admin/admin_comment";
	}
	
	
	 /**
	  * @MethodExplanation :　コメント返しの削除機能
	  * @MethodName : RippleDelete
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param ripple_ripple_num
	  * @return
	  */
	@PostMapping(value="/admin/rip_delete")
	public String RippleDelete(long ripple_ripple_num) {
		
		service.RRippleDelete(ripple_ripple_num);
		
		return "redirect:/admin/admin_comment";
	}
}
