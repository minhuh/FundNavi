package com.hm.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.ProjectVO;
import com.hm.project.front.service.ProjectService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectServiceTests {

	@Autowired
	private ProjectService service;

//	@Test
//	public void testExist() {
//
//		log.info(service);
//		assertNotNull(service);
//	}

//	@Test
//	public void testRegister() {
//		
//		ProjectVO board = new ProjectVO();
//		
//		board.setUserid("test");
//		board.setCategory("새로 추가한 글");
//		board.setTitle_image("새로 추가한 글");
//		board.setSimple_content("컨텐츠  새로 추가한 글");
//		board.setPhone("010-1111-1111");
//		board.setProject_start(null);
//		board.setProject_end(null);
//		board.setCurrent_invest(100000);
//		board.setAchive_invest(1000000);
//		board.setAttach_1("setAttach_1");
//		board.setCompany("컴");
//		board.setContents_image1("setContents_image1");
//		board.setContents_image2("setContents_image2");
//		board.setAttach_2("setAttach_2");
//		board.setAttach_3("setAttach_3");
//		board.setDetail_content("setDetail_content  새로 추가한 글");
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호 : " + board.getProject_num());
//	}
	

//	@Test
//	public void testGet() {
//		log.info(service.get(11L));
//		}
	

//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//		}
	
//	@Test
//	public void testUpdate() {
//		
//		ProjectVO board = service.get(2L);
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setSimple_content("제목 수정합니다");
//		log.info("MODIFY RESULT: " + service.modify(board));
//		}
	

//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT: " + service.remove(5L));
//	}
	
	
	
	


}