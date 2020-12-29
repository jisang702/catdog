package com.sp.catdog.admin.boardManage;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public List<Board> listArticle(Map<String, Object> map) throws Exception;
	public int articleCount(Map<String, Object> map);
	public List<Board> listBoardType();
}
