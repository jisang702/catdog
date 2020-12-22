package com.sp.catdog.customer.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public void insertFaq(Faq dto) throws Exception;
	public void updateFaq(Faq dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	public Faq readFaq(int faqNum);
	public List<Faq> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void insertCategory(Faq dto) throws Exception;
	public void updateCategory(Faq dto) throws Exception;
	public void deleteCategory(Map<String, Object> map) throws Exception;
	public List<Faq> listCategory();
	public List<Faq> listCategory(Map<String, Object> map);
	
}
