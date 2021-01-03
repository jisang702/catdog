package com.sp.catdog.doctor.news;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("doctor.news.newsController")
@RequestMapping("/doctor/news/*")
public class NewsController {
	@Autowired
	private NewsService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows=10;
		int total_page=0;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword= URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		List<News> newsList = null;
		if(current_page==1) {
			newsList=service.listNewsTop();
		}
			
		int offset = (current_page-1)* rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<News> list = service.listNews(map);
		
		Date endDate = new Date();
		long gap;
		int listNum, n =0;
		for(News dto:list) {
			listNum= dataCount - (offset + n );
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate  = formatter.parse(dto.getNewsCreated());
				
			//날짜차이(시간)
			gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);	
			dto.setGap(gap);
			
			dto.setNewsCreated(dto.getNewsCreated().substring(0, 10));
			
			n++;
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/doctor/news/list";
		String articleUrl = cp+"/doctor/news/article?page=" +current_page;
		if(keyword.length()!=0) {
        	query = "condition=" + condition + 
        			"&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
		
		if(query.length()!=0) {
			listUrl = cp+"/doctor/news/list? " +query;
			articleUrl = cp+"/doctor/news/article?page=" +current_page +"&"+query;
		}
		
		String paging= myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", total_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".doctor.news.list";
		
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(Model model, HttpSession session)throws Exception {
			
		model.addAttribute("mode", "created");
	
		return ".doctor.news.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createSubmit(News dto, HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname=root +"uploads"+File.separator+"news";
				
				dto.setUserId(info.getUserId());
				service.insertNews(dto, pathname);		
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		return "redirect:/doctor/news/list";
	}
	
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int newsNum,
			@RequestParam String page,
			@RequestParam (defaultValue = "all") String condition,
			@RequestParam (defaultValue = "") String keyword,
			Model model)throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(newsNum);
		
		News dto = service.readNews(newsNum);
		if(dto==null) {
			return "redirect:/doctor/news/list?"+query;
		}
		
		dto.setNewsContent(dto.getNewsContent().replaceAll("\n", "<br>"));
		
		//이전글, 다음글
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("newsNum", newsNum);
		
		News preReadDto=service.preReadNews(map);
		News nextReadDto=service.nextReadNews(map);
		
		//파일
		List<News> listFile = service.listFile(newsNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".doctor.news.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updataForm(
					@RequestParam int newsNum,
					@RequestParam String page,
					HttpSession session,
					Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		News dto=service.readNews(newsNum);
		if( dto==null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/doctor/news/list?page="+page;
		}
		
		List<News> listFile=service.listFile(newsNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".doctor.news.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(News dto, 
								@RequestParam String page,
								HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if( dto==null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/doctor/news/list?page="+page;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "news";		
			
			dto.setUserId(info.getUserId());
			service.updateNews(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/doctor/news/list?page="+page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(
					@RequestParam int newsNum,
					@RequestParam String page,
					@RequestParam(defaultValue="all") String condition,
					@RequestParam(defaultValue="") String keyword,
					HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
	
		
		keyword= URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		News dto=service.readNews(newsNum);
		if( dto==null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/doctor/news/list?page="+page;
		}
		
		try {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root +File.separator+"uploads"+File.separator+"news";
			
			service.deleteNews(newsNum, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/doctor/news/list?"+query;
	}
	
	
	@RequestMapping(value="download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "news";

		boolean b = false;
		
		News dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	
	@RequestMapping(value="zipdownload")
	public void zipdownload(
			@RequestParam int newsNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;
		
		List<News> listFile = service.listFile(newsNum);
		if(listFile.size()>0) {
			String []sources = new String[listFile.size()];//압축할때사용
			String []originals = new String[listFile.size()];//압축할때 사용..
			String zipFilename = newsNum+".zip";//압축명
			
			for(int idx = 0; idx<listFile.size(); idx++) {
				sources[idx] = pathname+File.separator+listFile.get(idx).getSaveFilename();//파일저장 경로에 하나씩 가져와서 소스와 오리지널에 
				originals[idx] = File.separator+listFile.get(idx).getOriginalFilename();//오리지널은 디비에 저장된 명이 아니므로 세퍼레이트 써야하고,,
			}
			
			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);//서버저장명, 클라이언트가 올린명, 집파일이름, 
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value = "deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
							@RequestParam int fileNum,
							HttpSession session) throws Exception {
		String root =session.getServletContext().getRealPath("/");
		String pathname= root+ "uploads" + File.separator + "news";
		
		News dto=service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "fileNum");
		map.put("newsNum", fileNum);
		service.deleteFile(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
}