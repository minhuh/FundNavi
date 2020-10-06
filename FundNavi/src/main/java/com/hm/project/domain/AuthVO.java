package com.hm.project.domain;


import lombok.Data;

 /**
  * @FileName	: AuthVO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : 会員のIDと権限
  */
@Data
public class AuthVO {

  private String userid;
  private String auth;
  
}
