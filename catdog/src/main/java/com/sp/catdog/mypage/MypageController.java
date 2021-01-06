package com.sp.catdog.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.doctor.qna.QnA;
import com.sp.catdog.doctor.qna.QnAService;
import com.sp.catdog.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private MypageService mypageService;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("home")
	public String mypagehome(Model model) throws Exception {
		model.addAttribute("subMenu", 1);
		return ".four.mypage.member.home";
	}
	
	@RequestMapping("mypet")
	public String mypagepet(Model model) throws Exception {
		model.addAttribute("subMenu", 2);
		return ".four.mypage.member.mypet";
	}
	
	@RequestMapping("mypoint")
	public String mypoint(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value = "sortType", defaultValue = "all") String sortType,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int rows = 10; 
		int total_page = 0;

		Map<String, Object> map=new HashMap<>();
        
		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
        map.put("offset", offset);
        map.put("rows", rows);
		
        map.put("sortType", sortType);
		map.put("userId", info.getUserId());
		
		int pointCount=mypageService.pointCount(map);
		int pointSum=mypageService.pointSum(info.getUserId());
		
		total_page = myUtil.pageCount(rows, pointCount);
		
		List<Mypage> list=mypageService.listPoint(map);
        
        String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/mypage/mypoint";
		
		listUrl += "?" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
        
		model.addAttribute("list", list);
		model.addAttribute("pointCount", pointCount);
		model.addAttribute("pointSum", pointSum);
		model.addAttribute("sortType", sortType);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", 3);
		
		return ".four.mypage.member.point";
	}
	
	@RequestMapping("list")
	public String mypagelist(			
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value = "boardType", defaultValue = "free") String boardType,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int rows = 10; 
		int total_page = 0;

		int dataCount=0;
		List<Mypage> list=null;

		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
        map.put("offset", offset);
        map.put("rows", rows);
        map.put("boardType", boardType);
        
        String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/mypage/list";
		
		list=mypageService.selectList(map);
		dataCount=mypageService.dataCount(map);
		
		total_page = myUtil.pageCount(rows, dataCount);
		
		listUrl += "?" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
        
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("boardType", boardType);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", 5);
		
		return ".four.mypage.member.list";
	}
	
	@RequestMapping("qna")
	public String mypageqna(
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", 0);
		map.put("rows", 5);
		
		List<QnA> listQnA = qnaService.listQnA(map);
		
		model.addAttribute("subMenu", 6);
		model.addAttribute("listQnA", listQnA);
		
		return ".four.mypage.member.qna";
	}
	

}
