package com.sp.catdog.commu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("commu.commuService")
public class CommuServiceImpl implements CommuService{

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Commu> listCommu(Map<String, Object> map) {
		List<Commu> list=null;
		try {
			list=dao.selectList("commu.listCommu",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Commu> listVideo(Map<String, Object> map) {
		List<Commu> list=null;
		try {
			list=dao.selectList("commu.listVideo",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
