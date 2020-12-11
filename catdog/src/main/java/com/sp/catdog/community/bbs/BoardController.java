package com.sp.catdog.community.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.boardController")
@RequestMapping("/bbs/*")
public class BoardController {
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.bbs.list";
	}
	
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.bbs.article";
	}
	
	@RequestMapping("created")
	public String createdForm() throws Exception {
		return ".community.bbs.created";
	}
}
