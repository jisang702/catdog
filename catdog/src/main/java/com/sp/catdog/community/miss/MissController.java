package com.sp.catdog.community.miss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("miss.missController")
@RequestMapping("/community/miss/*")
public class MissController {
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.miss.list";
	}
	
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.miss.article";
	}
	
	@RequestMapping("created")
	public String created() throws Exception {
		return ".community.miss.created";
	}
}
