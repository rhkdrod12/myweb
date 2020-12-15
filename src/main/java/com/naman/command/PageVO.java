package com.naman.command;

public class PageVO {

	private int page = 1;			//현재 페이지			연산
	private int startPage;			//보여줄 시작 페이지		연산
	private int endPage;			//보여줄 끝 페이지		연산
	private int totalPage;			//총 페이지				연산
	
	private int totalBno;			//총 데이터
	 
	private int bnoAmount = 10;		//표기할 데이터량
	private int pageAmount = 5;		//표기할 데이터량
	 
	private boolean prevPage;		//다음으로 이동 표기 여부	연산
	private boolean nextPage;		//이전으로 이동 표기 여부	연산
	
	private int startBno;			//데이터 시작번호
	private int endBno;				//데이터 끝번호
	
	private String search;			//검색 데이터
	private String searchOption;	//검색 옵션
	 
	
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int page, int totalBno, int bnoAmount, int pageAmount, String search, String searchOption) {
		
		this.page = page;
		this.totalBno = totalBno;
		this.bnoAmount = bnoAmount;
		this.pageAmount = pageAmount;
		this.search = search;
		this.searchOption = searchOption;
		
		pageCalc();
	}

	public void setCalc(int page, int totalBno, int bnoAmount, int pageAmount) {
		pageCalc();
	}
	
	public void pageCalc() {
		
		totalPage = (int) Math.ceil(totalBno/(double)bnoAmount);
		endPage = ((int) Math.ceil(page/(double)pageAmount))*pageAmount;
		startPage = endPage - pageAmount + 1;
		
		endPage = endPage > totalPage ? totalPage: endPage;
		
		prevPage = startPage > 1;
		nextPage = endPage < totalPage;
		
		startBno = (page-1)*bnoAmount;
		endBno = page*bnoAmount;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getTotalBno() {
		return totalBno;
	}


	public void setTotalBno(int totalBno) {
		this.totalBno = totalBno;
	}


	public int getBnoAmount() {
		return bnoAmount;
	}


	public void setBnoAmount(int bnoAmount) {
		this.bnoAmount = bnoAmount;
	}


	public int getPageAmount() {
		return pageAmount;
	}


	public void setPageAmount(int pageAmount) {
		this.pageAmount = pageAmount;
	}


	public boolean isPrevPage() {
		return prevPage;
	}


	public void setPrevPage(boolean prevPage) {
		this.prevPage = prevPage;
	}


	public boolean isNextPage() {
		return nextPage;
	}


	public void setNextPage(boolean nextPage) {
		this.nextPage = nextPage;
	}
	
	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getSearchOption() {
		return searchOption;
	}


	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}


	public int getStartBno() {
		return startBno;
	}


	public void setStartBno(int startBno) {
		this.startBno = startBno;
	}


	public int getEndBno() {
		return endBno;
	}


	public void setEndBno(int endBno) {
		this.endBno = endBno;
	}


	@Override
	public String toString() {
		return "PageVO [page=" + page + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage
				+ ", totalBno=" + totalBno + ", bnoAmount=" + bnoAmount + ", pageAmount=" + pageAmount + ", prevPage="
				+ prevPage + ", nextPage=" + nextPage + ", startBno=" + startBno + ", endBno=" + endBno + ", search="
				+ search + ", searchOption=" + searchOption + "]";
	}
	
	
}
