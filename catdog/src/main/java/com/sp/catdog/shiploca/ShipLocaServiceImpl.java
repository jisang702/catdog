package com.sp.catdog.shiploca;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("shipLoca.ShipLocaService")
public class ShipLocaServiceImpl implements ShipLocaService{
	@Autowired
	private CommonDAO dao;
	@Override
	public void insertShipLoca(ShipLoca dto) throws Exception {
		try {
			dao.insertData("shipLoca.insertshipLoca",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		}
	}

}
