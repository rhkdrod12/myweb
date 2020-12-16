package com.naman.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.freeboard.mapper.FreeBoardMapper;


@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	FreeBoardMapper fm;
	
	@Override
	public List<FreeBoardVO> getList() {
		// TODO Auto-generated method stub
		return fm.getList();
	}
	
	//필요없을 것으로 보임
	public List<FreeBoardVO> getPageList(PageVO page){
				
		//페이지 연산부분
		int totalBno = fm.getTotal(page);
		page.setTotalBno(totalBno);
		page.pageCalc();
		
		return fm.getPageList(page);
	}
	
	public List<FreeBoardVO> getSearchList(PageVO page){
		
		//페이지 연산부분
		int totalBno = fm.getTotal(page);
		page.setTotalBno(totalBno);
		page.pageCalc();
		
		System.out.println("연산완료: " + page.toString());
		
		return fm.getSearchList(page);
	}
	
	@Override
	public FreeBoardVO getContent(int index) {
		// TODO Auto-generated method stub
		return fm.getContent(index);
	}

	@Override
	public int regist(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		return fm.regist(vo);
	}

	@Override
	public boolean modify(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		return fm.modify(vo);
	}

	@Override
	public boolean delete(int index) {
		// TODO Auto-generated method stub
		return fm.delete(index);
	}

}
