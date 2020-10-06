package com.hm.project.front.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;


 /**
  * @FileName	: InquryService.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : お問い合わせのservice
  */
public interface InquryService {

	// 글 등록
	public void register(InquryVO inqury);

	// 문의답변
	public boolean update(InquryVO inqury);

	// 문의삭제
	public void InquryDeleting(long inqury_num);

	// 글 상세보기
	public InquryVO get(Long ino);

	// 전체 글 목록
	public List<InquryVO> getList();

	public List<InquryVO> getListWithPaging(Criteria cri);

	public int getTotal(Criteria cri);

}
