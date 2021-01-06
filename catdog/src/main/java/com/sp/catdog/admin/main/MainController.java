package com.sp.catdog.admin.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.CountManager;

@Controller("admin.mainController")
@RequestMapping("/admin/*")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String method(Model model) throws Exception{
		
		//오늘자 통계
		int totalUserCount = service.totalUserCount();
		int todayNewUserCount = service.todayNewUserCount();
		
		int currentCount;
		long todayCount, yesterdayCount, totalCount;
		
		currentCount=CountManager.getCurrentCount(); //현재
		todayCount=CountManager.getTodayCount(); //오늘
		yesterdayCount=CountManager.getYesterdayCount(); //어제
		totalCount=CountManager.getTotalCount(); //누적
		
		model.addAttribute("totalUserCount", totalUserCount);
		model.addAttribute("todayNewUserCount", todayNewUserCount);
		model.addAttribute("currentCount", currentCount);
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("yesterdayCount", yesterdayCount);
		model.addAttribute("totalCount", totalCount); 
		
		
		//신규 회원, 게시물
		
		List<Main> newUserList=service.newUserList();
		List<Main> newArticleList=service.newArticleList();
		List<Main> newProductList=service.newProductList();
		
		model.addAttribute("newUserList", newUserList);
		model.addAttribute("newArticleList", newArticleList);
		model.addAttribute("newProductList", newProductList);
		
		
		//신규 질문
		List<Main> newQuestionList=service.newQuestionList();
		
		model.addAttribute("newQuestionList", newQuestionList);
		
		//신규 공지
		List<Main> newNoticeList=service.newNoticeList();
		model.addAttribute("newNoticeList", newNoticeList);
		
		return ".adminLayout";
	}
	
	@RequestMapping("analysis")
	@ResponseBody
	public Map<String, Object> analysis() throws Exception{
		
		long total, before;
		total=CountManager.getTotalCount();
		before=total-CountManager.getTodayCount();
		
		List<Object> list= new ArrayList<>();		
		list.add(total);
		list.add(before);
		
		Map<String, Object> model = new HashMap<>();
		model.put("total", total);
		model.put("before", before);
		model.put("list", list);
		return model;
	}
}
