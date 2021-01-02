package com.sp.catdog.store.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	public List<Qna> listQna(Map<String, Object>map);
	public void updateQna(Qna dto) throws Exception;
	public void deleteQna(int qnaNum) throws Exception;
	
	public Qna readQuestion(int qnaNum);
	public Qna readAnswer(int qnaParent);
	
	public Qna preReadQuestion(Map<String, Object> map);
	public Qna nextReadQuestion(Map<String, Object> map);
	

	public void insertCategory(Qna dto) throws Exception;
	public void updateCategory(Qna dto) throws Exception;
	public void deleteCategory(int qnaCategory) throws Exception;
	public List<Qna> listCategory();

}
