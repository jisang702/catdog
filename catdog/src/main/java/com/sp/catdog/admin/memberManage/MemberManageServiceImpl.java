package com.sp.catdog.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("memberManage.memberManageService")
public class MemberManageServiceImpl implements MemberManageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Member> comList(Map<String, Object> map) throws Exception {
		List<Member> list=null;
		try {
			list=dao.selectList("memberManage.comList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Member> vetList(Map<String, Object> map) throws Exception {
		List<Member> list=null;
		try {
			list=dao.selectList("memberManage.vetList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<Member> sellList(Map<String, Object> map) throws Exception {
		List<Member> list=null;
		try {
			list=dao.selectList("memberManage.sellList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public int comDataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("memberManage.comDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int vetDataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("memberManage.vetDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int sellDataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("memberManage.sellDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	
	}

}
