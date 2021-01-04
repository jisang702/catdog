
package com.sp.catdog.store.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("store.review.reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertReview(Review dto) throws Exception {
		try {
			dao.insertData("storereview.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		try {
			result=dao.insertData("storereview.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list =null;
		
		try {
			list= dao.selectList("storereview.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteReview(int reNum) throws Exception {
		try {
			dao.deleteData("storereview.delteReview",reNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e; 
		}
		
	}

	
}
