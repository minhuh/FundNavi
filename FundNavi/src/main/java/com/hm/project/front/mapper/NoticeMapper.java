package com.hm.project.front.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;

 /**
  * @FileName	: NoticeMapper.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : お知らせの Mapper interface
  */
public interface NoticeMapper {
	
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);

	public void insert(NoticeVO board);

	public void insertSelectKey(NoticeVO board);
	
	public NoticeVO read(Long notice_num);
	
	public int delete(Long notice_num);
	
	public int update(NoticeVO board);

	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("notice_num") Long notice_num, 
			                   @Param("amount") int amount);
}
