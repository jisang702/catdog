package com.sp.catdog.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Mypage> listPoint(Map<String, Object> map) throws Exception {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.listPoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int pointCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.pointCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int pointSum(String userId) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.pointSum", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Mypage> selectList(Map<String, Object> map) throws Exception {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.pointSum", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
