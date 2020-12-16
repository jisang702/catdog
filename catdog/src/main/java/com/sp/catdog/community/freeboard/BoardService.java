package com.sp.catdog.community.freeboard;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Board> listBoard(Map<String, Object> map);
	
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(int num);
	
	public void updateHitCount(int boardNum) throws Exception;
	public Board readBoard(int boardNum);
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object> map);
	
	public void updateBoard(Board dto) throws Exception;
	public void deleteBoard(int freeNum, String userId) throws Exception;

}
