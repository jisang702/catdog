package com.sp.catdog.community.photo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("photo.photoService")
public class PhotoServieImpl implements PhotoService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertPhoto(Photo dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("photo.seq");
			dto.setPhotoNum(seq);
			
			dao.insertData("photo.insertPhoto", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					String originalFilename=mf.getOriginalFilename();
					
					dto.setPhotoImgOriginalname(originalFilename);
					dto.setPhotoImgSavename(saveFilename);
					dto.setPhotoNum(seq);
					
					insertImage(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertImage(Photo dto) throws Exception {
		try {
			dao.insertData("photo.insertImage", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("photo.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Photo> listPhoto(Map<String, Object> map) {
		List<Photo> list=null;
		try {
			list=dao.selectList("photo.listPhoto", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updatePhoto(Photo dto, String pathname) throws Exception {
		try {
			dao.updateData("photo.updatePhoto", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					String originalFilename=mf.getOriginalFilename();
					
					dto.setPhotoImgOriginalname(originalFilename);
					dto.setPhotoImgSavename(saveFilename);
					
					insertImage(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deletePhoto(Photo dto, String pathname, String userId) throws Exception {
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void updateHitCount(int photoNum) throws Exception {
		try {
			dao.updateData("photo.updateHitCount", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Photo readPhoto(int photoNum) {
		// TODO Auto-generated method stub
		return null;
	}
}
