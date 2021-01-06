package com.sp.catdog.community.miss;

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

@Controller("miss.missController")
@RequestMapping("/community/miss/*")
public class MissController {
	@Autowired
	private MissService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int rows = 10; 
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		
        List<Miss> list = service.listMiss(map);
		int num, n = 0;
        for(Miss dto : list) {
        	num = dataCount - (offset + n);
            dto.setNum(num);
            n++;
        }     
        
		String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/community/miss/list";
		String articleUrl = cp + "/community/miss/article?page=" + current_page;
		
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword="
					+ URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
        
		return ".community.miss.list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int missNum,
			@RequestParam(defaultValue = "") String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(missNum);

		Miss dto=service.readMiss(missNum);
		if(dto==null)
			return "redirect:/community/miss/list?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("missNum", missNum);
		

		Miss preReadDto = service.preReadMiss(map);
		Miss nextReadDto = service.nextReadMiss(map);
		
		int replyCount=service.replyCount(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);		
		model.addAttribute("replyCount", replyCount);

		return ".community.miss.article";
	}
	
	@RequestMapping("created")
	public String createdForm(
			Model model
			) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".community.miss.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			Miss dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"miss";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertMiss(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/miss/list";
	}
	
	@RequestMapping("update")
	public String updateForm(
			@RequestParam int missNum,
			@RequestParam String page,
			Model model
			) throws Exception {
		Miss dto=service.readMiss(missNum);
		
		if(dto==null) {
			return "redirect:/community/miss/list?page="+page;
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".community.miss.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Miss dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "miss";		
			
			dto.setUserId(info.getUserId());
			service.updateMiss(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/community/miss/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(
			@RequestParam int missNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "photo";
			service.deleteMiss(missNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/community/miss/list?"+query;
	}
	
	@RequestMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			service.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("missNum", dto.getMissNum());
		int replyCount=service.replyCount(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("replyCount", replyCount);
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("listReply")
	public String listReply(
			@RequestParam int missNum,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int total_page=0;
		int rows=5;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("missNum", missNum);
		
		int dataCount=service.replyCount(map);
		
		total_page=myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		
		List<Reply> listReply=service.listReply(map);

		for(Reply dto : listReply) {
			dto.setMissReplyContent(dto.getMissReplyContent().replaceAll("\n", "<br>"));
			
			Map<String, Object> userMap=new HashMap<>();
			userMap.put("userId", info.getUserId());
			userMap.put("missReplyNum", dto.getMissReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("paging", paging);
		
		return "community/miss/listReply";
	}
	
	@RequestMapping(value = "updateReply")
	@ResponseBody
	public String updateReply(
			@RequestParam int missReplyNum,
			Reply dto,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			service.updateReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
		return "redirect:/community/miss/listReply";
	}
	
	@RequestMapping(value = "deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(defaultValue="0") int missReplyType
			) {
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		int replyCount=service.replyCount(paramMap);
		int replyAnswerCount=service.answerReplyCount(missReplyType);
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		map.put("replyCount", replyCount);
		map.put("replyAnswerCount", replyAnswerCount);
		
		
		return map;
	}
	
	@RequestMapping("listAnswerReply")
	public String listAnswerReply(
			@RequestParam int missReplyType,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Reply> listAnswerReply=service.listAnswerReply(missReplyType);
		for(Reply dto:listAnswerReply) {
			dto.setMissReplyContent(dto.getMissReplyContent().replaceAll("\n", "<br>"));

			Map<String, Object> userMap=new HashMap<>();
			userMap.put("userId", info.getUserId());
			userMap.put("missReplyNum", dto.getMissReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		
		model.addAttribute("listAnswerReply", listAnswerReply);
		return "community/miss/listAnswerReply";
	}
	
	@RequestMapping("insertReplyLike")
	@ResponseBody
	public Map<String, Object> insertReplyLike(
			@RequestParam int missReplyNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("missReplyNum", missReplyNum);		
		
		try {
			service.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int replyLikeCount=service.replyLikeCount(missReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
	
	@RequestMapping("deleteReplyLike")
	@ResponseBody
	public Map<String, Object> deleteReplyLike(
			@RequestParam int missReplyNum,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("missReplyNum", missReplyNum);		
		
		try {
			service.deleteReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int replyLikeCount=service.replyLikeCount(missReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
	
	
}
