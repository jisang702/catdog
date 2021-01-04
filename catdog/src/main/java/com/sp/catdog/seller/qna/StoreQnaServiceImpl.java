package com.sp.catdog.seller.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("seller.StoreQnaService")
public class StoreQnaServiceImpl implements StoreQnaService {
	@Autowired
	private CommonDAO dao;


	@Override
	public void insertAnswer(StoreQna dto, String pathname) throws Exception {
		try {
			dao.insertData("StoreSellerQna.prdQnainsertAnswer", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCountAnswer(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("StoreSellerQna.prdQnadataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<StoreQna> listBoard(Map<String, Object> map) {
		List<StoreQna> list = null;
		try {
			list = dao.selectList("StoreSellerQna.prdQnalist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public StoreQna readQuestion(int num) {
		StoreQna dto = null;
		try {
			dto = dao.selectOne("StoreSellerQna.readQuestion", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public StoreQna readAnswer(int parent) {
		StoreQna dto = null;
		try {
			dto = dao.selectOne("StoreSellerQna.readAnswer", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public StoreQna preReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreQna nextReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAnswer(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StoreQna> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
