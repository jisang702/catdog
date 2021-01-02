package com.sp.catdog.admin.boardManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("boardManage.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Board> listArticle(Map<String, Object> map) throws Exception {
		List<Board> list=null;
		try {
			list=dao.selectList("boardManage.listArticle",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public int articleCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("boardManage.articleCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Board> listBoardType() {
		List<Board> list=null;
		try {
			list=dao.selectList("boardManage.listBoardType");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Board> listReply(Map<String, Object> map) throws Exception {
		List<Board> list=null;
		try {
			list=dao.selectList("boardManage.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("boardManage.replyCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteArticle(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("boardManage.deleteArticle", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
