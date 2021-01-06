package com.sp.catdog.seller.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("store.seller.StoreSalesController")
@RequestMapping("/store/seller/*")
public class StoreSalesController {
	@Autowired
	private StoreSalesService service;
	
	@RequestMapping(value="sales_list", produces = "application/json;charset=utf-8")
	public String sales(
			Model model
			) throws Exception {
		
		return ".seller.store.seller.sales_list";
	}
	
	@RequestMapping("categorySection")
	@ResponseBody
	public Map<String, Object> listCategorySection() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<StoreSales> list = service.listCategorySection();
		
		model.put("list", list);
		
		return model;
	}
}
