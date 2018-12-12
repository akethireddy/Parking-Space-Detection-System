<%--
Pay.jsp- File that does the online payment function
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body>
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

	String license="";
	String slot="";
	int amount=0;
	ResultSet rs=null;
	ResultSet rs2= null;
	ResultSet rs3= null;
	ResultSet rs4=null;
	ResultSet rs5=null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	String user = (String)session.getAttribute("User");  
    try{
    	
    		
    		 	

         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         
         	String sql= "select Name,License from garage where Name=?";
         	preparedStatement = conn.prepareStatement(sql);
         	preparedStatement.setString(1,user);
         	rs = preparedStatement.executeQuery();
         	
         	while(rs.next())
         	{
         		license=rs.getString("License");
         		
         	}
         
         	
         	String prev_payment="Due";
         	//out.write("in here");
         	//String sql2= "select Slot,Amount from ticket where License=? and Payment=?";
         	//preparedStatement = conn.prepareStatement(sql);
         	//preparedStatement.setString(1,license);
         	//preparedStatement.setString(2,prev_payment);
         	//rs2 = preparedStatement.executeQuery();
         	
         	
		Statement st = (Statement) conn.createStatement();
            
            String sql2="";
            sql2="select SLot,Amount from ticket where License='"+license+"' and Payment='"+prev_payment+"'";
            
            rs2 = st.executeQuery(sql2);
         	
         	
         	while(rs2.next())
         	{
         		slot=rs2.getString("Slot");
         		//out.write(slot);
         		amount=rs2.getInt("Amount");
         		//out.write(amount);
         	}
         	         	
         	String sql3= "SET SQL_SAFE_UPDATES=0";
        	preparedStatement = conn.prepareStatement(sql3);
        	preparedStatement.executeQuery();
        	
        	
        		int update_query =0;
        		
        		String payment="Paid";
        		//updating payment to paid after payment
        		String sql4= "update ticket SET Payment=?  where License=? and Payment=?";
        		preparedStatement = conn.prepareStatement(sql4);
        		preparedStatement.setString(1,payment);
        		preparedStatement.setString(2,license);
        		preparedStatement.setString(3,prev_payment);
        		
        		update_query=preparedStatement.executeUpdate();
        	
        	
        	
        	//if(update_query!=0)
        		//out.write("worked");
        	
        	//THIS CODE SHOULD BE PUT IN PAY.JSP AFTER THE PAYMENT
        	//deleting license number from T_issue
        	int update_query2 =0;
        	String sql8= "delete from T_issue where License=?";
        	preparedStatement = conn.prepareStatement(sql8);
        	preparedStatement.setString(1,license);
        	update_query2=preparedStatement.executeUpdate();

        	//if(update_query2!=0)
        		//	out.write("delete worked");
        	
        	
        	//THIS CODE SHOULD BE PUT IN PAY.JSP AFTER THE PAYMENT
        	//updating parking slot to available again
        	int update_query3 =0;
        	String sql44= "update parking_slots SET Status='Available' WHERE Slot=?";
        	preparedStatement = conn.prepareStatement(sql44);
        	preparedStatement.setString(1,slot);
        	update_query3=preparedStatement.executeUpdate();

        	//if(update_query3!=0)
        		//	out.write("update worked");
        	
        	String sql5= "SET SQL_SAFE_UPDATES=1";
        	preparedStatement = conn.prepareStatement(sql5);
        	preparedStatement.executeQuery();

         	if (!rs2.isBeforeFirst() ) {    
                //out.write("No cards added");
                //out.write("<br><a href='PaymentMethod.jsp'>Please add the payment method here</a>");
            }
         	else
         	{
         		

         	}
         	
       
     }
     catch (SQLException e) {
        	out.write("Error occurred " + e);
      }
	   
 %>
 <table width="50%" border="1" align="center">
 <tr><td align="center">Name</td><td align="center"><%=user%></td></tr>
 <tr><td align="center">License</td><td align="center"><%=license%></td></tr>
 <tr><td align="center">Parking Slot</td><td align="center"><%=slot%></td></tr>
 <tr><td align="center">Amount</td><td align="center"><%=amount%></td></tr>
 <tr><td align="center">Payment Status</td><td align="center">Paid</td></tr>
 </table>
</div>
</body>
</html>