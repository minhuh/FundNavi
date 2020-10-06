package com.hm.project.front.mapper;

import java.util.List;

import com.hm.project.domain.RippleRippleVO;

 /**
  * @FileName	: RippleRippleMapper.java
  * @Date		: 2020. 2. 27. 
  * @Author		: ホミン
  * @ProgramExplanation : コメント返しの Mapper interface
  */
public interface RippleRippleMapper {
	
	public int insert(RippleRippleVO vo);

	public RippleRippleVO read(Long ripple_ripple_num);

	public int delete(Long ripple_ripple_num);

	public int update(RippleRippleVO vo);

	public List<RippleRippleVO> getList();
}
