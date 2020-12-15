package com.sp.catdog.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@RequestMapping("home")
	public String mypagehome(Model model) throws Exception {
		model.addAttribute("subMenu", 1);
		return ".four.mypage.member.home";
	}
	
	@RequestMapping("mypet")
	public String mypagepet(Model model) throws Exception {
		model.addAttribute("subMenu", 2);
		return ".four.mypage.member.mypet";
	}
	
	@RequestMapping("mypoint")
	public String mypoint(Model model) throws Exception {
		model.addAttribute("subMenu", 3);
		return ".four.mypage.member.point";
	}
	
	@RequestMapping("list")
	public String mypagelist(Model model) throws Exception {
		model.addAttribute("subMenu", 5);
		return ".four.mypage.member.list";
	}
	
	@RequestMapping("qna")
	public String mypageqna(Model model) throws Exception {
		model.addAttribute("subMenu", 6);
		return ".four.mypage.member.qna";
	}

}
