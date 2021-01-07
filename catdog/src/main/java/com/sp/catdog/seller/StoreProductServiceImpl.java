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
			result = dao.selectOne("StoreSeller.dataCountProduct", map);
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
			dto=dao.selectOne("StoreSeller.readProduct", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public StoreProduct preReadProduct(Map<String, Object> map) {
		StoreProduct dto = null;
		
		try {
			dto=dao.selectOne("StoreSeller.preReadProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public StoreProduct nextReadProduct(Map<String, Object> map) {
		StoreProduct dto = null;
		
		try {
			dto=dao.selectOne("StoreSeller.nextReadProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateProduct(StoreProduct dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(int num, String pathname, String userId) throws Exception {
		try {
			StoreProduct dto = readProduct(num);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			if(dto.getImgFilename()!=null)
				fileManager.doFileDelete(dto.getImgFilename(), pathname);
			
			dao.deleteData("StoreSeller.deleteProduct", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
