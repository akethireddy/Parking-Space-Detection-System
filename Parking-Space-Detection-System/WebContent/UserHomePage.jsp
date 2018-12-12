<%--
UserHomePage.jsp- File that shows the user homepage
@author: Abinaya Kethireddy
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home Page</title>
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
 <p align="center">Hello, <%=(String)session.getAttribute("User") %></p>
  <form action="LogoutServlet" method="post">
<p align="right"><input type="submit" value="Logout" ></p>
</form>
</header>
<br/>
<div id="home">
<table align="center">
<tr><td>
<div class="home2">
	<a href="ParkingLotDesign.jsp" class="ya-card__whole-card-link">
	
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

<td>
<div class="home2">
	<a href="EntryTicket.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/book.jpg" height="42" width="100">
		</td>
		<td>
        <h2>Book</h2>
        <div><span class="a-color-secondary">Book the free parking spots</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>

<td>
<div class="home2">
	<a href="ExitTicket.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/exit.png" height="42" width="80">
		<td>
        <h2>Exit</h2>
        <div><span class="a-color-secondary">Exit the parking lot</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>
</tr>

<tr>

<td>
<div class="home2">
	<a href="PaymentMethod.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>
		<img alt="Your Orders" src="images/pay.png" height="42" width="70">
		<td>
        <h2>Payment methods</h2>
        <div><span class="a-color-secondary">add payment methods</span></div>
        </td>
     </tr></table>
	</a>
</div>
</td>


<td>
<div class="home2">
	<a href="CardDetails.jsp" class="ya-card__whole-card-link">
	<table align="center">
	<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img alt="Your Orders" src="images/pay.png" height="42" width="70">
		<td>
        <h2>Added Payment methods</h2>
        <div><span class="a-color-secondary">List of your payment methods</span></div>
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