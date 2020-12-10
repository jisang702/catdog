package com.sp.catdog.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return ".member.login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) throws Exception {
		
		Member dto=service.loginMember(userId);
		if(dto==null || ! userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		//세션에 로그인 정보 저장
		SessionInfo info=new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserNick(dto.getUserNick());
		info.setUserName(dto.getUserName());
		info.setUserType(dto.getUserType());
		
		session.setMaxInactiveInterval(30*60);
		
		session.setAttribute("member", info);
		
		//로그인 이전 URI로 이동
/*		String uri=(String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
*/		
		return "redirect:/commu";
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/commu";
	}
	
	@RequestMapping("register")
	public String registerForm() throws Exception {
		return ".member.register";
	}
}
