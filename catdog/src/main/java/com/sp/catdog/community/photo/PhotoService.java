package com.sp.catdog.community.photo;

import java.util.List;
import java.util.Map;


public interface PhotoService {
	public void insertPhoto(Photo dto, String pathname) throws Exception;
	public void insertImage(Photo dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Photo> listPhoto(Map<String, Object> map);
	
	public void updatePhoto(Photo dto, String pathname) throws Exception;
	public void deletePhoto(int photoNum, String pathname) throws Exception;
	
	public void insertPhotoLike(Map<String, Object> map) throws Exception;
	public void deletePhotoLike(Map<String, Object> map) throws Exception;
	public int photoLikeUser(Map<String, Object> map);
	public int photoLikeCount(int photoNum);
	
	public void updateHitCount(int photoNum) throws Exception;
	public Photo readPhoto(int photoNum);
	
	public List<Photo> listPhotoImg(int photoNum);
	public Photo readPhotoImg(int imgNum);
	public void deletePhotoImg(Map<String, Object> map) throws Exception;
	
	public Photo preReadBoard(Map<String, Object> map);
	public Photo nextReadBoard(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void updateReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listAnswerReply(int photoReplyType);
	public int answerReplyCount(int photoReplyType);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public void deleteReplyLike(Map<String, Object> map) throws Exception;
	public int replyLikeUser(Map<String, Object> map);
	public int replyLikeCount(int photoReplyNum);
}
