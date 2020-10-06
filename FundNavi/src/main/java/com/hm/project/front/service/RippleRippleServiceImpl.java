package com.hm.project.front.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.ProjectVO;
import com.hm.project.domain.RippleRippleVO;
import com.hm.project.domain.RippleVO;
import com.hm.project.front.mapper.RippleMapper;
import com.hm.project.front.mapper.RippleRippleMapper;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : RippleRippleServiceImpl.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : コメント返しのservice implements
 */
@Log4j
@Service
public class RippleRippleServiceImpl implements RippleRippleService {

	@Autowired
	private RippleRippleMapper mapper;

	@Override
	public int register(RippleRippleVO ripple) {

		log.info("register......." + ripple);

		return mapper.insert(ripple);
	}

	@Override
	public RippleRippleVO get(Long ripple_num) {

		log.info("get......." + ripple_num);

		return mapper.read(ripple_num);
	}

	@Override
	public List<RippleRippleVO> getList() {

		log.info("getList.......");

		return mapper.getList();
	}

	@Override
	public int modify(RippleRippleVO content) {
		log.info("modify......." + content);
		return mapper.update(content);
	}

	@Override
	public int remove(Long ripple_num) {
		log.info("remove......." + ripple_num);
		return mapper.delete(ripple_num);
	}

}
