package com.sp.catdog.seller.qna;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

@Controller("store.seller.StoreQnaController")

@RequestMapping("/store/seller/qna/*")
public class StoreQnaController {
	@Autowired
	public StoreQnaService service;
	@Autowired
	private MyUtil myUtil;

	
	@RequestMapping(value = "qna_list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model			
			) throws Exception {
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page;
		int dataCount;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("sellerId", info.getUserId()); // 판매자
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCountAnswer(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<StoreQna> list = service.listBoard(map);
		
		int listNum, n=0;
		for(StoreQna dto:list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/store/qna/qna_list";
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/store/qna/qna_list?" + query;
		}
		String paging=myUtil.pagingMethod(current_page, total_page, listUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".seller.store.seller.qna_list";
	}

	@RequestMapping(value="qna_created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			StoreQna dto,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "false";
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "qna";
			
			dto.setUserId(info.getUserId());
			
			service.insertAnswer(dto, pathname);
			state = "true";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}

}
