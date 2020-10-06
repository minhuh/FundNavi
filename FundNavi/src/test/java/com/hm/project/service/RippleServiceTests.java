package com.hm.project.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.RippleVO;
import com.hm.project.front.service.RippleService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class RippleServiceTests {
	private RippleService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	댓글 등록
//	@Test
//	public void testRegister() {
//		RippleVO vo = new RippleVO();
//		vo.setProject_num(4L);
//		vo.setContent("댓글");
//		vo.setUserid("user1");
//		
//		service.register(vo);
//		
//		log.info("생성된 게시물의 번호: " + vo.getProject_num());
//	}
}
