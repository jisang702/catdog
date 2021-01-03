package com.sp.catdog.community.miss;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("miss.missController")
@RequestMapping("/community/miss/*")
public class MissController {
	@Autowired
	private MissService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.miss.list";
	}
	
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.miss.article";
	}
	
	@RequestMapping("created")
	public String createdForm(
			Model model
			) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".community.miss.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			Miss dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"miss";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertMiss(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/miss/list";
	}
}
