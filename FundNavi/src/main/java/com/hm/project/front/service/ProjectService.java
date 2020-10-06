package com.hm.project.front.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.ProjectVO;

 /**
  * @FileName	: ProjectService.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : プロジェクトのservice
  */
public interface ProjectService {
	//글등록
	public void register(ProjectVO project);
	
	//글 상세보기
	public ProjectVO get(Long pno);

	//전체 글 목록
	public List<ProjectVO> getList(Criteria cri);
	
	//메인 홈 슬라이드 게시물
	public List<ProjectVO> homeGetList();

	//글 수정
	public boolean modify(ProjectVO project);
	
	//글 삭제
	public boolean remove(Long pno);
	
	public boolean remove_standBy(Long pno);
	
	//글 목록 페이징
	public List<ProjectVO> getListWithPaging(Criteria cri);
	
	//카테고리별 페이징
	public List<ProjectVO> getListWithPagingCategory(Criteria cri);
		
	//추가
	public int getTotal(Criteria cri);

	public int project_getTotal(Criteria cri);

	public List<ProjectVO> getHomeOpenProject();

}
