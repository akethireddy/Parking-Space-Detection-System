<%--
InandOutReport.jsp- file that prints in and out vehicle reports
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*, java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>In and Out Vehicle Report</title>
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
 
 	<p align="center">Hello, <%=(String)session.getAttribute("Admin") %></p>
  	<form action="LogoutServlet" method="post">
		<p align="right"><input type="submit" value="Logout" ></p>
	</form>
	</header>
</div>
<div class="left">
   <br/>
   <table>
   <tr><td>
  <a href="AdminHomePage.jsp" class="w3-bar-item w3-button"><font color="white" size="4">HOME</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <td>
  <a href="ParkingLotDesign2.jsp" class="w3-bar-item w3-button"><font color="white" size="4">PARKING SPOTS</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="InandOutReport.jsp" class="w3-bar-item w3-button"><font color="white" size="4">IN AND OUT VEHICLE REPORT</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="IncomeReport.jsp" class="w3-bar-item w3-button"><font color="white" size="4">INCOME REPORT</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  <td>
  <a href="UserDetails.jsp" class="w3-bar-item w3-button"><font color="white" size="4">USER INFO</font></a>
  </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
  </tr>
  </table>
</div>
<div class="main" align="center">


<%

	java.util.Date d=new  java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("MMM - YYYY");
	
	out.write("<h2>Parking Lot Vehicle In and Out Report-----"+ft.format(d)+"</h2>");
	
	ResultSetMetaData rsmd = null;
	ResultSet rs=null;

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
    try{
    	
    		
    		String user = (String)session.getAttribute("User");   	

         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         
         	String sql= "select Month(EntryTime) as month,Name,License,Slot,EntryTime,ExitTime,TotalTime,Amount from ticket order by month asc";
         	Statement st = conn.createStatement();
         	 
            st = conn.createStatement();
            rs = st.executeQuery(sql);
     
           
           
 			String str="9";
 			String str2="10";
 			String str3="11";
 			String str4="12";
 			boolean b= true;
 			int i=0,k=0,l=0;
 			int j=0;
            while (rs.next()) {
            		
            	
					if(str.equals(rs.getString(1)) && i==0)
					{
							out.write("<h3>SEPTEMBER-2018</h3>");
						 	out.write("<table width='90%' border='1'>");
				 			out.write("<tr>");
				     	  	out.write("<th>Name</th>");
				  			out.write("<th>License</th>");
				  			out.write("<th>Slot</th>");
				  			out.write("<th>EntryTime</th>");
				  			out.write("<th>ExitTime</th>");
				  			out.write("<th>TotalTime</th>");
				  			out.write("<th>Amount</th>");
				  			out.write("</tr>");
				 			out.write("<tr>");
				 			i=1;
					}
					else if(str2.equals(rs.getString(1)) && j==0)
					{
							
							out.write("</table>");
							out.write("<h3>OCTOBER-2018</h3>");
						 	out.write("<table width='90%' border='1'>");
				 			out.write("<tr>");
				     	  	out.write("<th>Name</th>");
				  			out.write("<th>License</th>");
				  			out.write("<th>Slot</th>");
				  			out.write("<th>EntryTime</th>");
				  			out.write("<th>ExitTime</th>");
				  			out.write("<th>TotalTime</th>");
				  			out.write("<th>Amount</th>");
				  			out.write("</tr>");
				 			out.write("<tr>");
				 			j=1;
					}
					else if(str3.equals(rs.getString(1)) && k==0)
					{
							out.write("</table>");
							out.write("<h3>NOVEMBER-2018</h3>");
						 	out.write("<table width='90%' border='1'>");
				 			out.write("<tr>");
				     	  	out.write("<th>Name</th>");
				  			out.write("<th>License</th>");
				  			out.write("<th>Slot</th>");
				  			out.write("<th>EntryTime</th>");
				  			out.write("<th>ExitTime</th>");
				  			out.write("<th>TotalTime</th>");
				  			out.write("<th>Amount</th>");
				  			out.write("</tr>");
				 			out.write("<tr>");
				 			k=1;
					}
					else if(str4.equals(rs.getString(1)) && l==0)
					{
							out.write("</table>");
							out.write("<h3>DECEMBER-2018</h3>");
						 	out.write("<table width='90%' border='1'>");
				 			out.write("<tr>");
				     	  	out.write("<th>Name</th>");
				  			out.write("<th>License</th>");
				  			out.write("<th>Slot</th>");
				  			out.write("<th>EntryTime</th>");
				  			out.write("<th>ExitTime</th>");
				  			out.write("<th>TotalTime</th>");
				  			out.write("<th>Amount</th>");
				  			out.write("</tr>");
				 			out.write("<tr>");
				 			l=1;
					}
					
						
		                out.write("<td align='center'>"+rs.getString(2)+"</td>");
		                out.write("<td align='center'>"+rs.getString(3)+"</td>");
		                out.write("<td align='center'>"+rs.getString(4)+"</td>");
		                out.write("<td align='center'>"+rs.getString(5)+"</td>");
		                out.write("<td align='center'>"+rs.getString(6)+"</td>");
		                out.write("<td align='center'>"+rs.getString(7)+"</td>");
		                out.write("<td align='center'>"+rs.getString(8)+"</td>");
						out.write("</tr>");
					
									
                	
     
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