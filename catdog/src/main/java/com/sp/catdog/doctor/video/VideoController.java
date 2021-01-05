package com.sp.catdog.doctor.video;

import java.io.File;
import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.MyUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("video.videoController")
@RequestMapping("/doctor/video/*")
public class VideoController {
	@Autowired
	private VideoService service; 
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model) throws Exception {
		String cp=req.getContextPath();
		
		int rows= 6;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Video>list=service.listVideo(map);
		
		int listNum, n=0;
		for(Video dto:list) {
			listNum=dataCount-(offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/doctor/video/list";
		String articleUrl=cp+"/doctor/video/article?page="+current_page;
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}

		if(query.length()!=0) {
			listUrl= cp+"/doctor/video/list?"+query;
			articleUrl= cp+"/doctor/video/article?page="+current_page + "&"+ query;
			
		}
		String paging =myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword",keyword);
		
		return ".doctor.video.list";
	}
	
	@GetMapping("created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".doctor.video.created";
	}
	
	@PostMapping("created")
	public String createdSubmit(Video dto, HttpSession session)throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"doctor"+File.separator+"video";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertVideo(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/doctor/video/list";
	}
	
	@RequestMapping(value = "article")
	public String article(@RequestParam int vidNum,
							@RequestParam(defaultValue =  "") String page,
							@RequestParam(defaultValue = "all")String condition,
							@RequestParam(defaultValue =  "")String keyword,
							Model model) throws Exception {
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(vidNum);
		Video dto= service.readVideo(vidNum);
		
		if(dto== null) 
			return "redirect:/doctor/video/list?"+query;
			
		dto.setVidContent(dto.getVidContent().replaceAll("\n", "<br>"));
		
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("vidNum", vidNum);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		Video preReadVideo = service.preReadVideo(map);
		Video nextReadVideo = service.nextReadVideo(map);
		
		model.addAttribute("dto",dto);
		model.addAttribute("preReadVideo", preReadVideo);
		model.addAttribute("nextReadVideo", nextReadVideo);
		
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		
		return ".doctor.video.article";
	}
	
	@RequestMapping(value ="update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int vidNum,
								@RequestParam String page,
								HttpSession session,
								Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Video dto=service.readVideo(vidNum);
		if(dto == null)
			return "redirect:/doctor/video/page="+page;
		
		if(! dto.getUserId().equals(info.getUserId())) {
			return "redirect:/doctor/video/page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".doctor.video.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Video dto,
								@RequestParam String page,
								HttpSession session) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"doctor"+File.separator+"video";
		
		try {
			service.updateVideo(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/doctor/video/article?vidNum="+dto.getVidNum()+"&page="+page;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam int vidNum,
							@RequestParam String page,
							@RequestParam(defaultValue = "all") String condition,
							@RequestParam(defaultValue = "")String keyword,
							HttpSession session) throws Exception{
		
		keyword= URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"doctor"+File.separator+"video";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			service.deleteVideo(vidNum, pathname, info.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/doctor/video/list?"+query;
	}
	
	//게시글 좋아요 추가
	@RequestMapping(value = "insertVideoLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertVideoLike(@RequestParam int vidNum, 
											HttpSession session) {
		String state="true";
		int videoLikeCount=0;
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("vidNum", vidNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			service.insertVideoLike(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		videoLikeCount=service.videoLikeCount(vidNum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("videoLikeCount", videoLikeCount);
		
		return model;
	}
	
	// 댓글 리스트
	@RequestMapping(value = "listReply")
	public String listReply(
						@RequestParam int vidNum,
						@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
						Model model) throws Exception{
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("vidNum", vidNum);
		
		dataCount=service.replyCount(map);
		total_page= myUtil.pageCount(rows, dataCount);
		if(current_page>total_page);
			current_page=total_page;
			
		int offset = (current_page-1) *rows;
		if(offset <0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		List<Reply> listReply=service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setVidReplyContent(dto.getVidReplyContent().replaceAll("\n",  "<br>"));
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply",listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
	
		return "doctor/video/listReply";
	}
	
	//댓글 및 답글 등록
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model =new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	//댓글 및 댓글의 답글 삭제 
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) throws Exception {
		String state="true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	//댓글의답글 리스트
	@RequestMapping(value="listReplyAnswer")
	public String listReplyAnswer(@RequestParam int vidReplyType, Model model) throws Exception {
		
		List<Reply> listReplyAnswer=service.listReplyAnswer(vidReplyType);
		for(Reply dto: listReplyAnswer) {
			dto.setVidReplyContent(dto.getVidReplyContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("listReplyAnswer", listReplyAnswer);
		
		return "doctor/video/listReplyAnswer";
	}
	
	//댓글의 답글 개수
	@RequestMapping(value="replyAnswerCount")
	@ResponseBody
	public Map<String, Object> replyAnswerCount(@RequestParam(value = "vidReplyType")int vidReplyType) {
		
		int count= service.replyAnswerCount(vidReplyType);
		
		Map<String, Object> model=new HashMap<>();
		model.put("count", count);
		return model;
	}
	
	//댓글의 좋아요 추가
	@RequestMapping(value = "insertReplyLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReplyLike(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		
	
		String state="true";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> model= new HashMap<>();
		
		try {
			paramMap.put("userId", info.getUserId());
			service.insertReplyLike(paramMap);
		} catch (Exception e) {
			state="false";
		}
	
		Map<String, Object> countMap=service.replyLikeCount(paramMap);
		
		int likeCount=((BigDecimal)countMap.get("LIKECOUNT")).intValue();
		
		model.put("likeCount", likeCount);
		model.put("state",state);
		return model;
	
	}
	
	//댓글의 좋아요 개수
	@RequestMapping(value = "countReplyLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countReplyLike(@RequestParam Map<String, Object> paramMap,HttpSession session) {
		Map<String, Object> countMap =  service.replyLikeCount(paramMap);
		
		int likeCount=((BigDecimal)countMap.get("LIKECOUNT")).intValue();
		
		Map<String, Object> model=new HashMap<>();
		model.put("likeCount", likeCount);
		
		return model;
	}
	
}
