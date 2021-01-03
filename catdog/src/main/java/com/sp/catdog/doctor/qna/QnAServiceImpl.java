package com.sp.catdog.doctor.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("doctor.qna.qnaService")
public class QnAServiceImpl implements QnAService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertQnA(QnA dto) throws Exception {
		try {
			dao.insertData("vetQna.insertQnA", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("vetQna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<QnA> listQnA(Map<String, Object> map) {
		List<QnA> list= null;
		
		try {
			list=dao.selectList("vetQna.listQnA", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public QnA readQuestion(int qnaNum) {
		QnA dto=null;
		try {
			dto=dao.selectOne("vetQna.readQuestion", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public QnA readAnswer(int qnaAnc) {
		QnA dto=null;
		try {
			dto=dao.selectOne("vetQna.readAnswer", qnaAnc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public QnA preReadQuestion(Map<String, Object> map) {
		QnA dto=null;
		try {
			dto=dao.selectOne("vetQna.preReadQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public QnA nextReadQuestion(Map<String, Object> map) {
		QnA dto=null;
		try {
			dto=dao.selectOne("vetQna.nextReadQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateQnA(QnA dto) throws Exception {
		try {
			dao.updateData("vetQna.updateQnA",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQuestion(int qnaNum) throws Exception {
		try {
			dao.deleteData("vetQna.deleteQuestion", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(int qnaNum) throws Exception {
		try {
			dao.deleteData("vetQna.deleteAnswer", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertCategory(QnA dto) throws Exception {
		try {
			dao.insertData("vetQna.insertCategory",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCategory(QnA dto) throws Exception {
		try {
			dao.updateData("vetQna.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("vetQna.deleteCategory",categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<QnA> listCategory() {
		List<QnA> list= null;
		try {
			list=dao.selectList("vetQna.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
