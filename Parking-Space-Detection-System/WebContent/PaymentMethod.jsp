<%--
PaymentMethod.jsp- File that helps to add the payment methods
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Payment Method</title>
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
    overflow: hidden;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    padding: 6px 12px;
    border-top: none;
}
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



<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'debit')" id="defaultOpen">Add Debit Card</button>
  <button class="tablinks" onclick="openCity(event, 'credit')">Add Credit Card</button>
</div>
<div id="debit" class="tabcontent">
  <h3>Debit Card Details</h3>  
  <form action="PaymentServlet" method="post">
  <table>
  <tr>
  	<td>User Name:</td>
  	<td><input type="text" name="user" value=<%=(String)session.getAttribute("User") %>></td>
  </tr>
  <tr>
  	<td>Debit Card number:</td>
  	<td><input type="text" name="num"></td>
  </tr>
  <tr>
  	<td>Card Holder Name:</td>
  	<td><input type="text" name="name"></td>
  </tr>
  <tr>
  	<td>CVV:</td>
  	<td><input type="password" name="cvv"></td>
  </tr>
  <tr>
  	<td>Expiration Date:</td>
  	<td><select id="month" name="month">
  	<option>January</option>       
    <option>February</option>       
    <option>March</option>       
    <option>April</option>       
    <option>May</option>       
    <option>June</option>       
    <option>July</option>       
    <option>August</option>       
    <option>September</option>       
    <option>October</option>       
    <option>November</option>       
    <option>December</option>
  	</select>
  	<select id="year" name="year" >        
    <option>2019</option>       
    <option>2020</option>       
    <option>2021</option>       
    <option>2022</option>       
    <option>2023</option>       
    <option>2024</option>       
    <option>2025</option>       
    <option>2026</option>       
    <option>2027</option>   
    <option>2028</option> 
  </select></td>
  </tr>
  </table>
	<input type="submit" value="Register">
	</form>
</div>

<div id="credit" class="tabcontent">
  <h3>Credit Card Details</h3>
  <form action="PaymentServlet" method="post">
  <table>
  <tr>
  	<td>User Name:</td>
  	<td><input type="text" name="user" value=<%=(String)session.getAttribute("User") %>></td>
  </tr>
  <tr>
  	<td>Credit Card number:</td>
  	<td><input type="text" name="num"></td>
  </tr>
  <tr>
  	<td>Card Holder Name:</td>
  	<td><input type="text" name="name"></td>
  </tr>
  <tr>
  	<td>CVV:</td>
  	<td><input type="password" name="cvv"></td>
  </tr>
  <tr>
  	<td>Expiration Date:</td>
  	<td><select id="month" name="month">
  	<option>January</option>       
    <option>February</option>       
    <option>March</option>       
    <option>April</option>       
    <option>May</option>       
    <option>June</option>       
    <option>July</option>       
    <option>August</option>       
    <option>September</option>       
    <option>October</option>       
    <option>November</option>       
    <option>December</option>
  	</select>
  	<select id="year" name="year" >      
    <option>2019</option>       
    <option>2020</option>       
    <option>2021</option>       
    <option>2022</option>       
    <option>2023</option>       
    <option>2024</option>       
    <option>2025</option>       
    <option>2026</option>       
    <option>2027</option>   
    <option>2028</option> 
  </select></td>
  </tr>
  </table>
	<input type="submit" value="Register">
	</form>
 

</div>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</div>
</body>
</html>