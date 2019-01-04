package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;

import com.databaseConn.DatabaseConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class RegisterDaoImpl implements RegisterDaoI
{

	Connection conn;
	ResultSet rs=null;
	public int userInsert(String name, String uname,String password,String email, String license)
	{
		conn = (Connection) DatabaseConnection.connection();
		int affected_rows = 0;
     	try 
     	{
     		Statement st = (Statement) conn.createStatement();
     		String sql = "insert into garage(Name,Uname,Password,Email,License) values('"+name+"','"+uname+"','"+password+"','"+email+"','"+license+"')";
            affected_rows = st.executeUpdate(sql);
            return affected_rows;
			
		} 
     	catch (SQLException e) 
     	{		
     		e.printStackTrace();
   		}
     	return affected_rows;
        
        }
}
