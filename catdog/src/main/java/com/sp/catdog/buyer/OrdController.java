package com.sp.catdog.buyer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.catdog.common.MyUtil;
/*
@Controller("ord.ordController")
@RequestMapping("/store/*")
public class OrdController {
	@Autowired
	private OrdService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("{gubun}/orderDetail")
	public String orderDetail(
			@PathVariable String gubun,
			HttpServletRequest req,
			Model model,
			Ord dto
			) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
	
		model.addAttribute("gubun", gubun);
		model.addAttribute("dto", dto);
		
		List<Ord> list= service.listOrd(map);
		return null;
		
	}
}
*/