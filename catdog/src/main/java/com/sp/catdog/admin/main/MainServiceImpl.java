package com.sp.catdog.admin.main;

import java.util.List;

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
	public List<Main> newArticleList() {
		List<Main> list=null;
		try {
			list=dao.selectList("admin.newArticleList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public List<Main> newUserList() {
		List<Main> list=null;
		try {
			list=dao.selectList("admin.newUserList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public List<Main> newProductList() {
		List<Main> list=null;
		try {
			list=dao.selectList("admin.newProductList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public int questionCount() {
		int result=0;
		try {
			result=dao.selectOne("admin.questionCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Main> newQuestionList() {
		List<Main> list=null;
		try {
			list=dao.selectList("admin.newQuestionList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public List<Main> newNoticeList() {
		List<Main> list=null;
		try {
			list=dao.selectList("admin.newNoticeList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

}
