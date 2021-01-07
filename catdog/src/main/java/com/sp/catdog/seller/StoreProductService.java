package com.sp.catdog.seller;

import java.util.List;
import java.util.Map;

public interface StoreProductService {
	public void insertProduct(StoreProduct dto, String pathname) throws Exception;
	public int dataCountProduct(Map<String, Object> map);
	public List<StoreProduct> listProduct(Map<String, Object> map);
	
	public StoreProduct readProduct(int num);
	public void updateProduct(StoreProduct dto, String pathname) throws Exception;
	public void deleteProduct(int num, String pathname, String userId) throws Exception;
	
	public StoreProduct preReadProduct(Map<String, Object> map);
	public StoreProduct nextReadProduct(Map<String, Object> map);
	
	public void insertCategory(StoreProduct dto) throws Exception;
	public void updateCategory(StoreProduct dto) throws Exception;
	public void deleteCategory(int categoryNum) throws Exception;
	public List<StoreProduct> listCategory();
	
	public void insertImg(StoreProduct dto) throws Exception;
}
