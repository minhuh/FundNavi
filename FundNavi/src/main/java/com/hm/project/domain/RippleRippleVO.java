package com.hm.project.domain;

import java.util.Date;

import lombok.Data;

 /**
  * @FileName	: RippleRippleVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : コメント返し
  */
@Data
public class RippleRippleVO {
	private long ripple_num;
	private long project_num;
	private long ripple_ripple_num;
	
	private String userid;
	private String content;
	
	private Date reg_date;
}
