<%--
EntryTicket.jsp- file which creates and entry ticket into garage to the user
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import="com.garage.User" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entry Ticket</title>
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

	String name="";
	String license="";
	String slot="";
	long entrydate;
	 java.util.Date d=new  java.util.Date();
	java.sql.Date sqlDate=new java.sql.Date(d.getTime());
	
	long timeNow = Calendar.getInstance().getTimeInMillis();
	java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
	
	ResultSetMetaData rsmd = null;
	ResultSet rs=null;
	ResultSet rs2= null;
	ResultSet rs3= null;
	ResultSet rs4=null;
	ResultSet rs5=null;
	String parkingSlot="";
	int tic_issue=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
    try{
    	
    		
    		String user = (String)session.getAttribute("User");   	

         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         
         	String sql= "select Name,License from garage where Name=?";
         	preparedStatement = conn.prepareStatement(sql);
         	preparedStatement.setString(1,user);
         	rs = preparedStatement.executeQuery();
         
         	String sql2= "select Slot from parking_slots where Status='Available' ORDER BY Slot ASC limit 1";
         	preparedStatement = conn.prepareStatement(sql2);
         	rs2 = preparedStatement.executeQuery();
         	
         
         	
         	//try putting it in diffrent <>
         	String sql3= "SET SQL_SAFE_UPDATES=0";
         	preparedStatement = conn.prepareStatement(sql3);
         	preparedStatement.executeQuery();
         	
         			
         	int update_query =0;
         	String stat="Not_Available";
         	String sql4= "update parking_slots SET Status='Not_Available' where Slot=?";
         	preparedStatement = conn.prepareStatement(sql4);
         	//preparedStatement.setString(1,stat);
         	preparedStatement.setString(1,rs2.getString(1));
         	update_query=preparedStatement.executeUpdate();
   
         	String sql5= "SET SQL_SAFE_UPDATES=1";
         	preparedStatement = conn.prepareStatement(sql5);
         	preparedStatement.executeQuery();
    	
       
     }
     catch (SQLException e) {
        	System.out.println("Error occurred " + e);
      }
	   
 %>
 <table width="90%" border="1">
	
 <% // write out the header cells containing the column labels
	try {

			out.write("<tr>");
    	  	out.write("<th>Name</th>");
 			out.write("<th>License Number</th>");
 			out.write("<th>Parking Slot</th>");
 			out.write("<th>Entry Time</th>");
 			out.write("</tr>");
			out.write("<tr>");
         	while (rs.next()) {       //this prints out name and license number      
            for (int i=1; i<=2; i++) {
              	//out.write("<td>" + rs.getString(i) + "</td>");
              	if(i==1)
              		name=rs.getString(i);
              	else
              		license=rs.getString(i);
              			
            }           
         	}
         
         	
         	String sql8= "select * from T_issue where License=?";
         	preparedStatement = conn.prepareStatement(sql8);
         	preparedStatement.setString(1,license);
         	rs4 = preparedStatement.executeQuery();
         	
         	if (rs4.isBeforeFirst() )
         	{                 
         		tic_issue=1;    	
            }
         	
         	
         	if(tic_issue==0)
         	{
         		Statement st = (Statement) conn.createStatement();

	            String sql44 = "insert into T_issue(License,Ticket_Issued) values('"+license+"','"+tic_issue+"')";
	            st.executeUpdate(sql44);

             	out.write("<td>" + name + "</td>");
             	out.write("<td>" + license + "</td>");
             	
             	while (rs2.next()) {             //this prints out the parking slot number 
                 	out.write("<td>" + rs2.getString(1) + "</td>");
                   	parkingSlot=rs2.getString(1);
                   	slot=rs2.getString(1);
                }
             	
             	//d= new  java.util.Date();
             	//entrydate= d.getTime();
             	//sqlDate = new java.sql.Date(d.getTime());
             	//entrydate = d.toString();
             	out.write( "<td>"+ts+"</td>"); //this prints the entry time of the vehicle
        	 	out.write("</tr>");
         	}
         	
         	else
         	{
         		//out.write("ticket already issued");
         		String sql26= "select * from ticket where License=? and TotalTime=?";
             	preparedStatement = conn.prepareStatement(sql26);
             	preparedStatement.setString(1,license);
             	preparedStatement.setInt(2,0);
             	rs5 = preparedStatement.executeQuery();
             	
             	if (rs5.isBeforeFirst() )
             	{                 
             		//out.write("rs5 does not have data");
                }
             	else
             	{
             		//out.write("rs5 does have data");
             		//out.write("rs5 does have data");
             		//out.write("<td>"+rs5.getTimestamp("EntryTime")+"</td>");
             	}
         		while(rs5.next())
         		{
         			//out.write("rs5 does have data");
         			out.write("<td>"+rs5.getString(1)+"</td>");
         			out.write("<td>"+rs5.getString(2)+"</td>");
         			out.write("<td>"+rs5.getString(3)+"</td>");
         			out.write("<td>"+rs5.getTimestamp(4)+"</td>");
         			
         		}
         	}//end of else
    	 	

      } // end of the try block
      catch (SQLException e) 
      {
         System.out.println("Error " + e);
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
         	
         			
         	int update_query =0;
         	String stat="Not_Available";
         	String sql4= "update parking_slots SET Status=? where Slot=?";
         	preparedStatement = conn.prepareStatement(sql4);
         	preparedStatement.setString(1,stat);
         	preparedStatement.setString(2,parkingSlot);
         	update_query=preparedStatement.executeUpdate();
   
         	//if(update_query!=0)
         		//out.write("record updated");
         	//else
         		//out.write("record not updated");
         	
         	String sql5= "SET SQL_SAFE_UPDATES=1";
         	preparedStatement = conn.prepareStatement(sql5);
         	preparedStatement.executeQuery();
         	//out.write("TIC SISSUE IS "+tic_issue);
         	String due="Due";
         	if(tic_issue==0)
         	{
         		int update_query2 =0;
             	String sql6= "insert into ticket(Name,License,Slot,EntryTime,TotalTime,Amount,Payment) values(?,?,?,?,?,?,?)";
             	preparedStatement = conn.prepareStatement(sql6);
             	preparedStatement.setString(1,name);
             	preparedStatement.setString(2,license);
             	preparedStatement.setString(3,slot);
             	//preparedStatement.setDate(4,sqlDate);
             	preparedStatement.setTimestamp(4,ts);
             	preparedStatement.setInt(5,0);
             	preparedStatement.setInt(6,0);
             	preparedStatement.setString(7,null);
             	update_query2=preparedStatement.executeUpdate();
         	}
         	
         	
         	
         			
    	    
     }
     catch (SQLException e) {
        	System.out.println("Error occurred " + e);
      }
	   
 %>

   
</table>
</div>

</body>
</html>