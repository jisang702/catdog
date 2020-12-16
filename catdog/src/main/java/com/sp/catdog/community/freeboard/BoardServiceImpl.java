package com.sp.catdog.community.freeboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("board.boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertBoard(Board dto) throws Exception {
		try {
			dao.insertData("freeboard.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		try {
			list=dao.selectList("freeboard.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardLikeCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHitCount(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Board readBoard(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(Board dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int freeNum, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
