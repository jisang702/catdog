package com.sp.catdog.store.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("store.qna.qnaService")
public class QnaServiceImpl implements QnaService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertQna(Qna dto) throws Exception {
		try {
			dao.insertData("storeqna.insertQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("storeqna.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list=dao.selectList("storeqna.listQna",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteQna(int qnaNum) throws Exception {
		try {
			dao.deleteData("storeqna.deleteQna", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
