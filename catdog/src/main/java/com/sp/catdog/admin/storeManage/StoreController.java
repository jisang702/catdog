package com.sp.catdog.admin.storeManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.CountManager;
import com.sp.catdog.common.MyUtil;

@Controller("storeManage.storeController")
@RequestMapping("/admin/storeManage/*")
public class StoreController {
	@Autowired
	private StoreService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("analysis")
	public String analysis(Model model) throws Exception{
		
		long todayCount=CountManager.getTodayCount();
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", "today");
		int todayOrderCount=service.orderCount("today");
		int todayOrderPriceSum=service.orderPriceSum("today");
		int todayProductCount=service.productCount(map);
		
		map.put("state", "total");
		int totalOrderCount=service.orderCount("total");
		int totalOrderPriceSum=service.orderPriceSum("total");
		int totalProductCount=service.productCount(map);
		
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("todayOrderCount", todayOrderCount);
		model.addAttribute("todayOrderPriceSum", todayOrderPriceSum);
		model.addAttribute("todayProductCount", todayProductCount);
		
		model.addAttribute("totalOrderCount", totalOrderCount);
		model.addAttribute("totalOrderPriceSum", totalOrderPriceSum);
		model.addAttribute("totalProductCount", totalProductCount);
		model.addAttribute("subMenu", 1);
		return ".admin4.admin.storeManage.analysis";
	}
	
	@RequestMapping("listProduct")
	public String listProduct(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "prdPet", defaultValue = "") String prdPet,
			@RequestParam(value = "prdState", defaultValue = "") String prdState,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=20;
		int total_page=0;
		int productCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		if(prdPet.length() != 0 )
			map.put("prdPet", Integer.valueOf(prdPet));
		
		if(prdState.length() != 0 )
			map.put("prdState", Integer.valueOf(prdState));
		map.put("state", "total");

		productCount=service.productCount(map);
		
		if(productCount!=0)
			total_page=myUtil.pageCount(rows, productCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Store> list = service.listProduct(map);
		
		int listNum, n=0;
		for(Store dto:list) {
			listNum=productCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/admin/storeManage/listProduct";
		
		if(keyword.length()!=0) {
			query+="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+=listUrl+"?"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("productCount", productCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("prdPet", prdPet);
		model.addAttribute("prdState", prdState);
		model.addAttribute("subMenu", 3);
		
		return ".admin4.admin.storeManage.listProduct";
	}
}
