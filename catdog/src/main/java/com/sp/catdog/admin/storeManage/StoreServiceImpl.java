package com.sp.catdog.admin.storeManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("storeManage.storeService")
public class StoreServiceImpl implements StoreService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int orderCount(String state) {
		int result=0;
		try {
			result=dao.selectOne("storeManage.orderCount",state);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int orderPriceSum(String state) {
		int result=0;
		try {
			result=dao.selectOne("storeManage.orderPriceSum",state);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int productCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("storeManage.productCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Store> listProduct(Map<String, Object> map) {
		List<Store> list=null;
		try {
			list=dao.selectList("storeManage.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
