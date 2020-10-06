package com.hm.project.admin.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;

 /**
  * @FileName	: AdminInquryService.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お問い合わせのservice
  */
public interface AdminInquryService {

	public void register(InquryVO inqury);

	public boolean update(InquryVO inqury);

	public void InquryDeleting(long inqury_num);

	public InquryVO get(Long ino);

	public List<InquryVO> getList();

	public List<InquryVO> getListWithPaging(Criteria cri);

	public int getTotal(Criteria cri);

}
