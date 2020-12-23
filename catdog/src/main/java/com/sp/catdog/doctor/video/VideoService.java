package com.sp.catdog.doctor.video;

import java.util.List;
import java.util.Map;

public interface VideoService {
	public void insertVideo(Video dto, String pathname) throws Exception;
	public List<Video> listVideo(Map<String, Object> map);
	public Video readVideo(int vidNum);
	public int dataCount(Map<String, Object> map);
	public void updateHitCount(int vidNum) throws Exception;
	public Video preReadVideo(Map<String, Object> map);
	public Video nextReadVideo(Map<String, Object> map);
	public void updateVideo(Video dto, String pathname) throws Exception;
	public void deleteVideo(int vidNum, String pathname, String userId) throws Exception;
	
	public void insertVideoLike(Map<String, Object> map) throws Exception;
	public int videoLikeCount(int vidNum);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int vidReplyType);
	public int replyAnswerCount(int vidReplyType);

	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);

}
