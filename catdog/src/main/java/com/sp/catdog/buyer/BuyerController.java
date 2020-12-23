package com.sp.catdog.buyer;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.MyUtil;

@Controller("buyer.buyerController")
@RequestMapping("/store/*")
public class BuyerController {

	@Autowired
	private BuyerService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="{gubun}/main")
	public String buyer(
		@PathVariable String gubun,
		@RequestParam(value="page", defaultValue = "1") int current_page,
		@RequestParam(defaultValue = "") String keyword,
		HttpServletRequest req,
		Model model
			)throws Exception{
		int rows=8;
		int total_page = 0;
		int dataCount= 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword =URLDecoder.decode(keyword,"utf-8");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
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
		
		List<Buyer> list = service.listBuyer(map);
		
		
		String cp = req.getContextPath();
		String listUrl=cp+"/store/"+gubun+"/main";
		String paging = myUtil.paging(current_page, total_page, listUrl);
	
		model.addAttribute("list",list);

		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		model.addAttribute("gubun",gubun);
		
		return ".store.storemain.main";
	}
}

