package com.sp.catdog.customer.qna;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("customer.qna.boardController")
@RequestMapping("/customer/qna/*")
public class BoardController {
	@Autowired
	public BoardService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
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
		
		Board qdto=service.readQuestion(qnaNum);
		if(qdto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(qdto.getQnaSecret()==1 && 
				( info.getUserType()!=0 && ! info.getUserId().equals(qdto.getUserId()) ) ) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		qdto.setQnaContent(qdto.getQnaContent().replaceAll("\n", "<br>"));
		
		Board adto = service.readAnswer(qdto.getQnaNum());
		if(adto!=null)
			adto.setQnaContent(adto.getQnaContent().replaceAll("\n", "<br>"));
		
		//이전 글, 다음 글
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("qnaNum", qdto.getQnaNum());
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		Board preReadDto= service.preReadQuestion(map);
		Board nextReadDto= service.nextReadQuestion(map);
		
		//파일
		List<Board> qlistFile=service.listFile(qdto.getQnaNum());
		if(adto!=null) {
			List<Board> alistFile=service.listFile(adto.getQnaNum());
			model.addAttribute("alistFile", alistFile);
		}
			
		
		model.addAttribute("qdto", qdto);
		model.addAttribute("adto", adto);
		model.addAttribute("qlistFile", qlistFile);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		
		return "customer/qna/article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
			HttpServletResponse resp,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto=service.readQuestion(qnaNum);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		List<Board> listCategory = service.listCategory();
		List<Board> listFile=service.listFile(qnaNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listFile", listFile);
		
		return "customer/qna/created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Board dto,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		try {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"qna";
			
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			dto.setUserType(info.getUserType());
			service.updateBoard(dto, pathname);
			state="true";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "answer", method = RequestMethod.GET)
	public String answerForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
			HttpServletResponse resp,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto=service.readQuestion(qnaNum);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(info.getUserType()!=0) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		//dto.setQnaParent(qnaNum);
		dto.setQnaContent("["+dto.getQnaSubject()+"] 에 대한 답변입니다.\n");
		

		List<Board> listCategory = service.listCategory();
		
		model.addAttribute("mode", "answer");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return "customer/qna/created";
	}
	
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> answerSubmit(
			Board dto,
			@RequestParam int parent,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		try {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"qna";
			
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			dto.setUserType(info.getUserType());
			dto.setQnaParent(parent);
			
			service.insertBoard(dto, pathname);
			state="true";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int qnaNum,
			@RequestParam String mode,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		Board dto=service.readQuestion(qnaNum);
		if(dto!=null) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "qna";
			
			if(info.getUserId().equals(dto.getUserId()) || info.getUserType() == 0 ) {
				try {
					if(mode.equals("question")) {
						service.deleteQuestion(qnaNum, pathname);
					}else if(mode.equals("answer")) {
						service.deleteAnswer(qnaNum, pathname);
					}
					state="true";
				} catch (Exception e) {
				}
			}
		}
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "download")
	public void download(
			@RequestParam int qnaFileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		boolean b=false;
		
		Board dto=service.readFile(qnaFileNum);
		if(dto!=null) {
			String saveFilename = dto.getQnaSaveFileName();
			String originalFilename = dto.getQnaOriginalFileName();
			
			b=fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다.'); history.back(); </script>");
				
			} catch (Exception e) {
				
			}
		}
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int qnaFileNum,
			HttpSession session,
			HttpServletResponse resp
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		Board dto=service.readFile(qnaFileNum);
		if(dto!=null)
			fileManager.doFileDelete(dto.getQnaSaveFileName(), pathname);
		
		Map<String, Object> model=new HashMap<String, Object>();
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("field", "qnaFileNum");
			map.put("qnaNum", qnaFileNum);
			service.deleteFile(map);
			
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}
		return model;
	}
}
