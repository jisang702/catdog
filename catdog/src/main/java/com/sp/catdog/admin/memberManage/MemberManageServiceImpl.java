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
			throw e;
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
			throw e;
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
			throw e;
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
			throw e;
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
			throw e;
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
			throw e;
		}
		return result;	
	}

	@Override
	public Member readComMember(String userId) throws Exception {
		Member dto=null;
		try {
			dto=dao.selectOne("memberManage.readComMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public Member readVetMember(String userId) throws Exception {
		Member dto=null;
		try {
			dto=dao.selectOne("memberManage.readVetMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public Member readSellMember(String userId) throws Exception {
		Member dto=null;
		try {
			dto=dao.selectOne("memberManage.readSellMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public Member readMemberState(String userId) throws Exception {
		Member dto=null;
		try {
			dto=dao.selectOne("memberManage.readMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public List<Member> listMemberState(String userId) throws Exception {
		List<Member> list=null;
		try {
			list=dao.selectList("memberManage.listMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public void updateUserEnabled(Map<String, Object> map) throws Exception{
		try {
			dao.updateData("memberManage.updateUserEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.updateData("memberManage.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Analysis> listAgeSection() {
		List<Analysis> list=null;
		try {
			list=dao.selectList("memberManage.listAgeSection");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateUserOk(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateUserOk", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Analysis> listMemberSection(int userType) {
		List<Analysis> list=null;
		try {
			list=dao.selectList("memberManage.listMemberSection",userType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
