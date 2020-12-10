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
		return ".four.menu5.mypage.home";
	}
	
	@RequestMapping("mypet")
	public String mypagepet(Model model) throws Exception {
		model.addAttribute("subMenu", 2);
		return ".four.menu5.mypage.mypet";
	}
	
	@RequestMapping("list")
	public String mypagelist(Model model) throws Exception {
		model.addAttribute("subMenu", 5);
		return ".four.menu5.mypage.list";
	}
	
	@RequestMapping("qna")
	public String mypageqna(Model model) throws Exception {
		model.addAttribute("subMenu", 6);
		return ".four.menu5.mypage.qna";
	}
}
