package com.dao;

public interface LoginDaoI {
	
	public boolean adminLogin(String uname , String password);
	public boolean userLogin(String uname , String password);

}
