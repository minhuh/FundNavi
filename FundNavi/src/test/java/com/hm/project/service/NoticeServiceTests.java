package com.hm.project.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.NoticeVO;
import com.hm.project.front.service.NoticeService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {

	@Autowired
	private NoticeService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test //게시글 추가 등록
//	public void testRegister() {
//		NoticeVO board = new NoticeVO();
//		board.setTitle("new");
//		board.setContent("new");
//		board.setAttach("attach");
//		board.setUserid("test");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getNotice_num());
//	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(67L));
//	}
	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호의 존재 여부를 확인하고 테스트 할 것
//		log.info("REMOVE RESULT: " + service.remove(67L));
//		
//	}
}
