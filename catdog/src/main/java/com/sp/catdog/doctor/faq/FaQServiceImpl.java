package com.sp.catdog.doctor.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.dao.CommonDAO;

@Service("doctor.FaQService")
public class FaQServiceImpl implements FaQService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFaQ(FaQ dto) throws Exception {
		try {
			dao.insertData("vetFaQ.insertFaQ", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<FaQ> listFaQ(Map<String, Object> map) {
		List<FaQ> list = null;
		
		try {
			list=dao.selectList("vetFaQ.listFaQ", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("vetFaQ.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public FaQ readFaQ(int faqNum ) {
		FaQ dto=null;
		try {
			dto=dao.selectOne("vetFaQ.readFaQ", faqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFaQ(FaQ dto) throws Exception {
		try {
			dao.updateData("vetFaQ.updateFaQ", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteFaQ(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("vetFaQ.deleteFaQ", map);			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCategory(FaQ dto) throws Exception {
		try {
			dao.insertData("vetFaQ.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCategory(FaQ dto) throws Exception {
		try {
			dao.updateData("vetFaQ.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void deleteCategory(int faqCategoryNum) throws Exception {
		try {
			dao.deleteData("vetFaQ.deleteCategory", faqCategoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<FaQ> listCategory(Map<String, Object> map) {
		List<FaQ> listCategory = null;
		try {
			listCategory = dao.selectList("vetFaQ.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

}
