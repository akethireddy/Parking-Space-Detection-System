package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.databaseConn.DatabaseConnection;
import com.mysql.jdbc.Connection;

public class PaymentDaoImpl implements PaymentDaoI
{

	Connection conn;
	ResultSet rs=null;
	public String getLicense(String user)
	{
		conn = (Connection) DatabaseConnection.connection();
		String license = null;
		PreparedStatement preparedStatement = null;
        
        String sql= "select Name,License from garage where Name=?";
     	try 
     	{
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1,user);
	     	rs = preparedStatement.executeQuery();
	     	while(rs.next())
	     	{
	     		license=rs.getString("License");
	     	}
	     	return license;
		} 
     	catch (SQLException e) 
     	{
			
			e.printStackTrace();
		}
     	
     	return license;
        
        }
	
	public int Payment(String user,String license,String holder,String card,String cvv)
	{
		conn = (Connection) DatabaseConnection.connection();
		PreparedStatement preparedStatement = null;
		int update_query =0;
		String sql2 = "insert into payment(Name,License,Holder,CardNo,CVV) values(?,?,?,?,?)";
        
        try {
				preparedStatement = conn.prepareStatement(sql2);
				preparedStatement.setString(1,user);
		        preparedStatement.setString(2,license);
		        preparedStatement.setString(3,holder);
		        preparedStatement.setString(4,card);
		        preparedStatement.setInt(5,Integer.parseInt(cvv));
		    	update_query=preparedStatement.executeUpdate();
		    	return update_query;
		} 
        catch (SQLException e) 
        {
			
			e.printStackTrace();
		}
        return update_query;
        
	}
}
