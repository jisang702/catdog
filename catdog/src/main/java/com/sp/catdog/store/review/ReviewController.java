/*	
	package com.sp.catdog.store.review;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;

@Controller("store.review.reviewController")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{
		int rows =10;
		int total_page = 0;
		int dataCount =0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword =URLDecoder.decode(keyword,"utf-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount =service.dataCount(map);
		if(dataCount !=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		if(total_page <current_page)
			current_page = total_page;
		
		int offset=(current_page-1)*rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Review> list = service.listReview(map);
		
		//글번호 만들기
		int reNum,n = 0;
		for(Review dto:list) {
			reNum = dataCount - (offset+n);
			dto.setReNum(reNum);
			n++;
		}
		//ajax 페이징처리
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",total_page);
		model.addAttribute("condition",condition);
		model.addAttribute("keyword",keyword);
		return "prdinfo/review/list";
	}
		@RequestMapping(value="created", method = RequestMethod.POST)
		@ResponseBody
		public String createdForm(
				Model model
				) throws Exception{
			model.addAttribute("pageNo","1");
			
			return "prdinfo/review/created";
		}
}
 */
