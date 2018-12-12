<%--
UserDetails.jsp- File that prints all user details to admin
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
<title>User Info</title>
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
<h2>Vehicle Parker User Information</h2>
<br/>
<%
ResultSetMetaData rsmd = null;
ResultSet rs=null;
    try{
    	
    	
    	 Class.forName("com.mysql.jdbc.Driver");

         Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");

         Statement st = (Statement) conn.createStatement();
         String sql= "select Name,Uname,Email,License from garage";
         rs = st.executeQuery(sql);
         
     }
     catch (SQLException e) {
        System.out.println("Error occurred " + e);
      }
	int columns=0;
	try {
  		rsmd = rs.getMetaData();
  		columns = rsmd.getColumnCount();
}
catch (SQLException e) {
   System.out.println("Error occurred " + e);
}

      
 %>
 <table width="90%" border="1">
  
  <tr>
   <% // write out the header cells containing the column labels
      try {
         for (int i=1; i<=columns; i++) {
              out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");
         }
   %>
   </tr> 
   <%
         while (rs.next()) {
            out.write("<tr>");
            for (int i=1; i<=columns; i++) {
              out.write("<td>" + rs.getString(i) + "</td>");
            }
            out.write("</tr>");
         }

      } // end of the try block
      catch (SQLException e) {
         System.out.println("Error " + e);
      }
     
    %>
   
</table>
<br>
</div>
</body>
</html>