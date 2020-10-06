package com.hm.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.front.service.InvestorService;

import lombok.extern.log4j.Log4j;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InvestorServiceTests {

	@Autowired
	private InvestorService service;

//	@Test
//	public void testGet() {
//		log.info(service.get(11L));
//		}
	
	@Test
	public void testGetList() {
		service.getList(66L).forEach(board -> log.info(board));
		}
	

	
	
	
	


}