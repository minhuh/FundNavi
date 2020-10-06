package com.hm.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.MemberVO;
import com.hm.project.front.service.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Autowired
	private MemberService service;

	@Test
	public void testGet() {
		
		log.info(service.get("abc18"));
		
	}

	
	@Test
	public void testRegistInvestor() {
		MemberVO member = service.get("abc18");
		if (member == null) {
			return;
		} 
		
		member.setBank("bank");
		member.setAccount("111");
		
	}


}
