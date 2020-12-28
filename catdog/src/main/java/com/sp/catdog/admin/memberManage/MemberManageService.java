package com.sp.catdog.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	
	public Member readComMember(String userId) throws Exception;
	public Member readVetMember(String userId) throws Exception;
	public Member readSellMember(String userId) throws Exception;
	
	public List<Member> comList(Map<String, Object> map) throws Exception;
	public List<Member> vetList(Map<String, Object> map) throws Exception;
	public List<Member> sellList(Map<String, Object> map) throws Exception;	
	
	public int comDataCount(Map<String, Object> map) throws Exception;
	public int vetDataCount(Map<String, Object> map) throws Exception;
	public int sellDataCount(Map<String, Object> map) throws Exception;
	
	public void updateUserEnabled(Map<String, Object> map) throws Exception;
	
	//memberState
	public void insertMemberState(Member dto) throws Exception;
	public Member readMemberState(String userId) throws Exception;
	public List<Member> listMemberState(String userId) throws Exception;
	
	//차트
	public List<Analysis> listAgeSection();
}
