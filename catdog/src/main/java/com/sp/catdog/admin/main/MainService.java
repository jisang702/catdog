package com.sp.catdog.admin.main;

import java.util.List;

public interface MainService {
	//메인
	public int totalUserCount();
	public int todayNewUserCount();
	
	public void insertVisitCount(Main dto) throws Exception;
	
	public List<Main> newUserList();
	public List<Main> newArticleList();
	public List<Main> newProductList();
}
