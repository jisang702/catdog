package com.sp.catdog.store.qna;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.MyUtil;

@Controller("store.qna.qnaController")
@RequestMapping(value="/prdinfo/prdqna/*")
public class QnaController {
	@Autowired
	private QnaService service;
	@Autowired
	private MyUtil MyUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 10;
		int total_page;
		int dataCount;
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword,"UTF-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = MyUtil.pageCount(rows, dataCount);
		if(total_page < current_page) {
			current_page= total_page;
	}
		int offset=(current_page-1)*rows;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Qna> list = service.listQna(map);
	
		//글번호 만들기
		int listNum, n=0;
		for(Qna dto:list) {
			listNum = dataCount - (offset +n);
			dto.setQnaNum(listNum);
			n++;
		}
		//ajax페이징 처리
		String paging = MyUtil.pagingMethod(current_page, total_page, "listPage");
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",total_page);
		model.addAttribute("condition",condition);
		model.addAttribute("keyword",keyword);
		return "store/qna/list";
	}
}
