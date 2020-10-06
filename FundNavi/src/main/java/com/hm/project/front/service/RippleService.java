package com.hm.project.front.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.RipplePageDTO;
import com.hm.project.domain.RippleVO;

/**
 * @FileName : RippleService.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : コメントのservice
 */
public interface RippleService {

	// 댓글 등록
	public void register(RippleVO vo);

	// 댓글 상세보기
	public RippleVO get(String userid);

	// 글 수정
	public int modify(RippleVO vo);

	// 댓글 삭제
	public int remove(Long ripple_num);

	// 댓글 목록
	public List<RippleVO> getList(Long project_num);

	public RipplePageDTO getListPage(Criteria cri, Long project_num);

}
