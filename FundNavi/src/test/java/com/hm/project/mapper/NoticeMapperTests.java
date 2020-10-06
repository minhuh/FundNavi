package com.hm.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;
import com.hm.project.front.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {

	@Autowired
	private NoticeMapper mapper;

	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach((board) ->  {
//			log.info("-----------");
//			log.info(board); 
//		});
//	}

//	@Test
//	public void testInsert() {
//
//		NoticeVO board = new NoticeVO();
//		board.setTitle("공지사항 제목1");
//		board.setContent("공지사항 내용1");
//		board.setUserid("test");
//		board.setAttach("첨부파일1.jpg");
//
//		mapper.insert(board);
//
//		log.info(board);
//	}

//	@Test
//	public void testInsertSelectKey() {
//
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setWriter("newbie");
//
//		mapper.insertSelectKey(board);
//
//		log.info(board);
//	}

//	@Test
//	public void testRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		NoticeVO board = mapper.read(12L);
//
//		log.info(board);
//
//	}

//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT: " + mapper.delete(1L));
//	}

//	@Test
//	public void testUpdate() {
//
//		NoticeVO board = new NoticeVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setNotice_num(12L);
//		board.setTitle("수정된 공지사항 제목1");
//		board.setContent("수정된 공지사항 내용1");
//		board.setUserid("test");
//		
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//
//	}

	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10개씩 3페이지 
	    cri.setPageNum(3);
	    cri.setAmount(10);


		List<NoticeVO> list = mapper.getListWithPaging(cri);

		list.forEach(board -> log.info(board));

	}
	
//	  @Test
//	  public void testSearch() {
//
//	    Criteria cri = new Criteria();
//	    cri.setKeyword("키워드");
//	    cri.setType("TCW");
//
//	    List<BoardVO> list = mapper.getListWithPaging(cri);
//
//	    list.forEach(board -> log.info(board));
//	  }
//
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		//10개씩 3페이지
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testSearch() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("새로");
//		cri.setType("TW");
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testTotal() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("새로");
//		cri.setType("TW");
//		
//		int total 
//	}
	
}
