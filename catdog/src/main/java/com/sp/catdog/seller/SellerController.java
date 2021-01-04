package com.sp.catdog.seller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("store.sellerController")
@RequestMapping("/store/seller/main/*")
public class SellerController {

	// 상품 관리
	@RequestMapping("product")
	public String productPage(Model model) throws Exception {
		model.addAttribute("subMenu", 1);
		// return ".seller.store.seller.product_list";
		return "redirect:/store/seller/product_list";
		
	}
	
	// 판매현황 관리(매출)
	@RequestMapping("sales")
	public String sales(Model model) throws Exception {
		model.addAttribute("subMenu", 2);
				
		// return ".four.store.seller.sales";
		return "redirect:/store/seller/sales_list";
	}
	
	// 상품문의
	@RequestMapping("qna")
	public String productQna(Model model) throws Exception {
		model.addAttribute("subMenu", 3);
		
		// return ".seller.store.seller.qna_list";
		return "redirect:/store/seller/qna/qna_list";
	}
	
	// 배송관리
	@RequestMapping("ship")
	public String productShip(Model model) throws Exception {
		model.addAttribute("subMenu", 4);
		
		return ".seller.store.seller.ship";
		
	}		
	
}

