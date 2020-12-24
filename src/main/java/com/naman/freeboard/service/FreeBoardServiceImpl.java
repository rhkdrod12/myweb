package com.naman.freeboard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.common.util.Criteria;
import com.naman.common.util.HangleCho;
import com.naman.freeboard.mapper.FreeBoardMapper;


@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	FreeBoardMapper fm;
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardServiceImpl.class);
	
//	@Override
//	public List<FreeBoardVO> getList() {
//		return fm.getList();
//	}
	
//	@Override
//	public List<FreeBoardVO> getList(PageVO page) {
//		return null;
//	}

	//페이지 연산 
	@Override
	public PageVO getPage(Criteria cri, int pageAmount) {	
		int total =  fm.getTotal(cri);
		PageVO page = new PageVO(cri, total, pageAmount);
		return page;
	}
	
	//데이터 리스트 얻기
	@Override
	public List<FreeBoardVO> getList(Criteria cri) {
//		System.out.println(cri);
		logger.info("페이지 정보: " + cri.toString());
		List<FreeBoardVO> list;
		
		if(HangleCho.checkCho(cri.getSearch())) {
			logger.info("초성검색");
//			System.out.println("초성검색");			
			cri.setSearch(HangleCho.getStr(cri.getSearch()));
			list = fm.getChoList(cri);
		
		}else {
			logger.info("일치검색");
//			System.out.println("일치검색");
			list = fm.getList(cri);
		}
		
//		System.out.println(list);
		logger.info(!list.isEmpty()?"게시글 정보: "+list.get(0).toString():"[]");
		return list;
	}
	
	//조건에 해당되는 총 데이터 얻기
	@Override
	public int getTotal(Criteria cri) {
		return fm.getTotal(cri);
	}
	
	//필요없을 것으로 보임
	public List<FreeBoardVO> getPageList(PageVO page){
				
		//페이지 연산부분
		int totalBno = fm.getTotal(page);
		page.setTotalBno(totalBno);
		page.pageCalc();
		
		return fm.getPageList(page);
	}
	
	//미사용
	public List<FreeBoardVO> getSearchList(PageVO page){
		
		//페이지 연산부분
		int totalBno = fm.getTotal(page);
		page.setTotalBno(totalBno);
		page.pageCalc();
		
		System.out.println("연산완료: " + page.toString());
		List<FreeBoardVO> list = fm.getSearchList(page);
		
		return list;
	}
	
	//인덱스 번호에 해당되는 정보 얻기
	@Override
	public FreeBoardVO getContent(int index) {
		// TODO Auto-generated method stub
		FreeBoardVO vo = fm.getContent(index);
		logger.info(vo.toString());
		return vo;
	}

	//게시글 등록
	@Override
	public int regist(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		return fm.regist(vo);
	}

	//게시글 수정
	@Override
	public boolean modify(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		return fm.modify(vo);
	}

	//게시글 삭제
	@Override
	public boolean delete(int index) {
		// TODO Auto-generated method stub
		return fm.delete(index);
	}

}
