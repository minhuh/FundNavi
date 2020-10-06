package com.hm.project.front.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;
import com.hm.project.front.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

 /**
  * @FileName	: NoticeServiceImpl.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : お知らせのservice implements
  */
@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired //Inject
	private NoticeMapper mapper;

	@Override
	public void register(NoticeVO board) {
		
		log.info("register......." + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public List<NoticeVO> getList() {
		
		log.info("getList.......");
		
		return mapper.getList();
	}

	@Override
	public NoticeVO get(Long notice_num) {
		
		log.info("get......." + notice_num);
		
		return mapper.read(notice_num);
	}

	@Override
	public boolean modify(NoticeVO board) {

		log.info("modify......." + board);
		
		//SQL 성공시 <update tag에서 update 된 객수를 리턴,
		// 따라서 mapper.update(board)
		//return true 가 됨.
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long notice_num) {

		log.info("remove......." + notice_num);
		
		return mapper.delete(notice_num) == 1;
	}

	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) {
        log.info("get List With Criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
