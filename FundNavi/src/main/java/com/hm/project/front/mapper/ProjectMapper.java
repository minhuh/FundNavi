package com.hm.project.front.mapper;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.ProjectVO;


 /**
  * @FileName	: ProjectMapper.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : プロジェクトの Mapper interface
  */
public interface ProjectMapper {
	
	public List<ProjectVO> getList(Criteria cri);
	
	public List<ProjectVO> home_slide();
	
	public List<ProjectVO> getListWithPaging(Criteria cri);
	
	public List<ProjectVO> getListWithPagingCategory(Criteria cri);
	
	public void insert(ProjectVO board);
	
	public ProjectVO read(Long pno);
	
	public int delete(Long pno);

	public int state_change(Long pno);	//글 삭제를 위한 변수
	
	public int update(ProjectVO board);
	
	public Integer insertSelectKey(ProjectVO board);
	
	public int getTotalCount(Criteria cri);
	
	public int project_getTotalCount(Criteria cri);
	
	public List<ProjectVO> getHomeOpenProject();
}
