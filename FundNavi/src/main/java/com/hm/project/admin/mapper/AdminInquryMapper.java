package com.hm.project.admin.mapper;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;


 /**
  * @FileName	: AdminInquryMapper.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お問い合わせのmapper
  */
public interface AdminInquryMapper {
	
	public List<InquryVO> getList();
	
	public List<InquryVO> getListWithPaging(Criteria cri);
	
	public InquryVO read(Long ino);
	
	public void insert(InquryVO inqury);
	
	public int update(InquryVO inqury);
	
	public Integer insertSelectKey(InquryVO inqury);
	
	public int delete(Long ino);

	public int getTotalCount(Criteria cri);

	public void InquryDeleting(long inqury_num);
	
}
