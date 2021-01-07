package com.sp.catdog.buyer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("ord.ordService")
public class OrdServiceImpl implements OrdService{
	@Autowired
	private CommonDAO dao;
	@Override
	public List<Ord> listOrd(Map<String, Object> map) {
		List<Ord> list = null;
		try {
			list=dao.selectOne("ord.listOrd",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertOrd(Ord dto) throws Exception {
			try {
				int orderNum=dao.selectOne("ord.seq");
				dto.setOrderNum(orderNum);
				
				dao.insertData("ord.insertOrd",dto);
				
				if(dto.getLoTel1().length()!=0 && dto.getLoTel2().length()!=0 && dto.getLoTel3().length()!=0) {
					dto.setLoTel(dto.getLoTel1()+"-"+dto.getLoTel2()+"-"+dto.getLoTel3());
				}
				
				dao.insertData("ord.insertshipLoca",dto);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
	}

}
