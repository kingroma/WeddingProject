package com.java.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class MyDate {
	public static String getNow(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		return sdf.format(new Date());
	}
	
	public static ArrayList<String> getThisWeek(){
		ArrayList<String> thisWeekList = new ArrayList<String>();
		Date date = new Date();
		while(date.getDay()!=1) {
			date.setDate(date.getDate()-1);
		}
		
		for(int i = 0 ; i < 7 ; i++) {
			int temp = date.getYear();
			String year = "20"+(temp-100);
			
			String month = ""+(date.getMonth()+1);
			if((date.getMonth()+1)<10) {
				month = "0"+(date.getMonth()+1);
			}
			
			String day = ""+date.getDate();
			if(day.length()==1) {
				day = "0"+day;
			}
			thisWeekList.add(year+month+day);
			date.setDate(date.getDate()+1);
		}
		
		return thisWeekList;
	}
	
	public static String getNowYearMonthDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		return sdf.format(new Date());
	}
	
	public static String getNowYear() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		return sdf.format(new Date());
	}
	
	public static String getNowMonth() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		
		return sdf.format(new Date());
	}
	
	
	
	public static Date changeStringToDate(String input) {
		/*
		String year = input.substring(0, 4);
		String month = input.substring(4,6);
		String date = input.substring(6,8);
		String hour = input.substring(8,10);
		String min = input.substring(10,12);
		
		StringBuilder sb = new StringBuilder();
		sb.append(year);
		sb.append("-");
		sb.append(month);
		sb.append("-");
		sb.append(date);
		sb.append(" ");
		sb.append(hour);
		sb.append(":");
		sb.append(min);
		sb.append(":00");
		
		String format = sb.toString();
		System.out.println(format);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Date result = null;
		
		try {
			result = dt.parse(format);
		}catch(Exception e) {
			e.printStackTrace();
		}
		*/
		Date result = new Date();
		result.setYear(Integer.parseInt(input.substring(0, 4)));
		result.setMonth(Integer.parseInt(input.substring(4, 6))-1);
		result.setDate(Integer.parseInt(input.substring(6, 8)));
		result.setHours(Integer.parseInt(input.substring(8, 10)));
		result.setMinutes(Integer.parseInt(input.substring(10, 12)));
		
		return result;
	}
	
	public static Date getDateUsingYearMonth(String year , String month) {
		if(month.length()==1) {
			month = "0"+month;
		}
		String date_s = year+"-"+month+"-01 00:00:00.0"; 
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = null;
		try {
			date = dt.parse(date_s);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println(date.toString());
		return date;
	}
	
	public static String removeSlashFromJavascript(String input) {
		String result= "";
		String[] split = input.split("/");
		
		String year = split[0];
		String month = split[1];
		String day = split[2];
		if(month.length()==1) {
			month= "0"+month;
		}
		if(day.length()==1) {
			day = "0"+day;
		}
		result = year+month+day;
		return result;
	}
}	
