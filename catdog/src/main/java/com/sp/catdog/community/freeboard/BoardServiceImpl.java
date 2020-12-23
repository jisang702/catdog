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
		try {
			dao.insertData("freeboard.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {			
			dao.deleteData("freeboard.deleteBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int boardLikeCount(int freeNum) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.boardLikeCount", freeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int boardLikeUser(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.boardLikeUser", map);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateHitCount(int freeNum) throws Exception {
		try {
			dao.updateData("freeboard.updateHitCount", freeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Board readBoard(int freeNum) {
		Board dto=null;
		
		try {
			dto=dao.selectOne("freeboard.readBoard", freeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateBoard(Board dto) throws Exception {
		try {
			dao.updateData("freeboard.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBoard(int freeNum, String userId) throws Exception {
		try {
			Board dto=readBoard(freeNum);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			dao.deleteData("freeboard.deleteBoard", freeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("freeboard.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("freeboard.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateReply(Reply dto) throws Exception {
		try {
			dao.updateData("freeboard.updateReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("freeboard.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> listAnswerReply(int freeReplyType) {
		List<Reply> list=null;
		try {
			list=dao.selectList("freeboard.listAnswerReply", freeReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int answerReplyCount(int freeReplyType) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.answerReplyCount", freeReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("freeboard.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("freeboard.deleteReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int replyLikeCount(int freeReplyNum) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.replyLikeCount", freeReplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int replyLikeUser(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.replyLikeUser", map);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
