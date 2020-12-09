package com.sp.catdog.menu4.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.FapController")
public class FaqController {
	@RequestMapping("faq/faq")
	public String list() throws Exception {
		return ".menu4.faq.faq";
	}
}
