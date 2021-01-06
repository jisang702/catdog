package com.sp.catdog.seller.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("seller.StoreSalesService")
public class StoreSalesServiceImpl implements StoreSalesService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<StoreSales> listCategorySection() {
		List<StoreSales> list=null;
		
		try {
			list = dao.selectList("StoreSellerSales.listcategorySection");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
}
