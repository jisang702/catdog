package com.sp.catdog.customer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("customer.customerController")
public class CustomerController {
	
	@RequestMapping("/customer/{menuItem}")
	public String main(
			@PathVariable String menuItem,
			Model model
			) throws Exception{
		
		model.addAttribute("menuItem", menuItem);
		return ".customer.main";
	}
}
