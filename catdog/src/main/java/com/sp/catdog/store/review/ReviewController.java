package com.sp.catdog.store.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.MyUtil;

@Controller("store.review.reviewController")
@RequestMapping(value="/prdinfo/prdreview/*")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue = "1") int current_page,
			@RequestParam int prdNum,
			Model model
			) throws Exception {

		return "prdinfo/review/list";
	}
	
	@RequestMapping(value="created")
	public String created(
			
			) throws Exception{
		return "";
	}
}

