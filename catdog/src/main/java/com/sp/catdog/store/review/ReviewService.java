package com.sp.catdog.store.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public void insertReview(Review dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Review> listReview(Map<String, Object>map);
	public void deleteReview(int reNum) throws Exception;
	
}
