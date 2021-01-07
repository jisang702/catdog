package com.sp.catdog.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<Mypage> listPoint(Map<String, Object> map) throws Exception {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.listPoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int pointCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.pointCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int pointSum(String userId) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.pointSum", userId);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Mypage> selectList(Map<String, Object> map) throws Exception {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("mypage.listCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertPet(Mypage dto, String pathname) throws Exception {
		try {
			if(dto.getYear().length()!=0 && dto.getMonth().length()!=0 && dto.getDay().length()!=0) {
				dto.setPetBirth(dto.getYear()+"/"+dto.getMonth()+"/"+dto.getDay());
			}
			
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setPetImgName(saveFilename);
			}

			dao.insertData("mypage.insertPet", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Mypage> petList(Map<String, Object> map) throws Exception {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.petList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Mypage readPet(int petNum) throws Exception {
		Mypage dto=null;
		try {
			dto=dao.selectOne("mypage.readPet", petNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Mypage> listQna(String userId) {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.listQna", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int QnaCount(String userId) {
		int result=0;
		try {
			result=dao.selectOne("mypage.QnaCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
