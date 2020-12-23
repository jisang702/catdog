package com.sp.catdog.seller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("store.sellerController")
@RequestMapping("/store/seller/main/*")
public class SellerController {

	// 상품 관리
	@RequestMapping(value="product")
	public String productPage(Model model) throws Exception {
		model.addAttribute("subMenu", 1);
		return "redirect:/store/seller/list";
		
	}
	
	// 판매현황 관리(매출)
	@RequestMapping(value="sales")
	public String sales(Model model) throws Exception {
		model.addAttribute("subMenu", 2);
				
		return ".store.seller.sales";
	}
	
	// 상품문의
	@RequestMapping(value="qna")
	public String productQna(Model model) throws Exception {
		model.addAttribute("subMenu", 3);
		
		return ".store.seller.qna";
	}
	
	// 배송관리
	@RequestMapping(value="ship")
	public String productShip(Model model) throws Exception {
		model.addAttribute("subMenu", 4);
		
		return ".store.seller.ship";
		
	}		
	
}

