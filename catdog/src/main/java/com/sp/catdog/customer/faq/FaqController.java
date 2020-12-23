package com.sp.catdog.customer.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("customer.faqController")
@RequestMapping("/customer/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value="page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int faqCateNum,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("mode", "enabled");
		
		List<Faq> listCategory=service.listCategory(map);

		int rows=10;
		int total_page=0;
		
		map.put("faqCateNum", faqCateNum);
		int dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Faq> list = service.listFaq(map);
		for(Faq dto:list) {
			dto.setFaqAnswer(myUtil.htmlSymbols(dto.getFaqAnswer()));
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("page", current_page);
		model.addAttribute("faqCateNum", faqCateNum);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
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
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int faqNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info.getUserType() == 0) {
			
		}
		Faq dto=service.readFaq(faqNum);
		if(dto==null)
			return "redirect:/faq/list";
		
		Map<String, Object> map=new HashMap<>();
		map.put("mode", "enabled");
		List<Faq> listCategory=service.listCategory(map);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return "customer/faq/created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Faq dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if( info.getUserType() == 0) {
			try {
				dto.setUserId(info.getUserId());
				dto.setUserType(info.getUserType());
				
				service.updateFaq(dto);
				state="true";
			} catch (Exception e) {
				
			}
		}
		
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int faqNum,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if( info.getUserType() == 0) {
			try {
				Map<String, Object> map=new HashMap<>();
				map.put("faqNum", faqNum);
				
				service.deleteFaq(map);
				state="true";
			} catch (Exception e) {
				
			}
			
		}
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
}
