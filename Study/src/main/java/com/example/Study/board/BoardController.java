package com.example.Study.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Study.util.Pager;

@Controller
@RequestMapping("/board/**")
public class BoardController {

	@ModelAttribute("board")
	public String getBoard() {
		return "board";
	}
	
	@Autowired
	private BoardService boardService;

	@GetMapping("boardList") 
	public String getList(Pager pager, Model model)throws Exception{
		String msg;
		List<BoardVO> ar = boardService.getList(pager);
		System.out.println(ar);
		if(ar.isEmpty()) {
			System.out.println("ㄴㄴ없음");
			msg = "redirect:/board/boardList";
		}else {
			model.addAttribute("list",ar);
			model.addAttribute("pager",pager);
			msg = "board/boardList";
		}
		
		return msg;
	}
	
	@GetMapping("boardSelect")
	public ModelAndView getSelect(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardVO = boardService.getSelect(boardVO);
		System.out.println(boardVO);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}	
	
	@GetMapping("boardDelete")
	public String setDelete(BoardVO boardVO)throws Exception{
		int result = boardService.setDelete(boardVO);
		return "redirect:./boardList";
	}
	
	@GetMapping("boardUpdate")
	public ModelAndView setUpdate(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardVO = boardService.getSelect(boardVO);
		System.out.println(boardVO);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	@PostMapping("boardUpdate")
	public String setUpdate(BoardVO boardVO, Model model)throws Exception{
		int result = boardService.setUpdate(boardVO);
		
		return "redirect:./boardList";
	}
	
	@GetMapping("boardInsert")
	public void boardInsert()throws Exception{
		
	}
	
	@PostMapping("boardInsert")
	public String setInsert(BoardVO boardVO)throws Exception{
		int result = boardService.setInsert(boardVO);
		return "redirect:./boardList";
	}

}
