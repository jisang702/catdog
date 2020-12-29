package com.sp.catdog.store.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public void insertReview(Review dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Review> listReview(Map<String, Object>map);
	public void reHitCount(int reNum) throws Exception;
	public void updateReview(Review dto, String pathname) throws Exception;
	public void deleteReview(int reNum, String pathname) throws Exception;
	
}
