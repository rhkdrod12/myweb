package com.naman.freeboard.mapper;

import java.util.List;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.common.util.Criteria;

public interface FreeBoardMapper {
	
	public List<FreeBoardVO> getList(Criteria cri);
	public List<FreeBoardVO> getChoList(Criteria cri);
	
	public List<FreeBoardVO> getPageList(PageVO page);
	public List<FreeBoardVO> getSearchList(PageVO page);
	
	public int getTotal(PageVO page);
	public int getTotal(Criteria cri);
	
	public FreeBoardVO getContent(int index);
	public int regist(FreeBoardVO vo);
	public boolean modify(FreeBoardVO vo);
	public boolean delete(int index);
	
}
