package com.sp.catdog.seller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;


@Service("seller.StoreProductService")
public class StoreProductServiceImpl implements StoreProductService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;


	@Override
	public List<StoreProduct> listProduct(Map<String, Object> map) {
		List<StoreProduct> list = null;
		
		try {
			list=dao.selectList("StoreSeller.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountProduct(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("StoreSeller.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertCategory(StoreProduct dto) throws Exception {
		try {
			dao.insertData("StoreSeller.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCategory(StoreProduct dto) throws Exception {
		try {
			dao.updateData("StoreSeller.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("StoreSeller.deleteCategory", categoryNum);		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<StoreProduct> listCategory() {
		List<StoreProduct> list = null;
		
		try {
			list = dao.selectList("StoreSeller.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertProduct(StoreProduct dto, String pathname) throws Exception {
		try {
			int productSeq = dao.selectOne("StoreSeller.productSeq");
			dto.setPrdNum(productSeq);
			
			dao.insertData("StoreSeller.insertProduct", dto);
			
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImgFilename(saveFilename);
				
				dao.insertData("StoreSeller.insertImg", dto);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertImg(StoreProduct dto) throws Exception {
		try {
			dao.insertData("StoreSeller.insertImg", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public StoreProduct readProduct(int num) {
		StoreProduct dto = null;
		
		try {
			dto=dao.selectOne("seller.readProduct", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public StoreProduct otherProductUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreProduct otherProductCate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
