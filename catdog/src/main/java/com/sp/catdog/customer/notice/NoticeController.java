package com.sp.catdog.customer.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@Controller("customer.noticeController")
@RequestMapping("/customer/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows=10; 
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		//다른 사람이 자료를 삭제해서 전체 페이지수가 변화된 경우
		if(total_page<current_page)
			current_page=total_page;
		
		// 1페이지인 경우 공지리스트 가져오기
		List<Notice> noticeList=null;
		if(current_page==1) {
			noticeList=service.listNoticeTop();
		}
		
		// 리스트에 출력할 데이터 가져오기
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		// 글 리스트
		List<Notice> list=service.listNotice(map);
		
		// listNum 설정
		Date endDate=new Date();
		long gap;
		int listNum, n=0;
		for(Notice dto:list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=sdf.parse(dto.getNoCreated());
			
			// 날짜 차이(시간) - 일자로 바꾸려면 *24
			gap=(endDate.getTime() - beginDate.getTime()) / (60*60*1000);
			dto.setGap(gap);
			
			dto.setNoCreated(dto.getNoCreated().substring(0,10));
			
			n++;
		}
		
		//ajax 페이징처리
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "customer/notice/list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		
		model.addAttribute("page", "1");
		model.addAttribute("mode", "created");
		return "customer/notice/created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Notice dto,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) { //관리자 여러 명일 경우 수정
			try {
				String root=session.getServletContext().getRealPath("/");
				String pathname= root+"uploads"+File.separator+"notice";
				
				dto.setUserId(info.getUserId());
				dto.setUserType(info.getUserType());
				
				service.insertNotice(dto, pathname);
				state="true";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(
			@RequestParam int noNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletResponse resp,
			Model model
			) throws Exception{
		
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		service.updateHitCount(noNum);
		
		Notice dto=service.readNotice(noNum);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		//이전 글, 다음 글
		Map<String, Object> map= new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("noNum", noNum);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		//파일
		List<Notice> listFile=service.listFile(noNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		
		return "customer/notice/article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int noNum,
			@RequestParam String page,
			HttpServletResponse resp,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Notice dto=service.readNotice(noNum);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(! info.getUserId().equals(dto.getUserId()) || info.getUserType() != dto.getUserType() ) { 
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		List<Notice> listFile=service.listFile(noNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		
		return "customer/notice/created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Notice dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals(dto.getUserId()) || info.getUserType() == dto.getUserType()) {
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "notice";
				
				dto.setUserId(info.getUserId());
				dto.setUserType(info.getUserType());
				service.updateNotice(dto, pathname);
				state="true";
				
			} catch (Exception e) {
				
			}
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int noNum,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserType()==0) {
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "notice";
				service.deleteNotice(noNum, pathname);
				state="true";
				
			} catch (Exception e) {
				
			}
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "download")
	public void download(
			@RequestParam int noFileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		Notice dto=service.readFile(noFileNum);
		if(dto!=null) {
			String saveFilename = dto.getNoSaveFileName();
			String originalFilename = dto.getNoOriginalFileName();
			
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
	@RequestMapping(value = "zipdownload")
	public void zipdownload(
			@RequestParam int noNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		List<Notice> listFile=service.listFile(noNum);
		if(listFile.size() > 0) {
			String []sources = new String[listFile.size()];
			String []originals = new String[listFile.size()];
			String zipFilename= noNum+".zip";
			
			for(int i=0; i<listFile.size(); i++) {
				sources[i] = pathname+ File.separator+ listFile.get(i).getNoSaveFileName();
				originals[i] = File.separator+ listFile.get(i).getNoOriginalFileName();
			}
			b=fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
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
			@RequestParam int noFileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"notice";
		
		Notice dto=service.readFile(noFileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getNoSaveFileName(), pathname);
		}
		
		Map<String, Object> model=new HashMap<>();
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("field", "noFileNum");   //여기 먼가 이상.. 둘 중 하나 filenum 이거나 nonum 확인해볼것
			map.put("noNum", noFileNum);
			service.deleteFile(map);
			
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}
		
		return model;
	}
}
