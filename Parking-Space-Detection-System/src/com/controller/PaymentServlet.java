package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.PaymentDaoImpl;


/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String card = request.getParameter("num");
        String holder = request.getParameter("name");
        String cvv = request.getParameter("cvv");
        String license="";
        int update_query=0;

        PaymentDaoImpl pay = new PaymentDaoImpl();
	    license= pay.getLicense(user);
	    update_query = pay.Payment(user, license, holder, card, cvv);
	    
	    if(update_query!=0)
		{
	    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/PaymentMethod.jsp");
			out.println("<font color=red>The card details are succesfully registered.</font>");
			rd.include(request, response);
		}
	    else
		    out.write("payment info not Registered");
		            
	
	}

}
