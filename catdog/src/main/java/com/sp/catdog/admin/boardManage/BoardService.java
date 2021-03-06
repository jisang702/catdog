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
	
	public List<Board> listReplyReport(Map<String, Object> map) throws Exception;
	public int replyReportCount(Map<String, Object> map);
	public Board readReplyReport(Map<String, Object> map) throws Exception;
	
	//차트
	public List<Analysis> listFreeSection();
	public List<Analysis> listMissSection();
	public List<Analysis> listDealSection();
	public List<Analysis> listPhotoSection();
	public List<Analysis> listVideoSection();
	
	public List<Analysis> boardAgeSection();
}
