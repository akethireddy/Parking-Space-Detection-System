<%--
IncomeReport.jsp - File that prints the total income report of the garage
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
<title>Income Report</title>
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
 			out.write("<table width='90%' border='1'>");
			out.write("<tr>");
    	  	out.write("<th>Period</th>");
 			out.write("<th>Sept-2018</th>");
 			out.write("<th>Oct-2018</th>");
 			out.write("<th>Nov-2018</th>");
 			out.write("<th>Dec-2018</th>");
 			out.write("</tr>");
			out.write("<tr>");
         	out.write("<td align='center'>Monthly amount</td>");
    		
    		      
%>

<%


	int[][] amount=new int[4][2];
	java.util.Date d=new  java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("MMM - YYYY");
	
	out.write("<h2>Parking Lot Sales Report-----"+ft.format(d)+"</h2>");
	
	ResultSetMetaData rsmd = null;
	ResultSet rs=null;

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
    try{
    	
    		
    		String user = (String)session.getAttribute("User");   	

         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         
         	String sql= "select Month(EntryTime),sum(Amount) from ticket group by Month(EntryTime) order by Month(EntryTime) ASC";
         	//preparedStatement = conn.prepareStatement(sql);
         	//rs = preparedStatement.executeQuery();
         	
         	
         	
         	Statement st = conn.createStatement();
         	 
            st = conn.createStatement();
            rs = st.executeQuery(sql);
     
            while (rs.next()) {
                String name = rs.getString(2);
                out.write("<td align='center'>"+name+"</td>");
     
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