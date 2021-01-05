package com.sp.catdog.community.miss;

import java.util.List;
import java.util.Map;

import com.sp.catdog.community.freeboard.Reply;

public interface MissService {
	public void insertMiss(Miss dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Miss> listMiss(Map<String, Object> map);
	
	public void updateMiss(Miss dto, String pathname) throws Exception;
	public void deleteMiss(int missNum, String pathname) throws Exception;
	
	public void updateHitCount(int missNum) throws Exception;
	public Miss readMiss(int missNum);
	
	public Miss preReadMiss(Map<String, Object> map);
	public Miss nextReadMiss(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void updateReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
}