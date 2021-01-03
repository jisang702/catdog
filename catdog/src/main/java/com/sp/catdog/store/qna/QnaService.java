package com.sp.catdog.store.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	public List<Qna> listQna(Map<String, Object>map);

	public void deleteQna(int qnaNum) throws Exception;
}
