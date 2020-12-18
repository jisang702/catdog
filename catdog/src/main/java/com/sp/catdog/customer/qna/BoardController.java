package com.sp.catdog.customer.qna;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller("customer.qna.boardController")
@RequestMapping("/customer/qna/*")
public class BoardController {
	@Autowired
	public BoardService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		int rows=10;
		int total_page;
		int dataCount;

		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword,"utf-8");
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			total_page=current_page;
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Board> list=service.listBoard(map);
		
		int listNum, n=0;
		for(Board dto:list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
				
		return "customer/qna/list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{

		List<Board> listCategory= service.listCategory();
		
		model.addAttribute("page", "1");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");
		
		return "customer/qna/created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Board dto,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state = "false";

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "qna";

			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			dto.setUserType(info.getUserType());

			service.insertBoard(dto, pathname);
			state = "true";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);

		return model;
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletResponse resp,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		Board questionDto=service.readQuestion(qnaNum);
		if(questionDto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(questionDto.getQnaSecret()==1 && 
				( info.getUserType()!=0 && ! info.getUserId().equals(questionDto.getUserId()) ) ) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		questionDto.setQnaContent(questionDto.getQnaContent().replaceAll("\n", "<br>"));
		
		Board answerDto = service.readAnswer(questionDto.getQnaNum());
		if(answerDto!=null)
			answerDto.setQnaContent(questionDto.getQnaContent().replaceAll("\n", "<br>"));
		
		//이전 글, 다음 글
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("qnaNum", questionDto.getQnaNum());
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		Board preReadDto= service.preReadQuestion(map);
		Board nextReadDto= service.nextReadQuestion(map);
		
		//파일
		List<Board> qlistFile=service.listFile(questionDto.getQnaNum());
		List<Board> alistFile=service.listFile(answerDto.getQnaNum());
		
		model.addAttribute("questionDto", questionDto);
		model.addAttribute("answerDto", answerDto);
		model.addAttribute("qlistFile", qlistFile);
		model.addAttribute("alistFile", alistFile);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		
		return "customer/qna/article";
	}
}
