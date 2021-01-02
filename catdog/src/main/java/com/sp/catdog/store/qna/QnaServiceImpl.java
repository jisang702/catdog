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
			result=dao.insertData("qna.dataCount",map);
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
	public void updateQna(Qna dto) throws Exception {
		try {
			dao.updateData("qna.updateQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQna(int qnaNum) throws Exception {
		try {
			dao.deleteData("qna.updateQna", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	@Override
	public Qna readQuestion(int qnaNum) {
		Qna dto =null;
		try {
			dto= dao.selectOne("qna.readQuestion",qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Qna readAnswer(int qnaParent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Qna> listCategory() {
		List<Qna> list =null;
		try {
			list=dao.selectList("qna.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Qna preReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna nextReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCategory(Qna dto) throws Exception {
		try {
			dao.insertData("qna.insertCategory",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e; 
		}
		
	}

	@Override
	public void updateCategory(Qna dto) throws Exception {
		try {
			dao.updateData("qna.updateCategory",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteCategory(int qnaCategory) throws Exception {
		try {
			dao.deleteData("qna.updateCategory",qnaCategory);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
