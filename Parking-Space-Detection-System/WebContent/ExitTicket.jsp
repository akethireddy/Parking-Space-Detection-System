<%--
ExitTicket.jsp- file that generates exit garage ticket
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="java.util.concurrent.TimeUnit" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exit Garage</title>
<style>
.top {
        position:absolute;
        left:0; right:0;
        height: 200px;
}
.left {
        position:absolute;
        left:0; top:130px; bottom: 0;
        
}
.main {
        position: absolute;
        left:70px; top:200px; right:0; bottom:0;
}
a 
{
text-decoration: none;
} 
header {
  background-color: #666;
  padding: 3px;
  text-align:center;
  font-size: 18px;
  color: white;
}

      
</style>
</head>
<body bgcolor="#D8D8D8">
<div class="top">
    <header>
 	<p align="center"><h1>Vehicle Parker</h1></p>
 
 	<p align="center">Hello, <%=(String)session.getAttribute("User") %></p>
  	<form action="LogoutServlet" method="post">
		<p align="right"><input type="submit" value="Logout" ></p>
	</form>
	</header>
</div>
<div class="left">
   <br/>
   <table>
   <tr><td>
  <a href="UserHomePage.jsp" class="w3-bar-item w3-button"><font color="white" size="4">HOME</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <td>
  <a href="ParkingLotDesign.jsp" class="w3-bar-item w3-button"><font color="white" size="4">PARKING SPOTS</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="EntryTicket.jsp" class="w3-bar-item w3-button"><font color="white" size="4">BOOK SLOT</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="ExitTicket.jsp" class="w3-bar-item w3-button"><font color="white" size="4">EXIT GARAGE</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="PaymentMethod.jsp" class="w3-bar-item w3-button"><font color="white" size="4">ADD A CARD</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="CardDetails.jsp" class="w3-bar-item w3-button"><font color="white" size="4">MY PAYMENT METHOD</font></a>
  </td></tr>
  </table>
</div>
<div class="main">
<%
	
	ResultSetMetaData rsmd = null;
	ResultSet rs=null;
	ResultSet rs2= null;
	ResultSet rs3= null;
	String slot="";
	String license="";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	String user = (String)session.getAttribute("User"); 
	long timeNow = Calendar.getInstance().getTimeInMillis();
	java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
	
	java.sql.Timestamp ts2= new java.sql.Timestamp(timeNow);;
	int totalamount=0;
	int totaltime =0;
	long entrytime=0;	
	int no_data=0;
	int no_due=0;
	String payment="";
	int not_set=0;
    try{
    	
    		
    		long totalduration;
    		long totalminutes;
    			  
         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         	String sql= "select * from ticket where Name=? and TotalTime=? limit 1";
         	preparedStatement = conn.prepareStatement(sql);
         	preparedStatement.setString(1,user);
         	preparedStatement.setInt(2,0);
         	rs = preparedStatement.executeQuery();
         	
         	        	
         	
         	if (!rs.isBeforeFirst() ) 
         	{
         		//out.write("<font size='4' color='red'>No ticket is booked on this license number. Please book a ticket before trying to exit parking lot</font><br>");
         		no_data=1;
         		
         	}
         	
         	else
         	{
         		
         		while(rs.next())
    			{
    				ts2=rs.getTimestamp("EntryTime");
    				entrytime=rs.getTimestamp("EntryTime").getTime();
    				slot=rs.getString("Slot");
    				license=rs.getString("License");
    				payment=rs.getString("Payment");
    				
    				if(rs.getInt("Amount")==0)
             		{
             			//out.write("in here2");
             			no_due=1;   
             			totalduration = timeNow-entrytime;
            			totalminutes = TimeUnit.MILLISECONDS.toMinutes(totalduration);
            			totaltime = (int)totalminutes;
            			totalamount = totaltime*2;
             			
             		}
    				else
    				{
    					ts=rs.getTimestamp("ExitTime");
    					totaltime=rs.getInt("TotalTime");
    					totalamount=rs.getInt("Amount");
    					
    				}
    				if(no_due==1)
    					payment="Due";
    				//out.write("slot is "+slot);

    				
    			}//end of while
         	}//end of else
    }
    catch (SQLException e) {
       	System.out.println("Error occurred " + e);
     }
	   
