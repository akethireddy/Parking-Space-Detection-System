package com.garage;

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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 *@author: Abinaya Kethireddy
 */

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
        String uname = request.getParameter("uname");
        String password = request.getParameter("pass");


        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

            Statement st = (Statement) conn.createStatement();
            
            String sql="";
            if(uname.equals("admin"))
            {
            	sql="select * from user_admin where Uname=uname and Password=password";
            }
            else
            	sql="select * from garage where Uname=uname and Password=password";
            

            ResultSet rs = st.executeQuery(sql);
            
            
            if (!rs.isBeforeFirst() ) {    
                //System.out.println("No data"); 
            	
            	RequestDispatcher rd = getServletContext().getRequestDispatcher("/LoginPage.html");
    			out.println("<font color=red>provided credentials are incorrect.</font>");
    			rd.include(request, response);
            	
            	
            }
            else
            {
            	
            	User u = new User();
            	u.setUser(uname);

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
                
            
        
        }catch (ClassNotFoundException e) {

              e.printStackTrace();

        } catch (SQLException e) {

              e.printStackTrace();

         }
	}

}
