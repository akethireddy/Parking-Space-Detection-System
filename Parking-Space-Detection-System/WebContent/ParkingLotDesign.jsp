<%--
ParkingLotDesign.jsp- file that creates a design for parking lot
@author: Abinaya Kethireddy
--%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import="com.garage.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Garage Parking Home Page</title>
<style>
.inlineTable {
            display: inline-block;
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
 




<%
	String[] status = new String[49];
	ResultSetMetaData rsmd = null;
	ResultSet rs=null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement preparedStatement = null;
    try{

         	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garage","root","root");
         	String sql= "select * from parking_slots";
         	preparedStatement = conn.prepareStatement(sql);
         	rs = preparedStatement.executeQuery();
         	int i=0;
			while(rs.next())
			{
				
					status[i]=rs.getString("Status");
					i++;
					
			}
			
     }
     catch (SQLException e) {
        	System.out.println("Error occurred " + e);
      }
	   
 %>
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P1: </font><input type="text" id="P1" size="8" value=<%=status[0]%>>

</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P2: </font><input type="text" id="P2" size="8" value=<%=status[1]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P3: </font><input type="text" id="P3" size="8" value=<%=status[2]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P4: </font><input type="text" id="P4" size="8" value=<%=status[3]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P5: </font><input type="text" id="P5" size="8" value=<%=status[4]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P6: </font><input type="text" id="P6" size="8" value=<%=status[5]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P7: </font><input type="text" id="P7" size="8" value=<%=status[6]%>>
</td>
</tr>
<tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P8: </font><input type="text" id="P8" size="8" value=<%=status[7]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P9: </font><input type="text" id="P9" size="8" value=<%=status[8]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P10:</font><input type="text" id="P10" size="8" value=<%=status[9]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P11:</font><input type="text" id="P11" size="8" value=<%=status[10]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P12:</font><input type="text" id="P12" size="8" value=<%=status[11]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P13:</font><input type="text" id="P13" size="8" value=<%=status[12]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P14:</font><input type="text" id="P14" size="8" value=<%=status[13]%>>
</td>
</tr>
<tr>
</table>
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P15:</font><input type="text" id="P15" size="8" value=<%=status[14]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P16:</font><input type="text" id="P16" size="8" value=<%=status[15]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P17:</font><input type="text" id="P17" size="8" value=<%=status[16]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P18:</font><input type="text" id="P18" size="8" value=<%=status[17]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P19:</font><input type="text" id="P19" size="8" value=<%=status[18]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P20:</font><input type="text" id="P20" size="8" value=<%=status[19]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P21:</font><input type="text" id="P21" size="8" value=<%=status[20]%>>
</td>
</tr>
<tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P22:</font><input type="text" id="P22" size="8" value=<%=status[21]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P23:</font><input type="text" id="P23" size="8" value=<%=status[22]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P24:</font><input type="text" id="P24" size="8" value=<%=status[23]%>></td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P25:</font><input type="text" id="P25" size="8" value=<%=status[24]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P26:</font><input type="text" id="P26" size="8" value=<%=status[25]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P27:</font><input type="text" id="P27" size="8" value=<%=status[26]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P28:</font><input type="text" id="P28" size="8" value=<%=status[27]%>>
</td>
</tr>
<tr>
</table>
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P29:</font><input type="text" id="P29" size="8" value=<%=status[28]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P30:</font><input type="text" id="P30" size="8" value=<%=status[29]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P31:</font><input type="text" id="P31" size="8" value=<%=status[30]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P32:</font><input type="text" id="P32" size="8" value=<%=status[31]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P33:</font><input type="text" id="P33" size="8" value=<%=status[32]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P34:</font><input type="text" id="P34" size="8" value=<%=status[33]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P35:</font><input type="text" id="P35" size="8" value=<%=status[34]%>>
</td>
</tr>
<tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P36:</font><input type="text" id="P36" size="8" value=<%=status[35]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P37:</font><input type="text" id="P37" size="8" value=<%=status[36]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P38:</font><input type="text" id="P38" size="8" value=<%=status[37]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P39:</font><input type="text" id="P39" size="8" value=<%=status[38]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P40:</font><input type="text" id="P40" size="8" value=<%=status[39]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P41:</font><input type="text" id="P41" size="8" value=<%=status[40]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P42:</font><input type="text" id="P42" size="8" value=<%=status[41]%>>
</td>
</tr>
<tr>
</table>
<table id="lot1" border="1" class="inlineTable">
<tr>
<td width="120" height="70">
<font color="black">P43:</font><input type="text" id="P43" size="8" value=<%=status[42]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P44:</font><input type="text" id="P44" size="8" value=<%=status[43]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P45:</font><input type="text" id="P45" size="8" value=<%=status[44]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P46:</font><input type="text" id="P46" size="8" value=<%=status[45]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P47:</font><input type="text" id="P47" size="8" value=<%=status[46]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P48:</font><input type="text" id="P48" size="8" value=<%=status[47]%>>
</td>
</tr>
<tr>
<td width="120" height="70">
<font color="black">P49:</font><input type="text" id="P49" size="8" value=<%=status[48]%>>
</td>
</tr>
<tr>
</table>
</div>
</body>
</html>