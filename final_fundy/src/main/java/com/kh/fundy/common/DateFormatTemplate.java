package com.kh.fundy.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DateFormatTemplate {
	
	public static String getDay(Timestamp ts)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		return sdf.format(ts.getTime()-System.currentTimeMillis());		
	}
	
	public static String getTillDate(Timestamp ts)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(ts.getTime());
	}
	
}
