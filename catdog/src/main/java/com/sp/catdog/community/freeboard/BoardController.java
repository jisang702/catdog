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

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Board> list = service.listBoard(map);

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
		
		return ".community.bbs.list";
	}
	
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.bbs.article";
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
}
