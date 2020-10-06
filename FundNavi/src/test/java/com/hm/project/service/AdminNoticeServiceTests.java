package com.hm.project.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.admin.service.AdminNoticeService;
import com.hm.project.domain.NoticeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class AdminNoticeServiceTests {

	@Autowired
	private AdminNoticeService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test //게시글 추가 등록
//	public void testRegister() {
//		NoticeVO board = new NoticeVO();
//		board.setTitle("adminnew");
//		board.setContent("adminnew");
//		board.setAttach("adminattach");
//		board.setUserid("testest");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getNotice_num());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(10L));
//	}
	
	@Test
	public void testDelete() {
		
		//게시물 번호의 존재 여부를 확인하고 테스트 할 것
		log.info("REMOVE RESULT: " + service.remove(10L));
		
	}
	
	@Test
	public void testUpdate() {
		
		NoticeVO board = service.get(1L);
		if(board == null) {
			return;
		}
		
		board.setTitle("제목 수정함");
		log.info("MODIFY RESULT: "+ service.modify(board));
	}
}
