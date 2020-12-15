package com.naman.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;

public interface FreeBoardMapper {
	public List<FreeBoardVO> getList();
	public List<FreeBoardVO> getPageList(PageVO page );
	public List<FreeBoardVO> getSearchList(PageVO page);
	
	public int getTotal(PageVO page);
	public FreeBoardVO getData(int index);
	public int regist(FreeBoardVO vo);
	public boolean modify(FreeBoardVO vo);
	public boolean delete(int index);
	
}
