package com.sp.catdog.commu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commu.commuController")
public class CommuController {
	@RequestMapping(value="/commu")
	public String main() throws Exception {
	
		return ".main.main";
	}
}
