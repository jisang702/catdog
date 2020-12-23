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
			dao.updateData("faq.updateFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faq.deleteFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Faq readFaq(int faqNum) {
		Faq dto=null;
		try {
			dto=dao.selectOne("faq.readFaq", faqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list=null;
		try {
			list=dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertCategory(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateCategory(Faq dto) throws Exception {
		try {
			dao.updateData("faq.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faq.deleteCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Faq> listCategory(Map<String, Object> map) {
		List<Faq> list=null;
		try {
			list=dao.selectList("faq.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Faq> listCategory() {
		List<Faq> list=null;
		try {
			list=dao.selectList("faq.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
