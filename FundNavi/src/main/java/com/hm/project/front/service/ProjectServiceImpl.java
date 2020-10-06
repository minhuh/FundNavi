package com.hm.project.front.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.ProjectVO;
import com.hm.project.front.mapper.ProjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @FileName : ProjectServiceImpl.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : プロジェクトのservice implements
 */
@Log4j
@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectMapper mapper;

	@Override
	public void register(ProjectVO project) {

		log.info("register....." + project);

		mapper.insertSelectKey(project);
	}

	@Override
	public ProjectVO get(Long pno) {

		log.info("get....." + pno);

		return mapper.read(pno);
	}

	@Override
	public List<ProjectVO> getList(Criteria cri) {

		log.info("getList.....");

		return mapper.getList(cri);
	}

	@Override
	public List<ProjectVO> homeGetList() {

		log.info("homeGetList.....");

		return mapper.home_slide();
	}

	@Override
	public boolean modify(ProjectVO project) {
		log.info("modify......." + project);
		return mapper.update(project) == 1;
	}

	@Override
	public boolean remove(Long pno) {
		log.info("remove......." + pno);
		return mapper.delete(pno) == 1;
	}

	@Override
	public boolean remove_standBy(Long pno) {
		log.info("state_change......." + pno);
		return mapper.state_change(pno) == 1;
	}

	@Override
	public List<ProjectVO> getListWithPaging(Criteria cri) {
		log.info("get List with criteria: " + cri + "test" + cri.getP_type());
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ProjectVO> getListWithPagingCategory(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPagingCategory(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int project_getTotal(Criteria cri) {
		log.info("project get total count");
		return mapper.project_getTotalCount(cri);
	}

	@Override
	public List<ProjectVO> getHomeOpenProject() {
		log.info("Home page open project list of year......");

		return mapper.getHomeOpenProject();
	}

}
