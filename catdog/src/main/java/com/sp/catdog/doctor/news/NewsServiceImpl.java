package com.sp.catdog.doctor.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("doctor.newsService")
public class NewsServiceImpl implements NewsService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager filemanager;
	
	@Override
	public void insertNews(News dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("news.seq");
			dto.setNewsNum(seq);

			dao.insertData("news.insertNews", dto);
			
			//파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=filemanager.doFileUpload(mf, pathname);
					if(saveFilename==null)
						continue;
					
					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("news.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<News> listNews(Map<String, Object> map) {
		List<News> list=null;
		try {
			list=dao.selectList("news.listNews", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<News> listNewsTop() {
		List<News> list= null;
		
		try {
			list=dao.selectList("news.listNewsTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateHitCount(int newsNum) throws Exception {
		try {
			dao.updateData("news.updateHitCount", newsNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public News readNews(int newsNum) {
		News dto=null;
		
		try {
			dto=dao.selectOne("news.readNews", newsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public News preReadNews(Map<String, Object> map) {
		News dto=null;
		
		try {
			dto=dao.selectOne("news.preReadNews", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public News nextReadNews(Map<String, Object> map) {
		News dto=null;
		
		try {
			dto=dao.selectOne("news.nextReadNews", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateNews(News dto, String pathname) throws Exception {
		
		try {
			dao.updateData("news.updateNews", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=filemanager.doFileUpload(mf, pathname);
					if(saveFilename==null)
						continue;
					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNews(int newsNum, String pathname) throws Exception {
		try {
			List<News> listFile=listFile(newsNum);
			if(listFile!=null) {
				for(News dto:listFile) {
					filemanager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("field", "newsNum");
			map.put("newsNum", newsNum);
			
			dao.deleteData("news.deleteNews", newsNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(News dto) throws Exception {
		try {
			dao.insertData("news.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<News> listFile(int newsNum) {
		List<News> listFile=null;
		
		try {
			listFile=dao.selectList("news.listFile", newsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public News readFile(int fileNum) {
		News dto=null;
		try {
			dto=dao.selectOne("news.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("news.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
