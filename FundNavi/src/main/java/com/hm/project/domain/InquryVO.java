package com.hm.project.domain;

import java.util.Date;

import lombok.Data;


 /**
  * @FileName	: InquryVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お問い合わせ
  */
@Data
public class InquryVO {
	
	private Long inqury_num;
	
	private String userid;
	private String title;
	private Date reg_date;
	private String attach;
	private Date ripple_date;
	private String content;
	private String ripple_content;
    private String ripple_check;
    
	}

