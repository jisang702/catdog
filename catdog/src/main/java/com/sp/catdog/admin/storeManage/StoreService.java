package com.sp.catdog.admin.storeManage;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public int orderCount(String state);
	public int orderPriceSum(String state);
	public int productCount(Map<String, Object> map); 
	
	public int categoryCount(Map<String, Object> map);
	public List<Store> listCategory(Map<String, Object> map);
	public void insertCategory(Store dto) throws Exception;
	public void updateCategory(Store dto) throws Exception;
	public void deleteCategory(int prdCategoryNum) throws Exception;
	
	public List<Store> listProduct(Map<String, Object> map);
	
	public List<Store> listOrdCount();
	public List<Store> listAmount();
}
