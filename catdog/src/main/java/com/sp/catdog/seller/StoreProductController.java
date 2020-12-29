
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
	
	// 상품판매 글 등록
	@RequestMapping(value="product_created", method = RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(!(info.getUserType()==3)) {
			return "redirect:/store/product_list";
		}
		
		List<StoreProduct> listCategory = service.listCategory();
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("listCategory", listCategory);		
		model.addAttribute("mode", "created");
		
		return ".store.seller.product_created";
	}
	
	// 상품판매 글 등록 submit
	@RequestMapping(value="product_created", method=RequestMethod.POST)
	public String createdSubmit (
			StoreProduct dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(!(info.getUserType()==3)) {
			return "redirect:/store/seller/product_list";
		}
		
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "store";
			
			dto.setUserId(info.getUserId());
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/store/seller/product_list";
	}
	
	// 상품 판매리스트
	@RequestMapping(value="product_list")
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
		int dataCountProduct = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCountProduct = service.dataCountProduct(map);
		total_page = myUtil.pageCount(rows, dataCountProduct);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0 ) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<StoreProduct> list = service.listProduct(map);
		
		// 글 번호
		int listNum, n = 0;
		for(StoreProduct dto : list) {
			listNum = dataCountProduct - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/store/seller/product_list";
		String articleUrl = cp+"/store/seller/article?page=" + current_page;
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/store/seller/product_list?" + query;
			articleUrl = cp+"store/seller/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("product_list", list);
		model.addAttribute("dataCountProduct", dataCountProduct);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		// return ".store.seller.list";
		return ".four.store.seller.product_list";
	}
	
	// 상품 판매 글보기
	@RequestMapping(value="article", method = RequestMethod.GET)
	public String article (
			@RequestParam int prdNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {		
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		StoreProduct dto = service.readProduct(prdNum);
		if(dto==null)
			return "redirect:/store/seller/product_list?"+query;
		
		dto.setPrdContent(dto.getPrdContent().replaceAll("\n", "<br>"));
		
		// 이전글 , 다음글
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("prdNum", prdNum);
		
		StoreProduct preReadDto = service.preReadProduct(map);
		StoreProduct nextReadDto = service.nextReadProduct(map);
				
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".store.seller.product_article";
		
	}
	
	
}
