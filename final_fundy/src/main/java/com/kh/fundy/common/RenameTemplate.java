package com.kh.fundy.common;

import java.text.SimpleDateFormat;

public class RenameTemplate {

	public static String renameFile(String oriName)
	{
		String ext = oriName.substring(oriName.indexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		int rndNum = (int)(Math.random()*10000);
		return sdf.format(System.currentTimeMillis())+"_"+String.valueOf(rndNum)+ext;
	}
	
}
