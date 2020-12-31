package com.sp.catdog.admin.boardManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;

@Controller("boardManage.boardController")
@RequestMapping("/admin/boardManage/*")
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("listArticle")
	public String listArticle(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String boardType,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int articleCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardType", boardType);
		
		articleCount=service.articleCount(map);

		if(articleCount!=0)
			total_page=myUtil.pageCount(rows, articleCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Board> list=service.listArticle(map);
		
		int listNum, n=0;
		for(Board dto:list) {
			listNum=articleCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/admin/boardManage/listArticle";
		
		if(keyword.length()!=0) {
			query+="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+=listUrl+"?"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("articleCount", articleCount);
		model.addAttribute("boardType", boardType);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("subMenu", 2);

		return ".admin4.admin.boardManage.articlelist";
	};

/*
	@RequestMapping("delete")
	@ResponseBody
	public Map<String, Object> deleteArticle(
			Board dto,
			Model model
			) throws Exception{
		
		String state="true";
		try {
			
		} catch (Exception e) {
			state="false";
		}
		
		model.addAttribute("state", state);
		
		return model;
	}
*/
	
	@RequestMapping("listReply")
	public String listReply(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String boardType,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int replyCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardType", boardType);
		
		replyCount=service.replyCount(map);

		if(replyCount!=0)
			total_page=myUtil.pageCount(rows, replyCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Board> list=service.listReply(map);
		
		int listNum, n=0;
		for(Board dto:list) {
			listNum=replyCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/admin/boardManage/listReply";
		
		if(keyword.length()!=0) {
			query+="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+=listUrl+"?"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("boardType", boardType);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("subMenu", 3);

		return ".admin4.admin.boardManage.replylist";
	};
}
