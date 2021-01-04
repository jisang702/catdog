package com.sp.catdog.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.catdog.common.dao.CommonDAO;
import com.sp.catdog.doctor.qna.QnA;


public class MypageImpl{
	@Autowired
	private CommonDAO dao;
	
	public List<QnA> listQnA(Map<String, Object> map) {
		List<QnA> list= null;
		
		try {
			list=dao.selectList("vetQna.listQnA", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
