package com.sp.catdog.common;

import java.util.Date;

import org.springframework.stereotype.Service;

@Service("timeUtil")
public class TimeUtil {
	private class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	// 글 작성 시간 현재기준으로 구하는 클래스
	public String formatTimeString(Date tempDate) {
		long curTime = System.currentTimeMillis();
		long regTime = tempDate.getTime();
		long diffTime = (curTime - regTime) / 1000;

		String msg = null;

		if (diffTime < TIME_MAXIMUM.SEC) {
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		
		return msg;
	}
}
