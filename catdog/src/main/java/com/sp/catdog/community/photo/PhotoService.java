package com.sp.catdog.community.photo;

import java.util.List;
import java.util.Map;

public interface PhotoService {
	public void insertPhoto(Photo dto, String pathname) throws Exception;
	public void insertImage(Photo dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Photo> listPhoto(Map<String, Object> map);
	
	public void updatePhoto(Photo dto, String pathname) throws Exception;
	public void deletePhoto(Photo dto, String pathname, String userId) throws Exception;
	
	public void updateHitCount(int photoNum) throws Exception;
	public Photo readPhoto(int photoNum);
	
	public Photo preReadBoard(Map<String, Object> map);
	public Photo nextReadBoard(Map<String, Object> map);

}
