package com.garage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 *@author: Abinaya Kethireddy
 */

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 	doGet(request, response);        
	        PrintWriter out = response.getWriter();
	        String name = request.getParameter("name");
	        String uname = request.getParameter("uname");
	        String password = request.getParameter("pass");
	        String email = request.getParameter("email");
	        String license = request.getParameter("license");  

	        try {

	            Class.forName("com.mysql.jdbc.Driver");

	            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");
	            //PreparedStatement preparedStatement = null;

	            Statement st = (Statement) conn.createStatement();

	            String sql = "insert into garage(Name,Uname,Password,Email,License) values('"+name+"','"+uname+"','"+password+"','"+email+"','"+license+"')";
	            st.executeUpdate(sql);
	            response.sendRedirect("LoginPage.html");
	            
	            
//	            preparedStatement = conn.prepareStatement(sql);
//	            int update_query =0;
//	        	update_query=preparedStatement.executeUpdate();
//	        	
//	        	if(update_query!=0)
//	        		out.write("User Succesfully Registered");
//	        	else
//	        		out.write("The license number is already registered.Specify correct license number");
	            
	            	
	               }catch (ClassNotFoundException e) {
	            	   

	              e.printStackTrace();

	        } catch (SQLException e) {

	              e.printStackTrace();
	              RequestDispatcher rd = getServletContext().getRequestDispatcher("/Register.html");
	              out.println("<font color=red>The license number is already registered.Specify correct license number.</font>");
	              rd.include(request, response);

	         }
	}

}
