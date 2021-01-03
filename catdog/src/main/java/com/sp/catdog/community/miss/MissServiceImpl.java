package com.sp.catdog.community.miss;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("miss.missService")
public class MissServiceImpl implements MissService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertMiss(Miss dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("miss.seq");
			dto.setMissNum(seq);
			
			dao.insertData("miss.insertMiss", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Miss> listMiss(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMiss(Miss dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMiss(int missNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHitCount(int missNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Miss readMiss(int missNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Miss preReadMiss(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Miss nextReadMiss(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
