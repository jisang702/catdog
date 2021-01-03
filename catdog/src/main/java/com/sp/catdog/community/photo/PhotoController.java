package com.sp.catdog.community.photo;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("photo.photoController")
@RequestMapping("/community/photo/*")
public class PhotoController {
	
	@Autowired
	private PhotoService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue = "news") String array,
			HttpServletRequest req,
			Model model
			) throws Exception {
		String cp = req.getContextPath();
   	    
		int rows = 9; 
		int total_page = 0;
		int dataCount = 0;
   	    
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("array", array);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        if(total_page < current_page) 
            current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        List<Photo> list = service.listPhoto(map);

        int listNum, n = 0;
        for(Photo dto : list) {
            listNum = dataCount - (offset + n);
            dto.setNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/community/photo/list";
        String articleUrl = cp+"/community/photo/article?page=" + current_page;
        
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
        model.addAttribute("array", array);
        
		return ".community.photo.list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int photoNum,
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

		service.updateHitCount(photoNum);

		Photo dto = service.readPhoto(photoNum);
		if(dto==null)
			return "redirect:/community/photo/list?"+query;
		
		List<Photo> list=service.listPhotoImg(photoNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("photoNum", photoNum);
		map.put("userId", info.getUserId());

		Photo preReadDto = service.preReadBoard(map);
		Photo nextReadDto = service.nextReadBoard(map);
		
		int photoLikeCount=service.photoLikeCount(photoNum);
		int photoLikeUser=service.photoLikeUser(map);
		int replyCount=service.replyCount(map);
        
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("photoLikeUser", photoLikeUser);
		model.addAttribute("photoLikeCount", photoLikeCount);
		model.addAttribute("replyCount", replyCount);

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
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int photoNum,
			@RequestParam String page,
			Model model
			) throws Exception {
		
		Photo dto=service.readPhoto(photoNum);
		if(dto==null) {
			return "redirect:/community/photo/list?page="+page;
		}
		
		List<Photo> list=service.listPhotoImg(photoNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		
		return ".community.photo.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Photo dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "photo";		
			
			dto.setUserId(info.getUserId());
			service.updatePhoto(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/photo/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(
			@RequestParam int photoNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam String type,
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
			service.deletePhoto(photoNum, pathname);
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("photoNum", photoNum);
			map.put("type", type);
			service.deletePhotoImg(map);
		} catch (Exception e) {
		}
		
		
		return "redirect:/community/photo/list?"+query;
	}
	
	@RequestMapping("deletePhotoImg")
	@ResponseBody
	public Map<String, Object> deletePhotoImg(
			@RequestParam int imgNum,
			@RequestParam String type,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"photo";
		String state="true";
		
		Photo dto=service.readPhotoImg(imgNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getPhotoImgSavename(), pathname);
		}
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("imgNum", imgNum);			
			map.put("type", type);
			service.deletePhotoImg(map);
		} catch (Exception e) {
			state="false";
		}

		Map<String, Object> model=new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "insertPhotoLike")
	@ResponseBody
	public Map<String, Object> insertPhotoLike(
			@RequestParam int photoNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int photoLikeCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("photoNum", photoNum);
		
		Photo dto=service.readPhoto(photoNum);
		
		try {
			if(dto.getUserId()!=info.getUserId()) {
				service.insertPhotoLike(map);
			}
		} catch (Exception e) {
			
		}
		
		photoLikeCount=service.photoLikeCount(photoNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("photoLikeCount", photoLikeCount);
		
		return model;
	}
	
	@RequestMapping("deletePhotoLike")
	@ResponseBody
	public Map<String, Object> deletePhotoLike(
			@RequestParam int photoNum,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("photoNum", photoNum);
		
		service.deletePhotoLike(map);
		
		int photoLikeCount=service.photoLikeCount(photoNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("photoLikeCount", photoLikeCount);
		
		return model;
	}
	
	@RequestMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", dto.getPhotoNum());
		int replyCount=service.replyCount(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyCount", replyCount);
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("listReply")
	public String listReply(
			@RequestParam int photoNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int total_page=0;
		int rows=5;
		

		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		
		int dataCount=service.replyCount(map);
		
		total_page=myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		
		List<Reply> listReply=service.listReply(map);
		
		for(Reply dto:listReply) {
			dto.setPhotoReplyContent(dto.getPhotoReplyContent().replaceAll("\n", "<br>"));
			
			Map<String, Object> userMap=new HashMap<String, Object>();
			userMap.put("userId", info.getUserId());
			userMap.put("photoReplyNum", dto.getPhotoReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("listReply", listReply);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("paging", paging);

		return "community/photo/listReply";
	}
	
	@RequestMapping("updateReply")
	@ResponseBody
	public String updateReply(
			@RequestParam int photoReplyNum,
			Reply dto,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.updateReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
		return "redirect:/community/photo/listReply";
	}
	
	@RequestMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(defaultValue = "0") int photoReplyType
			) {
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		int replyCount=service.replyCount(paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		map.put("replyCount", replyCount);
		
		
		return map;
	}
	
	@RequestMapping("insertReplyLike")
	@ResponseBody
	public Map<String, Object> insertReplyLike(
			@RequestParam int photoReplyNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("photoReplyNum", photoReplyNum);		
		
		try {
			service.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int replyLikeCount=service.replyLikeCount(photoReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
	
	@RequestMapping("deleteReplyLike")
	@ResponseBody
	public Map<String, Object> deleteReplyLike(
			@RequestParam int photoReplyNum,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("photoReplyNum", photoReplyNum);		
		
		try {
			service.deleteReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int replyLikeCount=service.replyLikeCount(photoReplyNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("replyLikeCount", replyLikeCount);
		
		return model;
	}
	
	@RequestMapping("listAnswerReply")
	public String listAnswerReply(
			@RequestParam int photoReplyType,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Reply> listAnswerReply=service.listAnswerReply(photoReplyType);
		for(Reply dto:listAnswerReply) {
			dto.setPhotoReplyContent(dto.getPhotoReplyContent().replaceAll("\n", "<br>"));

			Map<String, Object> userMap=new HashMap<>();
			userMap.put("userId", info.getUserId());
			userMap.put("photoReplyNum", dto.getPhotoReplyNum());
			dto.setLikeUser(service.replyLikeUser(userMap));
		}
		
		model.addAttribute("listAnswerReply", listAnswerReply);
		return "community/photo/listAnswerReply";
	}
	
}
