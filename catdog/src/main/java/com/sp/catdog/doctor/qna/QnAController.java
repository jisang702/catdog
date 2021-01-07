package com.sp.catdog.doctor.qna;

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

@Controller("doctor.qna.qnaController")
@RequestMapping(value = "/doctor/qna/*")
public class QnAController {
	
	@Autowired
	private QnAService service;	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value ="list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "10") int rows,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword= URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount= service.dataCount(map);
		total_page= myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int offset=(current_page-1)* rows;
		if(offset < 0) offset= 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<QnA> list= service.listQnA(map);
		
		//글번호 만들기
		int listNum, n=0;
		for(QnA dto:list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/doctor/qna/list";
		String articleUrl = cp + "/doctor/qna/article?page=" + current_page;

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
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("rows", rows);
		
		return ".doctor.qna.list";
	}

	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createForm (Model model) throws Exception {
		
		List<QnA> listCategory= service.listCategory();
		
		model.addAttribute("page", "1");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");
		
		return ".doctor.qna.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(QnA dto, HttpSession session)throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertQnA(dto);
		} catch (Exception e) {

		}
		
		return "redirect:/doctor/qna/list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
            @RequestParam int rows,
			HttpSession session,
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page+"&rows="+rows;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}

		QnA questionDto = service.readQuestion(qnaNum);
		if(questionDto==null) {
			return "redirect:/doctor/qna/list?"+query;
		}
		
		if(questionDto.getQnaSecret()==1) {
			if(! info.getUserId().equals("admin") && (info.getUserType()!= 2 && (! info.getUserId().equals(questionDto.getUserId())))) {
				return "redirect:/doctor/qna/list?"+query;
			}
		}
		
		questionDto.setQnaContent(questionDto.getQnaContent().replaceAll("\n", "<br>"));
		
		QnA answerDto = service.readAnswer(questionDto.getQnaNum());
		if(answerDto!=null) {
			answerDto.setQnaContent(answerDto.getQnaContent().replaceAll("\n", "<br>"));
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNum", questionDto.getQnaNum());
		map.put("condition", condition);
		map.put("keyword", keyword);

		QnA preReadDto = service.preReadQuestion(map);
		QnA nextReadDto = service.nextReadQuestion(map);

		model.addAttribute("questionDto", questionDto);
		model.addAttribute("answerDto", answerDto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		
		return ".doctor.qna.article";
	}
	
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
            @RequestParam int rows,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		QnA dto = service.readQuestion(qnaNum);
		if(dto==null) {
			return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;
		}
		
		List<QnA> listCategory = service.listCategory();
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("dto", dto);		
		model.addAttribute("listCategory", listCategory);

		return ".doctor.qna.created";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			QnA dto,
			@RequestParam String page,
            @RequestParam int rows,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.updateQnA(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;
	}

	@RequestMapping(value="answer", method=RequestMethod.GET)
	public String answerForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam int rows,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		QnA dto = service.readQuestion(qnaNum);
		if(dto==null) {
			return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;
		}
		
		if( info.getUserType()!= 2 ) {
			return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;
		}
		
		dto.setQnaContent("["+dto.getQnaSubject()+"] 에 대한 답변입니다.\n");
		
		List<QnA> listCategory = service.listCategory();
		
		model.addAttribute("mode", "answer");
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("dto", dto);		
		model.addAttribute("listCategory", listCategory);		

		return ".doctor.qna.created";
	}

	@RequestMapping(value="answer", method=RequestMethod.POST)
	public String answerSubmit(QnA dto,
                              @RequestParam String page,
                              @RequestParam int rows,
			HttpSession session) throws Exception {

		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.insertQnA(dto);
		} catch (Exception e) {

		}
        
		return "redirect:/doctor/qna/list?page="+page+"&rows="+rows;

	}
	
	@RequestMapping(value="delete")
	public String delete(
			@RequestParam int qnaNum,
			@RequestParam String mode,
            @RequestParam String page,
			@RequestParam int rows,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String query="page="+page+"&rows="+rows;
		
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
	
		QnA dto = service.readQuestion(qnaNum);
		if(dto!=null) {
			if(info.getUserId().equals(dto.getUserId())||info.getUserId().equals("admin")) {
				try {
					if(mode.equals("question")) {
						service.deleteQuestion(qnaNum);
					} else if(mode.equals("answer")) {
						service.deleteAnswer(qnaNum);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "redirect:/doctor/qna/list?"+query;
	}
	

}
