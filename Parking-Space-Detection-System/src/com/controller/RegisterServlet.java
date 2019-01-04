package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RegisterDaoImpl;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);        
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String uname = request.getParameter("uname");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String license = request.getParameter("license");  
        int affected_rows = 0;
      
        RegisterDaoImpl reg = new RegisterDaoImpl();
       	affected_rows = reg.userInsert(name, uname, password, email, license);
       	if(affected_rows!=0)
       		response.sendRedirect("LoginPage.html");
       	else
       	{
       		 RequestDispatcher rd = getServletContext().getRequestDispatcher("/Register.html");
             out.println("<font color=red>The license number is already registered.Specify correct license number.</font>");
             rd.include(request, response);
        }
  
               
	}

}
