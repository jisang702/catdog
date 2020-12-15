package com.sp.catdog.customer.notice;

import java.io.File;
import java.net.URLDecoder;
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
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
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
}
