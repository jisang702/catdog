
package com.sp.catdog.seller;

import java.io.File;
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

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("store.seller.StoreProductController")
@RequestMapping("/store/seller/*")
public class StoreProductController {
	
	@Autowired
	private StoreProductService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value="created", method = RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(!(info.getUserType()==3)) {
			return "redirect:/store/list";
		}
		
		List<StoreProduct> listCategory = service.listCategory();
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("listCategory", listCategory);		
		model.addAttribute("mode", "created");
		
		return ".store.seller.created";
	}

	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit (
			StoreProduct dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(!(info.getUserType()==3)) {
			return "redirect:/store/seller/list";
		}
		
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "store";
			
			dto.setUserId(info.getUserId());
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/store/seller/list";
	}
	
	@RequestMapping(value="list")
	public String listProduct(
			@RequestParam(value="page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 30;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0 ) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<StoreProduct> list = service.listProduct(map);
		
		int listNum, n = 0;
		for(StoreProduct dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/store/seller/list";
		String articleUrl = cp+"/store/seller/article?page=" + current_page;
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/store/seller/list?" + query;
			articleUrl = cp+"store/seller/page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".store.seller.list";
	}
	
	@RequestMapping(value="article", method = RequestMethod.GET)
	public String article (
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {		
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}

	
		return ".store.seller.article";
	}
	
	
}
