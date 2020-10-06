package com.hm.project.front.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InvestorVO;
import com.hm.project.domain.ProjectVO;

/**
 * @FileName : InvestorService.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : 投資家会員のservice
 */
public interface InvestorService {
	// 투자자 상세보기
	public InvestorVO get(Long pno);

	// 투자자 목록
	public List<InvestorVO> getList(Long pno);

	// 마이페이지 프로젝트
	public List<InvestorVO> myPageProject(String userid);

	// 투자하기
	public void funding(InvestorVO investor);

	public void update_current(InvestorVO investor);

}
