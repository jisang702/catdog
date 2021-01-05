package com.sp.catdog.admin.boardManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
	
	@RequestMapping("analysis")
	public String analysis(Model model) throws Exception{
		
		
		
		model.addAttribute("subMenu", 1);
		return ".admin4.admin.boardManage.analysis";
	}
	
	@RequestMapping("boardAnalysis")
	@ResponseBody
	public Map<String, Object> listBoardSection() throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		//게시판 통계 차트
		List<Analysis> deal=service.listDealSection();
		List<Analysis> photo=service.listPhotoSection();
		List<Analysis> free=service.listFreeSection();
		List<Analysis> miss=service.listMissSection();
		List<Analysis> video=service.listVideoSection();
		
	
		model.put("deal", deal);
		model.put("photo", photo);
		model.put("free", free);
		model.put("miss", miss);
		model.put("video", video);
		
		return model;
	}
	
	@RequestMapping("boardAgeAnalysis")
	@ResponseBody
	public Map<String, Object> boardAgeSection() throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		List<Analysis> list=service.boardAgeSection();
		
		model.put("list", list);
		
		return model;
	}
	
	
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
		
		int rows=15;
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
		model.addAttribute("subMenu", 3);

		return ".admin4.admin.boardManage.articlelist";
	};


	@RequestMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam String tableName,
			@RequestParam String numName,
			@RequestParam int num
			) throws Exception{
		
		String state="true";
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("tableName", tableName);
			map.put("numName", numName);
			map.put("num", num);
			
			service.deleteArticle(map);
			
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);	
		return model; 
	}

	
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
		
		int rows=15;
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
		model.addAttribute("subMenu", 4);

		return ".admin4.admin.boardManage.replylist";
	};
	
	@RequestMapping("listReplyReport")
	public String listReplyReport(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String boardType,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=15;
		int total_page=0;
		int replyReportCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardType", boardType);
		
		replyReportCount=service.replyReportCount(map);

		if(replyReportCount!=0)
			total_page=myUtil.pageCount(rows, replyReportCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Board> list=service.listReplyReport(map);
		
		int listNum, n=0;
		for(Board dto:list) {
			listNum=replyReportCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/admin/boardManage/listReplyReport";
		
		if(keyword.length()!=0) {
			query+="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+=listUrl+"?"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("replyReportCount", replyReportCount);
		model.addAttribute("boardType", boardType);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("subMenu", 5);

		return ".admin4.admin.boardManage.replyReportList";
	};
	
	@RequestMapping(value = "detailReport")
	public String detailReport(
			@RequestParam int num,
			@RequestParam(defaultValue = "") String boardType,
			Model model
			) throws Exception{
		
		Board dto = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		dto=service.readReplyReport(map);
		
		model.addAttribute("dto", dto);
		
		return "admin/boardManage/reportDetail";
	}
	
	
}
