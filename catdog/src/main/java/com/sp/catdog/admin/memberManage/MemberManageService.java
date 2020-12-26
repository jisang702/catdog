package com.sp.catdog.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	
	public List<Member> comList(Map<String, Object> map) throws Exception;
	public List<Member> vetList(Map<String, Object> map) throws Exception;
	public List<Member> sellList(Map<String, Object> map) throws Exception;
	
	public int comDataCount(Map<String, Object> map) throws Exception;
	public int vetDataCount(Map<String, Object> map) throws Exception;
	public int sellDataCount(Map<String, Object> map) throws Exception;
	
}
