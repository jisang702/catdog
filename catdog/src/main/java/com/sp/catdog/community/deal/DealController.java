package com.sp.catdog.community.deal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("deal.dealController")
@RequestMapping("/community/deal/*")
public class DealController {
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.deal.list";
	}
}
