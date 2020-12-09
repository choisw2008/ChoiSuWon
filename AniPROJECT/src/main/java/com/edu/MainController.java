package com.edu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@RequestMapping("/")
public class MainController {

	@RequestMapping("/")
	private String gotoBoardList() {
		return "/board/Main";
	}
	
	@RequestMapping(value ="/chat", method = RequestMethod.GET )
	public String chatMain() {
		return "/client/chat";
	}
	
	@RequestMapping("/board/pop")
	private String gotoBoardpop() {
		return "/board/pop";
	}
	@RequestMapping("/NewFile")
	private String gotocss() {
		return "/NewFile";
	}

}
