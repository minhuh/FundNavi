package com.hm.project.admin.mapper;

import java.util.List;

import com.hm.project.domain.ProjectVO;
import com.hm.project.domain.RippleRippleVO;
import com.hm.project.domain.RippleVO;


 /**
  * @FileName	: AdminProjectMapper.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : プロジェクト「コンテンツ」関連のmapper
  */
public interface AdminProjectMapper {

	public List<ProjectVO> adminProjectGet();
	
	public void ProjectStarting(long project_num);
	
	public void ProjectStopping(long project_num);
	
	public void ProjectDeleting(long project_num);
	
	public void ProjectStandBying(long project_num);
	
	public List<ProjectVO> adminOpenProjectGet();
	
	public List<ProjectVO> adminEndProjectGet();
	
	public List<ProjectVO> adminRequestProjectGet();
	
	public List<ProjectVO> adminRemoveRequestProjectGet();
	
	public ProjectVO RequestProject(long project_num);
	
	public List<RippleVO> adminCommentGet();
	
	public List<RippleRippleVO> adminRRippleGet();
	
	public ProjectVO projectDashboardCountGet();
	
	public ProjectVO projectDashboardCategoryRankGet();
	
	public List<ProjectVO> projectDashboardProjectRankGet();
	
	public ProjectVO investCountProjectCount();
	
	public void commentDelete(long ripple_num);
	
	public void RRippleDelete(long ripple_ripple_num);
}
