package com.sp.catdog.buyer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("buyer.buyService")
public class BuyerServiceImpl implements BuyerService{

	@Autowired
	private CommonDAO dao;
	

	@Override
	public List<Buyer> listBuyer(Map<String, Object> map) {
		List<Buyer> list = null;
		try {
			list=dao.selectList("buyer.listBuyer",map);
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		return list;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("buyer.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Buyer readBuyer(int prdNum) {
		Buyer dto =null;
		try {
			dto=dao.selectOne("buyer.readBuyer",prdNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public void prdHitCount(int prdNum) throws Exception {
		try {
			dao.updateData("buyer.prdHitCount",prdNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}


