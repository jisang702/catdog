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
	public void insertQna(Qna dto, String pathname) throws Exception {
		try {
			dao.insertData("qna.insertQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("qna.insertQna",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list=dao.selectList("qna.listQna",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateHitCount(int qnaNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateQna(Qna dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQna(int qnaNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Qna> listFile(int qnaNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
