package com.sp.catdog.doctor.faq;

import java.util.List;
import java.util.Map;


public interface FaQService {
	public void insertFaQ(FaQ dto) throws Exception;
	public List<FaQ> listFaQ(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public FaQ readFaQ(int faqNum);
	public void updateFaQ(FaQ dto) throws Exception;
	public void deleteFaQ(Map<String, Object> map) throws Exception;
	
	public void insertCategory(FaQ dto) throws Exception;
	public void updateCategory(FaQ dto) throws Exception;
	public void deleteCategory(int faqCategoryNum) throws Exception;
	public List<FaQ> listCategory(Map<String, Object> map);
	
}
