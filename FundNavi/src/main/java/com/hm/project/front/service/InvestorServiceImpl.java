package com.hm.project.front.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InvestorVO;
import com.hm.project.front.mapper.InvestorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: InvestorServiceImpl.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : 投資家会員のservice implements
  */
@Log4j
@Service
public class InvestorServiceImpl implements InvestorService{

	@Autowired 
	private InvestorMapper mapper;
	
	
	@Override
	public List<InvestorVO> getList(Long pno) {
			
		log.info("getList.....");
			
		return mapper.getList(pno);	
	}


	@Override
	public InvestorVO get(Long pno) {
		log.info("investor_read....." + pno);
		return mapper.investor_read(pno);
	}



	@Override
	public void funding(InvestorVO investor) {
		log.info("funding....." + investor);
		
		mapper.funding(investor);
		
	}


	@Override
	public void update_current(InvestorVO investor) {
		log.info("update_current_project_num....." + investor.getProject_num());
		
		mapper.update_current(investor);
		
	}

	@Override
	public List<InvestorVO> myPageProject(String userid) {
		// TODO Auto-generated method stub
		log.info("myPageProject_read....." + userid);
		
		return mapper.myPageProject(userid);
	}
}
