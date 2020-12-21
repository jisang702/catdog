package com.sp.catdog.community.freeboard;

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

@Controller("bbs.boardController")
@RequestMapping("/community/board/*")
public class BoardController {
	@Autowired
	private BoardService service;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(		
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue = "news") String array,
			@RequestParam(value="rows", defaultValue="10") int rows,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("array", array);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Board> list = service.listBoard(map);

		int num, n = 0;
        for(Board dto : list) {
        	num = dataCount - (offset + n);
            dto.setNum(num);
            n++;
        }        
		
		String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/community/board/list";
		String articleUrl = cp + "/community/board/article?page=" + current_page;

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
		
		model.addAttribute("rows", rows);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("array", array);
		
		return ".community.bbs.list";
	}
	
	@RequestMapping("created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".community.bbs.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			Board dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			service.insertBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/community/board/list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int freeNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(freeNum);

		Board dto = service.readBoard(freeNum);
		if(dto==null)
			return "redirect:/community/board/list?"+query;
		
		model.addAttribute("dto", dto);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeNum", freeNum);
		map.put("userId", info.getUserId());
		
		int replyCount=service.replyCount(map);
		int boardLikeCount=service.boardLikeCount(freeNum);
		int boardLikeUser=service.boardLikeUser(map);
			
		model.addAttribute("boardLikeUser", boardLikeUser);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("boardLikeCount", boardLikeCount);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".community.bbs.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int freeNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto=service.readBoard(freeNum);
		
		if(dto==null) {
			return "redirect:/community/board/list?page="+page;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/community/board/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community.bbs.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Board dto, 
			@RequestParam String page
			) throws Exception {

		try {
			service.updateBoard(dto);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/board/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(
			@RequestParam int freeNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.deleteBoard(freeNum, info.getUserId());
		
		return "redirect:/community/board/list?"+query;
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
		map.put("freeNum", dto.getFreeNum());
		int replyCount=service.replyCount(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("replyCount", replyCount);
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("listReply")
	public String listReply(
			@RequestParam int freeNum,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int total_page=0;
		int rows=5;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeNum", freeNum);
		
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
			dto.setFreeReplyContent(dto.getFreeReplyContent().replaceAll("\n", "<br>"));
			
			Map<String, Object> userMap=new HashMap<>();
			userMap.put("userId", info.getUserId());
			userMap.put("freeReplyNum", dto.getFreeReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("page", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "community/bbs/listReply";
	}
	
	@RequestMapping(value = "updateReply")
	@ResponseBody
	public String updateReply(
			@RequestParam int freeReplyNum,
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
		
		return "redirect:/community/bbs/listReply";
	}
	
	@RequestMapping(value = "deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		int dataCount=service.replyCount(paramMap);
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		map.put("replyCount", dataCount);
		
		return map;
	}
	
	@RequestMapping(value = "insertBoardLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike(
			@RequestParam int freeNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		int boardLikeCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("freeNum", freeNum);
		
		Board dto=service.readBoard(freeNum);
		
		try {
			if(dto.getUserId()!=info.getUserId()) {
				service.insertBoardLike(map);
			} else {
				state="false";
			}
		} catch (Exception e) {
			state="false";
		}
		
		boardLikeCount=service.boardLikeCount(freeNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("boardLikeCount", boardLikeCount);
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("deleteBoardLike")
	@ResponseBody
	public Map<String, Object> deleteBoardLike(
			@RequestParam int freeNum,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<>();
		map.put("freeNum", freeNum);
		map.put("userId", info.getUserId());
		
		service.deleteBoardLike(map);
		
		int boardLikeCount=service.boardLikeCount(freeNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("boardLikeCount", boardLikeCount);
		
		return model;
	}
	
	@RequestMapping("listAnswerReply")
	public String listAnswerReply(
			@RequestParam int freeReplyType,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Reply> listAnswerReply=service.listAnswerReply(freeReplyType);
		for(Reply dto:listAnswerReply) {
			dto.setFreeReplyContent(dto.getFreeReplyContent().replaceAll("\n", "<br>"));

			Map<String, Object> userMap=new HashMap<>();
			userMap.put("userId", info.getUserId());
			userMap.put("freeReplyNum", dto.getFreeReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		
		model.addAttribute("listAnswerReply", listAnswerReply);
		return "community/bbs/listAnswerReply";
	}
	
	@RequestMapping("insertReplyLike")
	@ResponseBody
	public Map<String, Object> insertReplyLike(
			@RequestParam int freeReplyNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("freeReplyNum", freeReplyNum);		
		
		try {
			service.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int replyLikeCount=service.replyLikeCount(freeReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
	
	@RequestMapping("deleteReplyLike")
	@ResponseBody
	public Map<String, Object> deleteReplyLike(
			@RequestParam int freeReplyNum,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("freeReplyNum", freeReplyNum);		
		
		try {
			service.deleteReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int replyLikeCount=service.replyLikeCount(freeReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
}
