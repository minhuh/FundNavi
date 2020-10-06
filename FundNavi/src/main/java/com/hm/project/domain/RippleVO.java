package com.hm.project.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


 /**
  * @FileName	: RippleVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : コメント
  */
@Data
public class RippleVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;		
	private String content;		
	private String userid;		
	
	private long ripple_num;
	private long project_num;
	
	// 어드민 전용 추가
	private String TITLE;
	private String r_content;
	private Date r_reg_date;
	private String r_userid;
	private String simple_content;
}
