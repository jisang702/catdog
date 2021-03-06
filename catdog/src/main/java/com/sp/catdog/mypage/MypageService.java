package com.sp.catdog.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public List<Mypage> listPoint(Map<String, Object> map) throws Exception;
	public int pointCount(Map<String, Object> map) throws Exception;
	public int pointSum(String userId) throws Exception;

	public List<Mypage> selectList(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public void insertPet(Mypage dto, String pathname) throws Exception;
	public List<Mypage> petList(Map<String, Object> map) throws Exception;
	public Mypage readPet(int petNum) throws Exception;
	
	public List<Mypage> listQna(String userId);
	public int QnaCount(String userId);
}
