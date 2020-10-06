package com.hm.project.admin.service;

import java.util.List;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;


 /**
  * @FileName	: AdminNoticeService.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お知らせのservice
  */
public interface AdminNoticeService {

		public void register(NoticeVO board);
		
		public NoticeVO get(Long notice_num);

		public boolean modify(NoticeVO board);
		
		public boolean remove(Long notice_num);

		public List<NoticeVO> getList();
		
		public List<NoticeVO> getListWithPaging(Criteria cri);

		public int getTotalCount(Criteria cri);
}
