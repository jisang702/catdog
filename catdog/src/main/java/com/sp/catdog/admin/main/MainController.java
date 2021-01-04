package com.sp.catdog.admin.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.catdog.common.CountManager;

@Controller("admin.mainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
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
		
		return ".adminLayout";
	}
}
