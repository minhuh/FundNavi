package com.hm.project.domain;

import java.util.Date;

import lombok.Data;


 /**
  * @FileName	: NoticeVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お知らせ
  */
@Data
public class NoticeVO {
	private Long notice_num;
	private String title;
	private String userid;	
    private String content;
    private String attach;
	private Date reg_date;
		
}
