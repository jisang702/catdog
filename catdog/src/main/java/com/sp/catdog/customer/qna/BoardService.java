package com.sp.catdog.customer.qna;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	public List<Board> listBoard(Map<String, Object> map);
	
	public Board readQuestion(int qnaNum);
	public Board readAnswer(int qnaParent);
	
	public Board preReadQuestion(Map<String, Object> map);
	public Board nextReadQuestion(Map<String, Object> map);
	
	public void updateBoard(Board dto, String pathname) throws Exception;
	
	public void deleteQuestion(int qnaNum, String pathname) throws Exception;
	public void deleteAnswer(int qnaNum, String pathname) throws Exception;
	
	public void insertCategory(Board dto) throws Exception;
	public void updateCategory(Board dto) throws Exception;
	public void deleteCategory(int qnaCategoryNum) throws Exception;
	public List<Board> listCategory();
	
	public void insertFile(Board dto) throws Exception;
	public List<Board> listFile(int qnaNum);
	public Board readFile(int qnaFileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
