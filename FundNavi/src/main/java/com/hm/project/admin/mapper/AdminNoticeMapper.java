package com.hm.project.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;


 /**
  * @FileName	: AdminNoticeMapper.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お知らせのmapper
  */
public interface AdminNoticeMapper {
	
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);

	public void insert(NoticeVO board);

	public void insertSelectKey(NoticeVO board);
	
	public NoticeVO read(Long notice_num);
	
	public int delete(Long notice_num);
	
	public int update(NoticeVO board);

	public int getTotalCount(Criteria cri);
	
}
