<%--
AdminHomePage.jsp- file about the admin home page
@author: Abinaya Kethireddy--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<style>
#home{
    width:100%;
    margin:0 auto;
}
.home2{
    float:left;
    width:100%;
    height:150px;
    background:white;
    border:2px black;
    margin:0 auto;
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

<header>
 <p align="center"><h1>Vehicle Parker</h1></p>
 <p align="center">Hello, <%=(String)session.getAttribute("Admin") %></p>
  <form action="LogoutServlet" method="post">
<p align="right"><input type="submit" value="Logout" ></p>
</form>
</header>

<br/>
<div id="home">
<table align="center">
<tr><td>
<div class="home2">
	<a href="ParkingLotDesign2.jsp" class="ya-card__whole-card-link">
	
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/parking.png" height="42" width="100">
		</td>
		<td>
        <h2>Parking spots</h2>
        <div><span class="a-color-secondary">Track the free parking spots</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>
<td></td><td></td>
<td>
<div class="home2">
	<a href="InandOutReport.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/report.jpg" height="42" width="70">
		</td>
		<td>
        <h2>In and out Vehicle Report</h2>
        <div><span class="a-color-secondary">Vehicle in and out report</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>
<td></td><td></td>
<td>
<div class="home2">
	<a href="IncomeReport.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/income.jpg" height="42" width="70">
		<td>
        <h2>Income Report</h2>
        <div><span class="a-color-secondary">Montly Income Report of Parking Lot</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>
</tr>
<tr>
<td>
<div class="home2">
	<a href="UserDetails.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/info.jpg" height="42" width="70">
		<td>
        <h2>User Info</h2>
        <div><span class="a-color-secondary">All User Details</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>



<td>
</td></tr>
</table>

</div>



</body>
</html>