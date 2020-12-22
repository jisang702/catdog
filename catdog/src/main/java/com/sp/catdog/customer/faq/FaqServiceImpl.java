package com.sp.catdog.customer.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("customer.faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFaq(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateFaq(Faq dto) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Faq readFaq(int faqNum) {
		Faq dto=null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list=null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertCategory(Faq dto) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateCategory(Faq dto) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Faq> listCategory() {
		List<Faq> list=null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
