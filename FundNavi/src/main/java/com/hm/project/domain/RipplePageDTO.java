package com.hm.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

 /**
  * @FileName	: RipplePageDTO.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : コメントページング
  */
@Data
@AllArgsConstructor
@Getter
public class RipplePageDTO {
	
	private int replyCnt;
	private List<RippleVO> list;
}