%>
<%             	

         	try{
         		
         	String due="Due";
         	
         	String sql8= "select * from ticket where Name=? and Payment=? limit 1";
         	preparedStatement = conn.prepareStatement(sql8);
         	preparedStatement.setString(1,user);
         	preparedStatement.setString(2,due);
         	rs2 = preparedStatement.executeQuery();
         	
         	//Statement st = (Statement) conn.createStatement();
            //String sql8="select * from ticket where Name=user and Payment=due";
			//rs2 = st.executeQuery(sql8);
           
			
         	if (!rs2.isBeforeFirst() ) 
         	{
         		//out.write("<font size='4' color='red'>No ticket is booked on this license number. Please book a ticket before trying to exit parking lot</font><br>");
         		//no_data=1;
         		not_set=1;
         	}
         	else
         	{
         		//out.write("in here");
         	}
         	while(rs2.next())
			{
         		
         		no_data=0;
				ts2=rs2.getTimestamp("EntryTime");
				
				entrytime=rs2.getTimestamp("EntryTime").getTime();
				
				slot=rs2.getString("Slot");
				//out.write(slot);
				license=rs2.getString("License");
				payment=rs2.getString("Payment");
				ts=rs2.getTimestamp("ExitTime");
				totaltime=rs2.getInt("TotalTime");
				totalamount=rs2.getInt("Amount");
			}	
			
         	if(no_data==1 && not_set==1)
         		out.write("<font size='4' color='red'>No ticket is booked on this license number. Please book a ticket before trying to exit parking lot</font><br>");
			     
     }
     catch (SQLException e) {
        	out.write("Error occurred " + e);
      }
	   
 %>
 <% // write out the header cells containing the column labels
 
 			out.write("<table border='1'>");
	 		out.write("<tr>");
    	  	out.write("<th>Name</th>");
 			out.write("<th>License</th>");
 			out.write("<th>Slot</th>");
 			out.write("<th>Entry Time</th>");
 			out.write("<th>Exit Time</th>");
 			out.write("<th>Total Time</th>");
 			out.write("<th>Amount Due</th>");
 			out.write("<th>Payment Status</th>");
 			out.write("</tr>");
			if(no_data==0)
			{
				out.write("<tr>");
	 			out.write("<th>"+user+"</th>");
	 			out.write("<th>"+license+"</th>");
	 			out.write("<th>"+slot+"</th>");
	 			out.write("<th>"+ts2+"</th>");
	 			out.write("<th>"+ts+"</th>");
	 			out.write("<th>"+totaltime+"</th>");
	 			out.write("<th>"+totalamount+"</th>");
	 			out.write("<th>"+payment+"</th>");
	 			out.write("</tr>");
			}
 			
%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn2 = null;
PreparedStatement preparedStatement2 = null;
try{
	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");
	String sql3= "SET SQL_SAFE_UPDATES=0";
	preparedStatement = conn.prepareStatement(sql3);
	preparedStatement.executeQuery();
	
	if(no_due==1)
	{
		int update_query =0;
		
		String sql4= "update ticket SET ExitTime=?,TotalTime=?,Amount=?,Payment=?  where License=? and ExitTime is null and Payment is null";
		preparedStatement = conn.prepareStatement(sql4);
		preparedStatement.setTimestamp(1,ts);
		preparedStatement.setInt(2,totaltime);
		preparedStatement.setInt(3,totalamount);
		preparedStatement.setString(4,payment);
		preparedStatement.setString(5,license);
		
		update_query=preparedStatement.executeUpdate();
	}
	
	
	//if(update_query!=0)
		//out.write("worked");
	
	//THIS CODE SHOULD BE PUT IN PAYMENT.JSP AFTER THE PAYMENT
	//int update_query2 =0;
	//String sql8= "delete from T_issue where License=?";
	//preparedStatement = conn.prepareStatement(sql8);
	//preparedStatement.setString(1,license);
	//update_query2=preparedStatement.executeUpdate();

	//if(update_query2!=0)
		//	out.write("delete worked");
	
	
	//THIS CODE SHOULD BE PUT IN PAYMENT.JSP AFTER THE PAYMENT
	//int update_query3 =0;
	//String sql44= "update parking_slots SET Status='Available' WHERE Slot=?";
	//preparedStatement = conn.prepareStatement(sql44);
	//preparedStatement.setString(1,slot);
	//update_query3=preparedStatement.executeUpdate();

	//if(update_query3!=0)
		//	out.write("update worked");
	
	String sql5= "SET SQL_SAFE_UPDATES=1";
	preparedStatement = conn.prepareStatement(sql5);
	preparedStatement.executeQuery();
}
catch (SQLException e) {
	System.out.println("Error occurred " + e);
}

%>
<a href="Payment.jsp"><input type=button value="Pay"/></a>
</div>
</body>
</html>