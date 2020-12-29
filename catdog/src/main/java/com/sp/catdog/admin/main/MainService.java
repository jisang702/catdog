package com.sp.catdog.admin.main;

public interface MainService {
	//메인
	public int totalUserCount();
	public int todayNewUserCount();
	
	public void insertVisitCount(Main dto) throws Exception;

}
