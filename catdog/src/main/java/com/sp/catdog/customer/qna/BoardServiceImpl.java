package com.sp.catdog.customer.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.catdog.common.FileManager;
import com.sp.catdog.common.dao.CommonDAO;

@Service("customer.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertBoard(Board dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("qna.seq");
			dto.setQnaNum(seq);
			
			dao.insertData("qna.insertBoard", dto);
			
			//파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf: dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setQnaOriginalFileName(originalFilename);
					dto.setQnaSaveFileName(saveFilename);
					dto.setQnaFileSize(fileSize);
					
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
			result=dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		try {
			list=dao.selectList("qna.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Board readQuestion(int qnaNum) {
		Board dto=null;
		try {
			dto=dao.selectOne("qna.readQuestion", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board readAnswer(int qnaParent) {
		Board dto=null;
		try {
			dto=dao.selectOne("qna.readAnswer", qnaParent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board preReadQuestion(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.selectOne("qna.preReadQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board nextReadQuestion(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.selectOne("qna.nextReadQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateBoard(Board dto, String pathname) throws Exception {
		try {
			dao.updateData("qna.updateBoard", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf: dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;
					
					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
					dto.setQnaOriginalFileName(originalFilename);
					dto.setQnaSaveFileName(saveFilename);
					dto.setQnaFileSize(fileSize);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteQuestion(int qnaNum, String pathname) throws Exception {
		try {
			List<Board> listFile=listFile(qnaNum);
			if(listFile!=null) {
				for(Board dto:listFile) {
					fileManager.doFileDelete(dto.getQnaSaveFileName(), pathname);
				}
			}
			
			Map<String, Object> map=new HashMap<>();
			map.put("field", "qnaNum");
			map.put("qnaNum", qnaNum);
			deleteFile(map);
			
			dao.deleteData("qna.deleteQuestion", qnaNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteAnswer(int qnaNum, String pathname) throws Exception {
		try {
			List<Board> listFile=listFile(qnaNum);
			if(listFile!=null) {
				for(Board dto:listFile) {
					fileManager.doFileDelete(dto.getQnaSaveFileName(), pathname);
				}
			}
			
			Map<String, Object> map=new HashMap<>();
			map.put("field", "qnaNum");
			map.put("qnaNum", qnaNum);
			deleteFile(map);
			
			dao.deleteData("qna.deleteAnswer", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertCategory(Board dto) throws Exception {
		try {
			dao.insertData("qna.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	@Override
	public void updateCategory(Board dto) throws Exception {
		try {
			dao.updateData("qna.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public void deleteCategory(int qnaCategoryNum) throws Exception {
		try {
			dao.deleteData("qna.deleteCategory", qnaCategoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Board> listCategory() {
		List<Board> list=null;
		try {
			list=dao.selectList("qna.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertFile(Board dto) throws Exception {
		try {
			dao.insertData("qna.insertFile",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Board> listFile(int qnaNum) {
		List<Board> list=null;
		try {
			list=dao.selectList("qna.listFile", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Board readFile(int qnaFileNum) {
		Board dto=null;
		try {
			dto=dao.selectOne("qna.readFile", qnaFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("qna.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
