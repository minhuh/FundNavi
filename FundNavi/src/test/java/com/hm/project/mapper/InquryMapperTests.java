package com.hm.project.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;
import com.hm.project.front.mapper.InquryMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquryMapperTests {

	@Autowired
	private InquryMapper mapper;

	Date time = new Date();

//	@Test
//	public void testGetList() {
//
//		mapper.getList().forEach((inqury) -> {
//			log.info("================");
//			log.info(inqury);
//		});
//	}

//	@Test
//	public void testInsert() {
//		
//		InquryVO inqury = new InquryVO();
//		inqury.setTitle("문의제목");
//		inqury.setReg_date(time);
//		inqury.setAttach("문의첨부파일");
//		inqury.setUserid("user");
//		inqury.setContent("문의내용");
//		
//		mapper.insert(inqury);
//
//		log.info(inqury);
//	}

//	@Test
//	public void testRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		InquryVO inqury = mapper.read(1L); 
//
//		log.info(inqury);
//	}
	
//	@Test
//	public void testUpdate() {
//
//		InquryVO inqury = new InquryVO();
//		inqury.setInqury_num(1L);
//		inqury.setRipple_content("문의답변");
//		inqury.setRipple_check("답변유무");
//		inqury.setRipple_date(time);
//		
//		int count = mapper.update(inqury); 
//		log.info("UPDATE COUNT: " + count);
//
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<InquryVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(inqury -> log.info(inqury.getInqury_num()));
//	}

}
