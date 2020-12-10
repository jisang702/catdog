package com.sp.catdog.menu1.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.boardController")
@RequestMapping("/bbs/*")
public class BoardController {
	@RequestMapping("list")
	public String bbslist() throws Exception {
		return ".menu1.bbs.list";
	}
	
	@RequestMapping("article")
	public String bbsarticle() throws Exception {
		return ".menu1.bbs.article";
	}
	
	@RequestMapping("created")
	public String bbscreatedForm() throws Exception {
		return ".menu1.bbs.created";
	}
}
