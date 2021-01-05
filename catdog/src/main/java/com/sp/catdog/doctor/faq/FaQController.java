package com.sp.catdog.doctor.faq;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("doctor.faq.faQController")
@RequestMapping("/doctor/faq/*")
public class FaQController {
	@Autowired
	private FaQService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue =  "") String keyword,
			@RequestParam(defaultValue = "0") int faqCategoryNum,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqCategoryNum", faqCategoryNum);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<FaQ> list = service.listFaQ(map);
		
		int listNum, n =0;
		for(FaQ dto : list) {
			listNum = dataCount -(offset=n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/doctor/FaQ/list?faqCategoryNum="+faqCategoryNum;
		if(keyword.length()!= 0) {
			query="&condition=" +condition+"&keyword="+ URLEncoder.encode(keyword,  "utf-8");
		}
		
		listUrl = cp+"/doctor/faq/list?" +query;

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("faqCategoryNum", faqCategoryNum);
        
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".doctor.faq.list";
	}

	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createForm(Model model) throws Exception {
		Map<String, Object> map= new HashMap<>();
		map.put("mode", "faqEnabled");
		List<FaQ> listCategory=service.listCategory(map);
		
		model.addAttribute("page", "1");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");
		
		return ".doctor.faq.created";
	}

	@RequestMapping(value = "created", method=RequestMethod.POST)
	public String createdSubmit(FaQ dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
			
		try {
			dto.setUserId(info.getUserId());
			service.insertFaQ(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/doctor/faq/list";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int faqNum,
							@RequestParam String page,
							HttpSession session,
							Model model) throws Exception {
	
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		FaQ dto=service.readFaQ(faqNum);
		
		if(dto==null) {
			return "redirect:/doctor/faq/list?page="+page;
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/doctor/faq/list?page="+page;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "faqEnabled");
		List<FaQ> listCategory=service.listCategory(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("page", page);
		
		return ".doctor.faq.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(FaQ dto,
							@RequestParam String page,
							HttpSession session)throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info.getUserId().equals("admin")) {
			try {
				dto.setUserId(info.getUserId());
				service.updateFaQ(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/doctor/faq/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam int faqNum, 
							@RequestParam String page, 
							HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String query="page="+page;
		
		if(info.getUserId().equals("admin")) {
			try {
				Map<String, Object> map = new HashMap<>();
				map.put("faqNum", faqNum);
				
				service.deleteFaQ(map);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return "redirect:/doctor/faq/list?"+query;
	}
	
	// AJAX-Text(HTML)
	@RequestMapping(value="listAllCategory")
	public String listAllCategory(Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "all");
		
		List<FaQ> listCategory=service.listCategory(map);
		
		model.addAttribute("listAllCategory", listCategory);
		
		return "doctor/faq/listAllCategory";
	}
	
	// AJAX-JSON
	@RequestMapping(value="insertCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertCategory(FaQ dto) throws Exception {
		String state="false";

		try {
			service.insertCategory(dto);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}

	// AJAX-JSON
	@RequestMapping(value="updateCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCategory(FaQ dto) throws Exception {

		String state="false";
		try {
			service.updateCategory(dto);
			state="true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	// AJAX-JSON
	@RequestMapping(value="deleteCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCategory(
			@RequestParam int faqCategoryNum) throws Exception {

		String state="false";
		try {
			service.deleteCategory(faqCategoryNum);
			state="true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}

}