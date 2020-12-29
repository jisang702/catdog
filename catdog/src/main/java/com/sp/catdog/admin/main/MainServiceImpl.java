package com.sp.catdog.admin.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("admin.mainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int totalUserCount() {
		int result=0;
		try {
			result=dao.selectOne("admin.totalUserCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int todayNewUserCount() {
		int result=0;
		try {
			result=dao.selectOne("admin.todayNewUserCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertVisitCount(Main dto) throws Exception {
		try {
			dao.insertData("admin.insertVisitCount", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
