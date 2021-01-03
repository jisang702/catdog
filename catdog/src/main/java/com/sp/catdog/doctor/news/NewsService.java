package com.sp.catdog.doctor.news;

import java.util.List;
import java.util.Map;

public interface NewsService {
	public void insertNews(News dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<News> listNews(Map<String, Object> map);
	public List<News> listNewsTop();
	
	public void updateHitCount(int newsNum) throws Exception;
	public News readNews (int newsNum);
	public News preReadNews (Map<String, Object> map);
	public News nextReadNews (Map<String, Object> map);
	
	public void updateNews(News dto, String pathname) throws Exception;
	public void deleteNews(int newsNum, String pathname) throws Exception;
	
	public void insertFile(News dto) throws Exception;
	public List<News> listFile(int newsNum);
	public News readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
