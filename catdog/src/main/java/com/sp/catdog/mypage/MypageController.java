package com.sp.catdog.mypage;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.customer.qna.Board;
import com.sp.catdog.customer.qna.BoardService;
import com.sp.catdog.doctor.qna.QnA;
import com.sp.catdog.doctor.qna.QnAService;
import com.sp.catdog.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private QnAService qnaService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MypageService mypageService;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("home")
	public String mypagehome(			
			@RequestParam(value = "boardType", defaultValue = "") String boardType,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		int pointSum=mypageService.pointSum(info.getUserId());
		String userName=info.getUserName();
		int rows=3;
		int offset = 0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("boardType", boardType);
        map.put("offset", offset);
        map.put("rows", rows);
		
		List<Mypage> list=mypageService.selectList(map);
		List<Mypage> petlist=mypageService.petList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("petlist", petlist);
		model.addAttribute("pointSum", pointSum);
		model.addAttribute("userName",userName);
		model.addAttribute("subMenu", 1);
		return ".four.mypage.member.home";
	}
	
	@RequestMapping("mypet")
	public String mypagepet(
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		List<Mypage> list=mypageService.petList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("subMenu", 2);
		
		return ".four.mypage.member.mypet";
	}
	
	@RequestMapping("mypet/created")
	@ResponseBody
	public Map<String, Object> insertPet(
			Mypage dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="ture";
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "pet";
		
		try {
			dto.setUserId(info.getUserId());
			mypageService.insertPet(dto, pathname);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("mypet/pet")
	@ResponseBody
	public Map<String, Object> readPet(
			@RequestParam int petNum
			) throws Exception {
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("petNum", petNum);
		Mypage dto=mypageService.readPet(petNum);
		
		model.put("dto", dto);
		
		return model;
	}
	
	@RequestMapping("mypoint")
	public String mypoint(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value = "sortType", defaultValue = "all") String sortType,
			@RequestParam(value = "fromDate", required = false) String fromDate,
			@RequestParam(value = "toDate", required = false) String toDate,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int rows = 10; 
		int total_page = 0;
		Date from_Date=null;
		Date to_Date=null;
		
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(fromDate!=null) from_Date=sdf.parse(fromDate);
		if(toDate!=null) to_Date=sdf.parse(toDate);

		Map<String, Object> map=new HashMap<>();
        
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
        map.put("offset", offset);
        map.put("rows", rows);
		
        map.put("sortType", sortType);
		map.put("userId", info.getUserId());
		map.put("fromDate", from_Date);
		map.put("toDate", to_Date);
		
		int pointCount=mypageService.pointCount(map);
		int pointSum=mypageService.pointSum(info.getUserId());
		
		total_page = myUtil.pageCount(rows, pointCount);
		
		List<Mypage> list=mypageService.listPoint(map);
		
		if (total_page < current_page)
			current_page = total_page;
        
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
		model.addAttribute("from_Date", from_Date);
		model.addAttribute("to_Date", to_Date);
		model.addAttribute("subMenu", 3);
		
		return ".four.mypage.member.point";
	}
	
	@RequestMapping("list")
	public String mypagelist(			
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value = "boardType", defaultValue = "") String boardType,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int rows = 10; 
		int total_page = 0;

		int dataCount=0;
		List<Mypage> list=null;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
        map.put("offset", offset);
        map.put("rows", rows);
        map.put("boardType", boardType);
        
		list=mypageService.selectList(map);
		dataCount=mypageService.dataCount(map);
		
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;
        
        String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/mypage/list";
		
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
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("userType", info.getUserType());
		map.put("offset", 0);
		map.put("rows", 5);
		
		List<QnA> listQnA = qnaService.listQnA2(map);
		List<Board> listBoard=boardService.listBoard(map);
		
		model.addAttribute("subMenu", 6);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("listQnA", listQnA);
		
		return ".four.mypage.member.qna";
	}
	

}
