package com.garage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 *@author: Abinaya Kethireddy
 */

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String card = request.getParameter("num");
        String holder = request.getParameter("name");
        String cvv = request.getParameter("cvv");
        String license="";
        ResultSet rs=null;

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");
            PreparedStatement preparedStatement = null;
            
            String sql= "select Name,License from garage where Name=?";
         	preparedStatement = conn.prepareStatement(sql);
         	preparedStatement.setString(1,user);
         	rs = preparedStatement.executeQuery();
         	while(rs.next())
         	{
         		license=rs.getString("License");
         	}
         	

            String sql2 = "insert into payment(Name,License,Holder,CardNo,CVV) values(?,?,?,?,?)";
            
            preparedStatement = conn.prepareStatement(sql2);
            preparedStatement.setString(1,user);
            preparedStatement.setString(2,license);
            preparedStatement.setString(3,holder);
            preparedStatement.setString(4,card);
            preparedStatement.setInt(5,Integer.parseInt(cvv));
            int update_query =0;
        	update_query=preparedStatement.executeUpdate();
        	
        	if(update_query!=0)
        	{
        		RequestDispatcher rd = getServletContext().getRequestDispatcher("/PaymentMethod.jsp");
	              out.println("<font color=red>The card details are succesfully registered.</font>");
	              rd.include(request, response);
        	}
        		
        	else
        		out.write("payment info not Registered");
            
        
        }catch (ClassNotFoundException e) {

              e.printStackTrace();

        } catch (SQLException e) {

              e.printStackTrace();
              RequestDispatcher rd = getServletContext().getRequestDispatcher("/PaymentServlet.jsp");
              out.println("<font color=red>payment info not Registered.</font>");
              rd.include(request, response);

         }
	}

}
