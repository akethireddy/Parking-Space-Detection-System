package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.databaseConn.DatabaseConnection;
import com.mysql.jdbc.Connection;

public class LoginDaoImpl implements LoginDaoI
{
	Connection conn;
	public boolean adminLogin(String uname , String password)
	{
		conn = (Connection) DatabaseConnection.connection();
		Statement st;
		try 
		{
			st = (Statement) conn.createStatement();
			String sql="select * from user_admin where Uname=uname and Password=password";
	        ResultSet rs = st.executeQuery(sql);    
	        if (!rs.isBeforeFirst() ) 
	        {
	        	return false;
	        }
	        else
		    	return true;
		} 
		catch (SQLException e) 
		{	
			e.printStackTrace();
		}       
        
        
        return false;
	}
	
	public boolean userLogin(String uname , String password)
	{
		conn = (Connection) DatabaseConnection.connection();
		Statement st;
		try 
		{
			st = (Statement) conn.createStatement();
			String sql="select * from garage where Uname=uname and Password=password";
		    ResultSet rs = st.executeQuery(sql);    
		    if (!rs.isBeforeFirst() ) 
		    {
		    	return false;
		     }
		    else
		    	return true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}       
           
        return false;
	}
}
