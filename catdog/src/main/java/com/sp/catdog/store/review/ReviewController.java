package com.sp.catdog.store.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("store.review.reviewController")
@RequestMapping(value="/storemain/prdreview/*")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil MyUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue = "1") int current_page,
			@RequestParam int prdNum,
			Model model
			) throws Exception {
		
		int rows = 10;
		int total_page;
		int dataCount;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prdNum", prdNum);
		
		dataCount = service.dataCount(map);
		total_page = MyUtil.pageCount(rows, dataCount);
		if(total_page < current_page) {
			current_page = total_page;
		}
		int offset = (current_page-1)* rows;
		if(offset< 0 ) offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Review> list = service.listReview(map);
		
		for(Review dto : list) {
			dto.setReContent(dto.getReContent().replaceAll("\n", "<br>"));
			
		}
		//AJAX페이징 처리
		String paging = MyUtil.pagingMethod(current_page, total_page, "listPage");
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",total_page);
		return "store/storemain/review/list";
	}
	
	@RequestMapping(value="created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>insertReply(
			Review dto,
			HttpSession session
			){
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		String state = "true";
		try {
			dto.setUserId(info.getUserId());
			service.insertReview(dto);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
		
	}
}

