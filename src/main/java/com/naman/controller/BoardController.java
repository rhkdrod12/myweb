package com.naman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.service.FreeBoardService;

@Controller
@RequestMapping("freeBoard")
public class BoardController {
	
	@Autowired
	FreeBoardService fs;
	
	// 글 목록 화면
	@RequestMapping("freeList")
	public String boardListWin(@ModelAttribute("pageVO") PageVO pageVO, Model model) {				
		
		List<FreeBoardVO> list;
		System.out.println("글 목록 화면 요청");
		System.out.println("연산전: " + pageVO);
		
		list = fs.getSearchList(pageVO);
		model.addAttribute("list", list);
		System.out.println(list);
		return "freeBoard/freeList";
	}
	// 글 등록 화면
	@RequestMapping("freeRegist")
	public String boardRegistWin() {
		return "freeBoard/freeRegist";
	}
	
	// 글 등록 요청
	@RequestMapping(value = "freeRegistReq", method = RequestMethod.POST)
	public String boardRegistReq(FreeBoardVO vo, RedirectAttributes ra) {
		
		fs.regist(vo);
		System.out.println(vo.toString());
		
		if(vo.getNum() > 0) {
			ra.addFlashAttribute("boardVO", vo);
			return "redirect:freeDetail?page="+vo.getNum();
		}else {
			return "redirect:freeRegist";
		}
	}
	
	// 글 상세정보 화면
	@RequestMapping("freeDetail")
	public String boardDetailWin(@RequestParam("page") int page, Model model) {
		System.out.println("글 상세정보 화면 요청");
		FreeBoardVO vo = fs.getData(page);
		model.addAttribute("boardVO", vo);
		return "freeBoard/freeDetail";
	}
	
	// 글 수정 화면
	@RequestMapping("freeModify")
	public String boardModifyWin(@ModelAttribute("boardVO") FreeBoardVO vo) {
		System.out.println("수정화면 요청");
		return "freeBoard/freeModify";
	}
	
	// 글 수정 요청
	@RequestMapping(value = "freeModifyReq", method = RequestMethod.POST)
	public String boardModifyReq(@ModelAttribute("boardVO") FreeBoardVO vo) {
		if(fs.modify(vo)) {
			System.out.println("변경 성공");
			return "redirect:freeDetail?page="+vo.getNum();
		}else {
			return "redirect:freeModify";
		}
	}
	
	// 글 삭제 요청
	@RequestMapping(value="freeDeleteReq", method = RequestMethod.POST)
	public String boardDeleteReq(@RequestParam("num") int num) {
		System.out.println("test");
		if(fs.delete(num)) {
			System.out.println("삭제 성공");
			return "redirect:freeList";
		}else {
			return "freeBoard/freeModify?page="+num;
		}
	}
	
}
