package com.naman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naman.command.FreeBoardVO;
import com.naman.command.PageVO;
import com.naman.freeboard.service.FreeBoardService;

@Controller
@RequestMapping("freeBoard")
public class BoardController {
	
	@Autowired
	@Qualifier("freeBoardService")
	FreeBoardService fs;
	
	// 글 목록 화면
	@RequestMapping(value =  {"freeList","/",""})
	public String boardListWin(@ModelAttribute("pageVO") PageVO pageVO, Model model) {				
		
		List<FreeBoardVO> list;
		System.out.println("글 목록 화면 요청");
		System.out.println("연산전: " + pageVO);
		
		list = fs.getSearchList(pageVO);
		model.addAttribute("list", list);
		
		return "freeBoard/freeList";
	}
	// 글 등록 화면
	@RequestMapping("freeRegist")
	public String boardRegistWin() {
		System.out.println("글 등록 화면 요청");
		return "freeBoard/freeRegist";
	}
	
	// 글 등록 요청
	@RequestMapping(value = "freeRegistReq", method = RequestMethod.POST)
	public String boardRegistReq(FreeBoardVO vo, RedirectAttributes ra) {
		System.out.println("글 등록 요청");
		fs.regist(vo);
		System.out.println(vo.toString());
		
		if(vo.getNum() > 0) {
			ra.addFlashAttribute("msg", "성공적으로 등록했습니다.");
			ra.addFlashAttribute("boardVO", vo);
			return "redirect:freeDetail?page="+vo.getNum();
		}else {
			ra.addFlashAttribute("msg", "등록에 실패했습니다.");
			return "redirect:freeList";
		}
	}
	
	// 글 상세정보 화면
	@RequestMapping("freeDetail")
	public String boardDetailWin(@RequestParam(name = "page", required = false, defaultValue = "-1") int page
								, Model model, RedirectAttributes ra) {
		System.out.println("글 상세정보 화면 요청");
		if(page == -1) {
			ra.addFlashAttribute("msg", "잘못된 접근입니다.");
			return "redirect:freeList";
		}
		FreeBoardVO vo = fs.getContent(page);
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
	public String boardModifyReq(@ModelAttribute("boardVO") FreeBoardVO vo, RedirectAttributes ra) {
		if(fs.modify(vo)) {
			System.out.println("변경 성공");
			ra.addFlashAttribute("msg", "수정 완료했습니다.");
		}else {
			ra.addFlashAttribute("msg", "수정 실패했습니다.");
		}
		return "redirect:freeDetail?page="+vo.getNum();
	}
	
	// 글 삭제 요청
	@RequestMapping(value="freeDeleteReq", method = RequestMethod.POST)
	public String boardDeleteReq(@RequestParam("num") int num) {
		if(fs.delete(num)) {
			System.out.println("삭제 성공");
			return "redirect:freeList";
		}else {
			return "freeBoard/freeModify?page="+num;
		}
	}
	
}
