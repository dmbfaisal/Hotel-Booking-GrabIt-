<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CndPay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <%
 	HttpSession current = request.getSession(false);
 	if(current!=null)
 	{
		ResultSet rs=(ResultSet)current.getAttribute("hotel");
		String aroom= current.getAttribute("room").toString();
		String bdate=current.getAttribute("bdate").toString() , chdate=current.getAttribute("chdate").toString();
		long rent = rs.getInt("fare")*Integer.parseInt(current.getAttribute("days").toString());
		
 
  %> 
  <body>
  <table>
  <thead>
  <tr>
  <th>Franchise</th>
  <th>Room no.</th>
  <th>Address</th>
  <th>City</th>
  <th>State</th>
  <th> zip code</th>
  <th>Bookdate</th>
  <th>Checkout Date</th>
  <th>Rent</th>
  </tr>
  </thead>
  <tr>
  <td><%=current.getAttribute("bcomp").toString() %></td>
  <td><%=aroom%></td>
  <td><%=rs.getString("addr") %></td>
  <td><%=rs.getString("city") %></td>
  <td><%=rs.getString("state") %></td>
  <td><%=rs.getString("zip") %></td>
  <td><%=bdate%></td>
  <td><%=chdate%></td>
  <td><%=rent%></td>
  </tr>
  
  
  
  </table><br>
    <form action="servlet/BookHotel" method="post">
    Card no.<input type="text" pattern=".{16,16}" name="card" required title="Card no. must contain 16 digits" >
    <input type="submit" value="Pay and Book">
    
    </form>
    <%
    }
    
    else
    {%>
    session expired
    <%}
     %>
  </body>
</html>
