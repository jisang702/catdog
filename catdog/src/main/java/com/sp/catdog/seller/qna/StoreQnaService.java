package com.sp.catdog.seller.qna;

import java.util.List;
import java.util.Map;

public interface StoreQnaService {
	public void insertAnswer(StoreQna dto, String pathname) throws Exception;
	public int dataCountAnswer(Map<String, Object> map);
	public List<StoreQna> listBoard(Map<String, Object> map);
	
	public StoreQna readQuestion(int num);
	public StoreQna readAnswer(int parent);
	
	public StoreQna preReadQuestion(Map<String, Object> map);
	public StoreQna nextReadQuestion(Map<String, Object> map);

	public void deleteAnswer(int num) throws Exception;

	List<StoreQna> listCategory();
	
}
