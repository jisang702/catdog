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
	public void deletePhoto(int photoNum, String pathname) throws Exception {
		try {
			List<Photo> list=listPhotoImg(photoNum);
			
			if(list!=null) {
				for(Photo dto:list) {
					fileManager.doFileDelete(dto.getPhotoImgSavename(), pathname);
				}
			}
			
			dao.deleteData("photo.deletePhoto", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deletePhotoImg(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("photo.deletePhotoImg", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
		Photo dto=null;
		try {
			dto=dao.selectOne("photo.readPhoto", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Photo> listPhotoImg(int photoNum) {
		List<Photo> list=null;
		try {
			list=dao.selectList("photo.listPhotoImg", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Photo readPhotoImg(int imgNum) {
		Photo dto=null;
		try {
			dto=dao.selectOne("photo.readPhotoImg", imgNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Photo preReadBoard(Map<String, Object> map) {
		Photo dto=null;
		try {
			dto=dao.selectOne("photo.preReadPhoto", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Photo nextReadBoard(Map<String, Object> map) {
		Photo dto=null;
		try {
			dto=dao.selectOne("photo.nextReadPhoto", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertPhotoLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("photo.insertPhotoLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deletePhotoLike(Map<String, Object> map) throws Exception {
		try {			
			dao.deleteData("photo.deletePhotoLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int photoLikeUser(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("photo.photoLikeUser", map);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int photoLikeCount(int photoNum) {
		int result=0;
		try {
			result=dao.selectOne("photo.photoLikeCount", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("photo.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("photo.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("photo.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateReply(Reply dto) throws Exception {
		try {
			dao.updateData("photo.updateReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("photo.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("photo.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("photo.deleteReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int replyLikeUser(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("photo.replyLikeUser", map);
		} catch (NullPointerException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int replyLikeCount(int photoReplyNum) {
		int result=0;
		try {
			result=dao.selectOne("photo.replyLikeCount", photoReplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Reply> listAnswerReply(int photoReplyType) {
		List<Reply> list=null;
		try {
			list=dao.selectList("photo.listAnswerReply", photoReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int answerReplyCount(int photoReplyType) {
		int result=0;
		try {
			result=dao.selectOne("photo.answerReplyCount", photoReplyType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

