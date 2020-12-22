package com.sp.catdog.customer.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.member.SessionInfo;

@Controller("customer.faqController")
@RequestMapping("/customer/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;
	
	@RequestMapping(value = "list")
	public String list() throws Exception {
		return "customer/faq/faq";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		List<Faq> listCategory=service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("page", "1");
		model.addAttribute("mode", "created");
		
		return "customer/faq/created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Faq dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state = "false";

		if (dto.getUserType() == info.getUserType()) {
			
			dto.setUserId(info.getUserId());
			dto.setUserType(info.getUserType());
			
			service.insertFaq(dto);
			state = "true";
		}
		 
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
}
