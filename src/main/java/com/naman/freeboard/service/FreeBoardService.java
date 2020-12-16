package com.naman.freeboard.service;

import java.util.List;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;

public interface FreeBoardService {
	
	public List<FreeBoardVO> getList();
	public List<FreeBoardVO> getPageList(PageVO page);
	public List<FreeBoardVO> getSearchList(PageVO page);
	
	public FreeBoardVO getContent(int index);
	public int regist(FreeBoardVO vo);
	public boolean modify(FreeBoardVO vo);
	public boolean delete(int index);
	
}
