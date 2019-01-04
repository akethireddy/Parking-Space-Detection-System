package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LoginDaoImpl;
import com.databaseConn.DatabaseConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


@WebServlet("/LoginServ")
public class LoginServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        String password = request.getParameter("pass");


        	boolean flag = false;
        	LoginDaoImpl login = new LoginDaoImpl();
           
            if(uname.equals("admin"))
            {
            	flag= login.adminLogin(uname ,password);
            }
            else
            {
            	flag= login.userLogin(uname , password);
            }
 
            if (flag==false) {    
                //System.out.println("No data"); 
            	
            	RequestDispatcher rd = getServletContext().getRequestDispatcher("/LoginPage.html");
    			out.println("<font color=red>provided credentials are incorrect.</font>");
    			rd.include(request, response);
            	
            	
            }
            else
            {

            		if(uname.equals("admin"))
            		{
            			 	HttpSession session = request.getSession(); //Creating a session
            			 	session.setAttribute("Admin", uname); //setting session attribute
            			 	session.setMaxInactiveInterval(30*60);
                			Cookie userName = new Cookie("user", uname);
                			userName.setMaxAge(30*60);
                			response.addCookie(userName);
            			 	request.setAttribute("userName", uname);
            			 	request.getRequestDispatcher("AdminHomePage.jsp").forward(request, response);
            		}
            		else
            		{
            			HttpSession session = request.getSession(); //Creating a session
        			 	session.setAttribute("User", uname); //setting session attribute
        			 	session.setMaxInactiveInterval(30*60);
            			Cookie userName = new Cookie("user", uname);
            			userName.setMaxAge(30*60);
            			response.addCookie(userName);
        			 	request.setAttribute("userName", uname);
        			 	request.getRequestDispatcher("UserHomePage.jsp").forward(request, response);
            		}
            }

	}

}
