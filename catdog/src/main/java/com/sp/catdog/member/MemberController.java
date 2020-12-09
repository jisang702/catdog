package com.sp.catdog.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.memberController")
@RequestMapping("/member/*")
public class MemberController {
	
	@RequestMapping("login")
	public String loginForm() throws Exception {
		return ".member.login";
	}
	
	@RequestMapping("register")
	public String registerForm() throws Exception {
		return ".member.register";
	}
}
