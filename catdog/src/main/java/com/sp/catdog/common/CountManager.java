package com.sp.catdog.common;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountManager implements HttpSessionListener{
	private static int currentCount;
	private static long todayCount, yesterdayCount, totalCount;
	
	public CountManager() {
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				yesterdayCount=todayCount;
				todayCount=0;
			}
		};
		
		Timer timer = new Timer();
		Calendar cal=Calendar.getInstance();
		
		//시간을 오늘 밤 12시로 세팅
		cal.add(Calendar.DATE, 1);
		
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		//밤 12시마다 타이머 실행
		timer.schedule(task, cal.getTime(), 1000*60*60*24);
	}
	
	public static void init(long toDay, long yesterDay, long total) {
		todayCount=toDay;
		yesterdayCount=yesterDay;
		totalCount=total;
	}

	public static int getCurrentCount() {
		return currentCount;
	}

	public static long getTodayCount() {
		return todayCount;
	}

	public static long getYesterdayCount() {
		return yesterdayCount;
	}

	public static long getTotalCount() {
		return totalCount;
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// 세션이 생성될 때
		synchronized (se) {
			currentCount++;
			todayCount++;
			totalCount++;
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// 세션이 소멸될 때
		synchronized (se) {
			currentCount--;
			if(currentCount<0) {
				currentCount=0;
			}
		}
		
	}
}
