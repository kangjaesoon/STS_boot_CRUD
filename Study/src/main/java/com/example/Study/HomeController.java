package com.example.Study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String getHome() throws Exception{
		return "index";
	}
	
	/*
	 * @GetMapping("/board/boardList") public void boardList() throws Exception{
	 * 
	 * }
	 */
	
}
