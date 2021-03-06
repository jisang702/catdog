package com.sp.catdog.buyer;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("buyer.buyerController")
@RequestMapping("/store/*")
public class BuyerController {

	@Autowired
	private BuyerService service;
	
	@Autowired
	private OrdService ordService;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value="{gubun}/main")
	public String buyer(
		@PathVariable String gubun,
		@RequestParam(value="page", defaultValue = "1") int current_page,
		@RequestParam(defaultValue = "") String keyword,
		HttpServletRequest req,
		Model model
			)throws Exception{
		int rows=9;
		int total_page = 0;
		int dataCount= 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword =URLDecoder.decode(keyword,"utf-8");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
		dataCount = service.dataCount(map);
		
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		if(total_page<current_page) {
			current_page=total_page;
		}
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Buyer> list = service.listBuyer(map);
		
		String cp = req.getContextPath();
		String listUrl=cp+"/store/"+gubun+"/main";
		String productUrl=cp+"/store/"+gubun+"/productInfo";
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		model.addAttribute("productUrl",productUrl);
		model.addAttribute("gubun",gubun);
		
		return ".store.storemain.main";
	}

	
	@RequestMapping(value="{gubun}/productInfo")
	public String productInfo(
			@PathVariable String gubun,
			@RequestParam int prdNum,
			@RequestParam(value="page", defaultValue = "") int current_page,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model)throws Exception{		
		service.prdHitCount(prdNum);
		
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
		
		String cp=req.getContextPath();
		String cartUrl =cp+"/store/"+gubun+"/cart";
		String orderDetailUrl = cp+"/store/"+gubun+"/orderDetail"; 
		Buyer dto = service.readBuyer(prdNum);
		int prdPrice=dto.getPrdPrice();
		int disCount=dto.getPrdDisCount();
		int price=prdPrice*(disCount/100);
		dto.setPrice(price);
		
		model.addAttribute("price", price);
		model.addAttribute("gubun", gubun);
		model.addAttribute("page",current_page);
		model.addAttribute("dto", dto);
		model.addAttribute("orderDetailUrl",orderDetailUrl);
		model.addAttribute("cartUrl",cartUrl);
		model.addAttribute("gubun",gubun);
		return ".store.storemain.productInfo";
	}
	
	@RequestMapping(value ="{gubun}/orderDetail")
	public String orderDetail(
			@PathVariable String gubun,
			@RequestParam int prdNum,
			@RequestParam(value="page", defaultValue = "1") int current_page,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
	
		Buyer dto = service.readBuyer(prdNum);
		
		model.addAttribute("gubun", gubun);
		model.addAttribute("page",current_page);
		model.addAttribute("dto", dto);
		
		return ".store.storemain.orderDetail";
	}
	
	@RequestMapping(value = "{gubun}/insertOrder")
	public String insertOrder(
			@PathVariable String gubun,
			@RequestParam int prdNum,
			Ord odto,
			Buyer dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto=service.readBuyer(prdNum);
		
		try {
			odto.setUserId(info.getUserId());
			odto.setOrderPrice(dto.getPrice());
			ordService.insertOrd(odto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/store"+gubun+"/main";
	}
	
}

