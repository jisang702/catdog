package com.sp.catdog.community.deal;

import java.util.List;
import java.util.Map;


public interface DealService {
	public void insertDeal(Deal dto) throws Exception;
	public void updateDeal(Deal dto) throws Exception;
	public void deleteDeal(int dealNum, String userId) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Deal> listDeal(Map<String, Object> map);
	
	public void updateHitCount(int dealNum) throws Exception;
	public Deal readBoard(int dealNum);
	
	public void updateDealState(Deal dto) throws Exception;
	public List<Deal> userDeal(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void updateReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public int answerReplyCount(int dealReplyType);
	public List<Reply> listAnswerReply(int dealReplyType);
}