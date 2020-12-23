package com.sp.catdog.community.deal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("deal.dealService")
public class DealServiceImpl implements DealService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertDeal(Deal dto) throws Exception {
		try {
			dao.insertData("deal.insertDeal", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateDeal(Deal dto) throws Exception {
		try {
			dao.updateData("deal.updateDeal", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteDeal(int dealNum, String userId) throws Exception {
		try {
			Deal dto=readBoard(dealNum);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			dao.deleteData("deal.deleteDeal", dealNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("deal.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Deal> listDeal(Map<String, Object> map) {
		List<Deal> list=null;
		try {
			list=dao.selectList("deal.listDeal", map);					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void updateHitCount(int dealNum) throws Exception {
		try {
			dao.updateData("deal.updateHitCount", dealNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Deal readBoard(int dealNum) {
		Deal dto=null;
		try {
			dto=dao.selectOne("deal.readDeal", dealNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateDealState(Deal dto) throws Exception {
		try {
			dao.updateData("deal.updateDealState", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Deal> userDeal(Map<String, Object> map) {
		List<Deal> list=null;
		try {
			list=dao.selectList("deal.userDeal", map);					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}