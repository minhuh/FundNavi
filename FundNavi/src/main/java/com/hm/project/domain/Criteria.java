package com.hm.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



 /**
  * @FileName	: Criteria.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : ページング
  */
@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String keyword;
	private String type;
	
	private String p_distinct;
	private String p_type;
	private String p_category;
	
	public Criteria() {
		this(1,9);
	}
	
	public Criteria(int pageNum, int amount ) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	public String getListLink() { 
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword())
				.queryParam("p_distinct", this.getP_distinct());
		
		return builder.toUriString();
	}
}
