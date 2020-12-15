package com.sp.catdog.customer.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.fapController")
public class FaqController {
	@RequestMapping("faq/faq")
	public String list() throws Exception {
		return ".customer.faq.faq";
	}
}
