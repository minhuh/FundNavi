package com.hm.project.front.mapper;

import java.util.List;

import com.hm.project.domain.InvestorVO;


 /**
  * @FileName	: InvestorMapper.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 投資家会員の Mapper interface
  */
public interface InvestorMapper {
	public List<InvestorVO> getList(Long pno);
	
	public InvestorVO investor_read(Long pno);
	
	public void insert(InvestorVO investor);
	
	public void funding(InvestorVO investor);
	
	public void update_current(InvestorVO investor);
	
	public List<InvestorVO> myPageProject(String userid);
}
