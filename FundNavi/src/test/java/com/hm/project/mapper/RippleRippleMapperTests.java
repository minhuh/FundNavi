package com.hm.project.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.RippleVO;
import com.hm.project.front.mapper.RippleMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class RippleRippleMapperTests {
//	@Setter(onMethod_ = @Autowired)
	@Autowired //이렇게 명시적으로 하는 경우가 많음. 자바표준 어노테이션은 @Inject
	private RippleMapper mapper;
	
	private Long[] ProjectNumArr = {1L, 2L, 3L, 4L};
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
//	//댓글작성
//	@Test
//	public void testCreate() {
//		
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			
//			RippleVO vo = new RippleVO();
//			
//			//게시물의 번호
//			vo.setProject_num(ProjectNumArr[i % 4]);
//			vo.setContent("댓글 테스트 " + i);
//			vo.setUserid("test");
//			
//			mapper.insert(vo);
//		});
//	}
//	
//	//조회(read)
//	@Test
//	public void testRead() {
//		
//		long targetRno = 5L;
//		
//		RippleVO vo = mapper.read(targetRno);
//		
//		log.info(vo);
//	}
	
//	//delet 삭제
//	@Test
//	public void testDelete() {
//		Long targetRno = 4L;
//		
//		mapper.delete(targetRno);
//	}
	
	//수정 update
//	@Test
//	public void testUpdate() {
//		
//		Long targetRno = 5L;
//		
//		RippleVO vo = mapper.read(targetRno);
//		
//		vo.setContent("Update ripple");
//		
//		int count = mapper.update(vo);
//		
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testList() {
//		
//		Criteria cri = new Criteria();
//		List<RippleVO> replies = mapper.getListWithPaging(cri, ProjectNumArr[0]);
//		
//		replies.forEach(ripple -> log.info(ripple));
//	}

//	//Controler 처리 댓글작성
//	@Test
//	public void testripple() {
//
//		private rippleService service;
//			rippleVO vo = new rippleVO();
//			//{"bno":1032237,"ripple":"Hello ripple","rippleer":"user00"}
//
//			//게시물의 번호
//			vo.setBno(1032238);
//			vo.setripple("댓글 테스트123123 ");
//			vo.setrippleer("rippleer123");
//			
//			mapper.insert(vo);
//			
//			 int insertCount = service.register(vo);
//			insertCount == 1
//					   ? new ResponseEntity<>("success", HttpStatus.OK)
//					   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	
	
}
