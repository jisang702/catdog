package com.sp.catdog.doctor.video;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("video.videoService")
public class VideoServiceImpl implements VideoService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertVideo(Video dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setVidThumb(saveFilename);
			}
			dao.insertData("video.insertVideo", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Video> listVideo(Map<String, Object> map) {
		List<Video> list=null;
		try {
			list=dao.selectList("video.listVideo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Video readVideo(int vidNum) {
		Video dto=null;
		try {
			dto=dao.selectOne("video.readVideo", vidNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("video.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	@Override
	public void updateHitCount(int vidNum) throws Exception {
		try {
			
			dao.updateData("video.updateHitCount", vidNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Video preReadVideo(Map<String, Object> map) {
		Video dto=null;
		try {
			dto=dao.selectOne("video.preReadVideo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Video nextReadVideo(Map<String, Object> map) {
		Video dto=null;
		try {
			dto=dao.selectOne("video.nextReadVideo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateVideo(Video dto, String pathname) throws Exception {
		try {
			String saveFilename= fileManager.doFileUpload(dto.getUpload(), pathname);
		
			if(saveFilename !=null) {
				if(dto.getVidThumb().length()!=0) {
					fileManager.doFileDelete(dto.getVidThumb(), pathname);
				}
				dto.setVidThumb(saveFilename);
			}
			
			dao.updateData("video.updateVideo", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteVideo(int vidNum, String pathname, String userId) throws Exception {
		try {
			Video dto=readVideo(vidNum);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			if(dto.getVidThumb()!=null)
				fileManager.doFileDelete(dto.getVidThumb(), pathname);
			
			dao.deleteData("video.deleteVideo", vidNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertVideoLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("video.insertVideoLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int videoLikeCount(int vidNum) {
		int result=0;
		try {
			result=dao.selectOne("video.videoLikeCount", vidNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("video.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("video.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("video.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("video.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(int vidReplyType) {
		List<Reply> list=null;
		try {
			list=dao.selectList("video.listReplyAnswer", vidReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return list;
	}

	@Override
	public int replyAnswerCount(int vidReplyType) {
		int result=0;
		try {
			result=dao.selectOne("video.replyAnswerCount", vidReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("video.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();	
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap=null;
		try {
			countMap=dao.selectOne("video.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}

	
	
}
