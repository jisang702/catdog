package com.sp.catdog.community.photo;

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

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("photo.photoController")
@RequestMapping("/community/photo/*")
public class PhotoController {
	
	@Autowired
	private PhotoService service;

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
		String cp = req.getContextPath();
   	    
		int rows = 9; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        // 글 리스트
        List<Photo> list = service.listPhoto(map);

        // 리스트의 번호
        int listNum, n = 0;
        for(Photo dto : list) {
            listNum = dataCount - (offset + n);
            dto.setNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/community/photo/list";
        String articleUrl = cp+"/community/photo/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/community/photo/list?" + query;
        	articleUrl = cp+"/community/photo/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".community.photo.list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int photoNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}

		service.updateHitCount(photoNum);

		Photo dto = service.readPhoto(photoNum);
		if(dto==null)
			return "redirect:/community/photo/list?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("photonum", photoNum);

		Photo preReadDto = service.preReadBoard(map);
		Photo nextReadDto = service.nextReadBoard(map);
        
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".community.photo.article";
	}
	
	@RequestMapping("created")
	public String createdForm(
			Model model
			) throws Exception {
		model.addAttribute("mode","created");
		
		return ".community.photo.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			Photo dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"photo";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertPhoto(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/community/photo/list";
	}
}
