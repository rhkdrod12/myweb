package com.naman.command;

import com.naman.common.util.Criteria;

import lombok.Data;

@Data
public class PageVO {
	
	/*****************************
	 *	 페이지 연산시 필요사항
	 * 
	 * 	page	     : 현재 페이지
	 * 	totalBno  	 : 총 데이터 량
	 * 	bnoAmount 	 : 한번에 표기할 데이터 량
	 * 	pageAmount	 : 페이지 최대 표기 수
	 * 
	 ******************************/
	
	private int page = 1;			//현재 페이지		
	private int totalBno;			//총 데이터
	private int bnoAmount = 10;		//표기할 데이터량
	private int pageAmount = 5;		//표기할 데이터량
	
	private int startPage;			//보여줄 시작 페이지		연산
	private int endPage;			//보여줄 끝 페이지		연산
	private int totalPage;			//총 페이지				연산
	 
	private boolean prevPage;		//다음으로 이동 표기 여부	연산
	private boolean nextPage;		//이전으로 이동 표기 여부	연산
		 
	private Criteria cri;			//페이징 기준
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
 
	public PageVO(Criteria cri, int totalBno, int pageAmount) {
		
		this.cri = cri;
		this.page = cri.getPage();
		this.bnoAmount = cri.getBnoAmount();
		
		this.totalBno = totalBno;
		this.pageAmount = pageAmount;
			
		pageCalc();
	}	
	
	public void pageCalc() {
		
		totalPage = (int) Math.ceil(totalBno/(double)bnoAmount);
		endPage = ((int) Math.ceil(page/(double)pageAmount))*pageAmount;
		startPage = endPage - pageAmount + 1;
		
		endPage = endPage > totalPage ? totalPage: endPage;
		
		prevPage = startPage > 1;
		nextPage = endPage < totalPage;	
	
	}

	
	

	
}
