package com.sp.catdog.admin.boardManage;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public void deleteArticle(Map<String, Object> map) throws Exception;
	public List<Board> listArticle(Map<String, Object> map) throws Exception;
	public int articleCount(Map<String, Object> map);
	public List<Board> listBoardType();
	
	public List<Board> listReply(Map<String, Object> map) throws Exception;
	public int replyCount(Map<String, Object> map);
}
