package com.hm.project.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.InvestorVO;
import com.hm.project.front.mapper.InvestorMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InvestorMapperTests {


	@Autowired
	private InvestorMapper mapper;
	
	Date time = new Date();
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList(66L).forEach((investor) -> {
//			log.info("================");
//			log.info(investor);
//		});
//	}
	

	@Test
	public void testFunding() {
		
		InvestorVO funding = new InvestorVO();
		
		funding.setInvestor_num(6);
		funding.setProject_num(66);
		funding.setAmount(15000);
		funding.setScore(1);
		funding.setJob("CEO");
		funding.setUserid("user1");

		mapper.funding(funding);

		log.info(funding);
	}
	


//	@Test
//	public void testInvestor_read() {
//
//
//		InvestorVO in = mapper.investor_read(66L); //투자회원 번호로 바꿔야함
//
//		log.info("test222" + in);
//	}
	

//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete(3L));
//	}
	

//	@Test
//	public void testUpdate() {
//
//		ProjectVO board = new ProjectVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setProject_num(1L); //5번글
//		board.setCategory("테크/가전");
//		board.setTitle_image("fsdfsf");
//		board.setSimple_content("심플 컨텐츠 수정");
//		board.setDetail_content("setDetail_content 수정합니다.");
//		board.setPhone("010-1111-2222");
//		board.setAttach_1("setAttach_1");
//		board.setAttach_2("setAttach_2");
//		board.setAttach_3("setAttach_3");
//		board.setCompany("컴 수정");
//		board.setContents_image1("setContents_image1 수정이미지");
//		board.setContents_image2("setContents_image2 수정이미지");
//		
//		int count = mapper.update(board); //int형 숫자 리턴됨 그래서 update를 int형으로 선언했었음
//		log.info("UPDATE COUNT: " + count);
//
//	}
	

//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10개씩 1페이지 
//	    cri.setPageNum(1);
//	    cri.setAmount(10);
//
//
//		List<ProjectVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(board -> log.info(board));
//
//	}
//	



}

