package com.sp.catdog.community.freeboard;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Board> listBoard(Map<String, Object> map);
	
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeUser(Map<String, Object> map);
	public int boardLikeCount(int num);
	
	public void updateHitCount(int freeNum) throws Exception;
	public Board readBoard(int freeNum);
	
	public void updateBoard(Board dto) throws Exception;
	public void deleteBoard(int freeNum, String userId) throws Exception;

	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void updateReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listAnswerReply(int freeReplyType);
	public int answerReplyCount(int freeReplyType);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public void deleteReplyLike(Map<String, Object> map) throws Exception;
	public int replyLikeUser(Map<String, Object> map);
	public int replyLikeCount(int freeReplyNum);
	
}
