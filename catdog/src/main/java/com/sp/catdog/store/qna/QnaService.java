package com.sp.catdog.store.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object>map);
	public void updateHitCount(int qnaNum) throws Exception;
	public void updateQna(Qna dto, String pathname) throws Exception;
	public void deleteQna(int qnaNum, String pathname) throws Exception;
	public List<Qna> listFile(int qnaNum);
	
}
