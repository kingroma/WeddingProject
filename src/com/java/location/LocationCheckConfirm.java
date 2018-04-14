package com.java.location;

import com.java.user.User;

public class LocationCheckConfirm {
	private int check_number ;
	private String user_id ;
	private String work_date;
	
	private User user ;
	
	public int getCheck_number() {
		return check_number;
	}
	public void setCheck_number(int check_number) {
		this.check_number = check_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getWork_date() {
		return work_date;
	}
	public void setWork_date(String work_date) {
		this.work_date = work_date;
	} 
	
	
}
