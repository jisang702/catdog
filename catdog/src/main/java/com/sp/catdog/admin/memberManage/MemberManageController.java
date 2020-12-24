package com.sp.catdog.admin.memberManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.memberManageController")
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	
	@RequestMapping(value = "main")
	public String list() throws Exception{
		return ".admin.memberManage.main";
	}
}
