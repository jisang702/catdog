package com.sp.catdog.admin.storeManage;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public int orderCount(String state);
	public int orderPriceSum(String state);
	public int productCount(Map<String, Object> map); 
	
	public List<Store> listProduct(Map<String, Object> map);
}
