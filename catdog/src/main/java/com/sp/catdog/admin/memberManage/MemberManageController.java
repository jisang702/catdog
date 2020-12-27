package com.sp.catdog.admin.memberManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.catdog.common.MyUtil;

@Controller("admin.memberManageController")
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "comMember") String group,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String userEnabled,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map= new HashMap<>();
		map.put("userEnabled", userEnabled);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		if(group.equals("comMember")) {
			dataCount=service.comDataCount(map);
		}else if(group.equals("vetMember")) {
			dataCount=service.vetDataCount(map);
		}else if(group.equals("sellMember")) {
			dataCount=service.sellDataCount(map);
		}
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page){
			current_page=total_page;
		}
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Member> list=null;
		if(group.equals("comMember")) {
			list=service.comList(map);
		}else if(group.equals("vetMember")) {
			list=service.vetList(map);
		}else if(group.equals("sellMember")) {
			list=service.sellList(map);
		} 
		
		int listNum,n=0;
		for(Member dto : list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/admin/memberManage/list";
		
		if(keyword.length()!=0) {
			query="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(userEnabled.length()!=0) {
			if(query.length()!=0)
				query=query+"&userEnabled="+userEnabled;
			else
				query="userEnabled="+userEnabled;
		}
		
		if(query.length()!=0) {
			listUrl=listUrl+"?"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("group", group);
		model.addAttribute("userEnabled", userEnabled);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("subMenu", 1);

		return ".admin4.admin.memberManage.list";
	}
	
	@RequestMapping(value = "detail")
	public String detailMember(
			@RequestParam(defaultValue = "1") int userType,
			@RequestParam String userId,
			Model model
			) throws Exception{
		
		Member dto=null;
		
		if(userType==1) {
			dto=service.readComMember(userId);
		}else if(userType==2) {
			dto=service.readVetMember(userId);
		}else if(userType==3) {
			dto=service.readSellMember(userId);
		}
		
		Member memberState=service.readMemberState(userId);
		List<Member> listState=service.listMemberState(userId);
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberState", memberState);
		model.addAttribute("listState", listState);
		
		return "admin/memberManage/detail";
	}
	
	@RequestMapping(value = "updateMemberState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMemberState(
			Member dto
			) throws Exception{

		String state="true";
		try {
			//회원 활성, 비활성 변경
			Map<String, Object> map = new HashMap<>();
			map.put("userId", dto.getUserId());
			if(dto.getStateCode() == 0) {
				map.put("userEnabled", 1);
			}else {
				map.put("userEnabled", 0);
			}
			service.updateUserEnabled(map);
			
			//회원 상태 변경 사항 저장
			service.insertMemberState(dto);

			
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
