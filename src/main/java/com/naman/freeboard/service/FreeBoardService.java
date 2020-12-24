package com.naman.freeboard.service;

import java.util.List;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.common.util.Criteria;

public interface FreeBoardService {
	
//	public List<FreeBoardVO> getList();
//	public List<FreeBoardVO> getList(PageVO page);
	
	public List<FreeBoardVO> getList(Criteria cri);
	
	
	public int getTotal(Criteria cri);
	public PageVO getPage(Criteria cri, int pageAmount);
	
	public List<FreeBoardVO> getPageList(PageVO page);
	public List<FreeBoardVO> getSearchList(PageVO page);
	
	
	public FreeBoardVO getContent(int index);
	public int regist(FreeBoardVO vo);
	public boolean modify(FreeBoardVO vo);
	public boolean delete(int index);
	
}
