package com.sp.catdog.doctor.qna;

import java.util.List;
import java.util.Map;

public interface QnAService {
	public void insertQnA(QnA dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	public List<QnA> listQnA(Map<String, Object> map);
	
	public QnA readQuestion(int qnaNum);
	public QnA readAnswer(int qnaAnc);
	
	public QnA preReadQuestion(Map<String, Object> map);
	public QnA nextReadQuestion(Map<String, Object> map);
	
	public void updateQnA(QnA dto) throws Exception;
	
	public void deleteQuestion(int qnaNum) throws Exception;
	public void deleteAnswer(int qnaNum) throws Exception;
	
	public void insertCategory(QnA dto) throws Exception;
	public void updateCategory(QnA dto) throws Exception;
	public void deleteCategory(int categoryNum) throws Exception;
	public List<QnA> listCategory();
}
