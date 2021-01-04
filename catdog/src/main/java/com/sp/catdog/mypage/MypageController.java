package com.sp.catdog.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.catdog.doctor.qna.QnA;
import com.sp.catdog.doctor.qna.QnAService;
import com.sp.catdog.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private QnAService qnaService;
	
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
	public String mypageqna(
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", 0);
		map.put("rows", 5);
		
		List<QnA> listQnA = qnaService.listQnA(map);
		
		model.addAttribute("subMenu", 6);
		model.addAttribute("listQnA", listQnA);
		
		return ".four.mypage.member.qna";
	}

}
