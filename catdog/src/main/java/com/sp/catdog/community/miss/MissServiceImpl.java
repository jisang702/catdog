package com.sp.catdog.community.miss;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("miss.missService")
public class MissServiceImpl implements MissService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertMiss(Miss dto, String pathname) throws Exception {
		try {
			if(dto.getMissWhere1().length()!=0 && dto.getMissWhere2().length()!=0) {
				dto.setMissWhere(dto.getMissWhere1()+"/"+dto.getMissWhere2());
			}
			
			if(dto.getYear().length()!=0 && dto.getMonth().length()!=0 && dto.getDay().length()!=0) {
				dto.setMissWhen(dto.getYear()+"/"+dto.getMonth()+"/"+dto.getDay());
			}
			
			int seq=dao.selectOne("miss.seq");
			dto.setMissNum(seq);

			dao.insertData("miss.insertMiss", dto);
			
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setPetImg(saveFilename);

				dao.insertData("miss.insertMissPet", dto);
			}
			
			dao.insertData("miss.insertPoint", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("miss.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public List<Miss> listMiss(Map<String, Object> map) {
		List<Miss> list=null;
		try {
			list=dao.selectList("miss.listMiss", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateMiss(Miss dto, String pathname) throws Exception {
		try {
			if(dto.getMissWhere1().length()!=0 && dto.getMissWhere2().length()!=0) {
				dto.setMissWhere(dto.getMissWhere1()+"/"+dto.getMissWhere2());
			}
			
			if(dto.getYear().length()!=0 && dto.getMonth().length()!=0 && dto.getDay().length()!=0) {
				dto.setMissWhen(dto.getYear()+"/"+dto.getMonth()+"/"+dto.getDay());
			}

			dao.updateData("miss.updateMiss", dto);
			
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setPetImg(saveFilename);

				dao.updateData("miss.updateMissPet", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMiss(int missNum, String pathname) throws Exception {
		try {
			dao.deleteData("miss.deleteMiss", missNum);
			dao.deleteData("miss.deleteMissPet", missNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateHitCount(int missNum) throws Exception {
		try {
			dao.updateData("miss.updateHitCount", missNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Miss readMiss(int missNum) {
		Miss dto=null;
		try {
			dto=dao.selectOne("miss.readMiss", missNum);
			
			if(dto!=null) {
				if(dto.getMissWhere()!=null) {
					String [] s=dto.getMissWhere().split("/");
					dto.setMissWhere1(s[0]);
					dto.setMissWhere2(s[1]);
				}

				if(dto.getMissWhen()!=null) {
					String [] s=dto.getMissWhen().split("-");
					dto.setYear(s[0]);
					dto.setMonth(s[1]);
					dto.setDay(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Miss preReadMiss(Map<String, Object> map) {
		Miss dto=null;
		try {
			dto=dao.selectOne("miss.preReadMiss", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Miss nextReadMiss(Map<String, Object> map) {
		Miss dto=null;
		try {
			dto=dao.selectOne("miss.nextReadMiss", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("miss.insertReply", dto);
			dao.insertData("miss.insertReplyPoint", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("miss.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("miss.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateReply(Reply dto) throws Exception {
		try {
			dao.updateData("miss.updateReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("miss.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> listAnswerReply(int missReplyType) {
		List<Reply> list=null;
		try {
			list=dao.selectList("miss.listAnswerReply", missReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int answerReplyCount(int missReplyType) {
		int result=0;
		try {
			result=dao.selectOne("miss.answerReplyCount", missReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int replyLikeUser(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("miss.replyLikeUser", map);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int replyLikeCount(int missReplyNum) {
		int result=0;
		try {
			result=dao.selectOne("miss.replyLikeCount", missReplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("miss.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("miss.deleteReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
