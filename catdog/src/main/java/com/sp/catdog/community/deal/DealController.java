package com.sp.catdog.community.deal;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.catdog.common.MyUtil;
import com.sp.catdog.common.TimeUtil;
import com.sp.catdog.member.SessionInfo;

@Controller("deal.dealController")
@RequestMapping("/community/deal/*")
public class DealController {
	
	@Autowired
	private DealService service;
	
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private TimeUtil timeUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(value="rows", defaultValue="9") int rows,
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

		List<Deal> list = service.listDeal(map);
		List<String> imagelist;
		
		int num, n = 0;
        for(Deal dto : list) {
        	num = dataCount - (offset + n);
            dto.setNum(num);
            imagelist=myUtil.getImgSrc(dto.getDealContent());
            if(imagelist.size()>0) {
            	dto.setImgFileName(imagelist.get(0));
            }
            
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date writeday=sdf.parse(dto.getDealCreated());
            
            dto.setDealCreated(timeUtil.formatTimeString(writeday));
            
            n++;
        }            
		
		String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/community/deal/list";
		String articleUrl = cp + "/community/deal/article?page=" + current_page;

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
		
		return ".community.deal.list";
	}

	@RequestMapping("article")
	public String article(
			@RequestParam int dealNum,
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
		
		Deal dto=service.readBoard(dealNum);
		if(dto==null)
			return "redirect:/community/deal/list?"+query;
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", dto.getUserId());
		
		List<Deal> sublist=service.userDeal(map);
		
		for(Deal subdto : sublist) {
			List<String> imagelist=myUtil.getImgSrc(subdto.getDealContent());
		       if(imagelist.size()>0) {
		    	   subdto.setImgFileName(imagelist.get(0));
		       }
		}
        
        service.updateHitCount(dealNum);
        
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date writeday=sdf.parse(dto.getDealCreated());
        
        dto.setDealCreated(timeUtil.formatTimeString(writeday));
		
		model.addAttribute("sublist", sublist);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".community.deal.article";
	}
	
	@RequestMapping("created")
	public String createdForm(
			Model model
			) throws Exception {
		model.addAttribute("mode", "created");
		
		return ".community.deal.created";
	}
	
	@RequestMapping(value = "created" , method = RequestMethod.POST)
	public String createdSubmit(
			Deal dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			dto.setUserNick(info.getUserNick());
			service.insertDeal(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/deal/list";
	}
	
	@RequestMapping("update")
	public String updateForm(
			@RequestParam int dealNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Deal dto=service.readBoard(dealNum);
		
		if(dto==null) {
			return "redirect:/community/deal/list?page="+page;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/community/deal/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community.deal.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Deal dto,
			@RequestParam String page
			) throws Exception {
		try {
			service.updateDeal(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/deal/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(
			@RequestParam int dealNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.deleteDeal(dealNum, info.getUserId());
		
		return "redirect:/community/deal/list?"+query;
	}
	
	@RequestMapping("updateDealState")
	@ResponseBody
	public String updateDealState(
			@RequestParam int dealNum,
			@RequestParam String page,
			Deal dto
			) throws Exception {
		try {
			service.updateDealState(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/deal/article?"+page+"&dealNum="+dealNum;
	}
	
}
