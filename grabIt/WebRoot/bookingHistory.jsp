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
    
    <title>My JSP 'bookingHistory.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     
<% HttpSession current = request.getSession(false);
if(current!=null)
{
 String cust =(String)current.getAttribute("info");

 %>
		<!-- Header -->
			<header id="header" class="alt">
				<div class="inner">
					<h1>GrabIt</h1>
					<p><%=cust%> </p>
				</div>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Banner -->
					<section id="intro" class="main">
						<span class="icon fa-diamond major"></span>
						<h2><%=cust%></h2>
						<nav id="nav">
					<ul>
						<li ><a href="CustomerHomepage.jsp">Homepage</a></li>
						<li class="active"><a href="searchPage.jsp">Search & Book Hotels</a></li>
						<li><a href="right-sidebar.html">Booking History</a></li>
						<li><a href="servlet/Signout">Signout</a></li>
					</ul>
				</nav>
						
						<p>Book Hotel Rooms and manage your account and booking details!! 
						</p>
						
					</section>

				<!-- Items -->
				
					<section  id="result" class="main items">
					<%			ResultSet rs= (ResultSet)current.getAttribute("bHistory");				
								if(current.getAttribute("pay")!=null)
								{%>
								<span style="color: green;">Booking sucessfull !!</span><br>
								<% 
								}%>
					
								<table>
							<colgroup>
    						<col class="oce-first" />
    						</colgroup>
							<thead>
							<tr>
							<th>Booking ID</th>
							<th>Franchise</th>
							<th>Room no.</th>
							<th>Address</th>
							<th>City</th>
							<th>State</th>
							<th>Zip Code</th>
							<th>Card No.</th>
							<th>Rent</th>
							<th>Booking Date</th>
							<th>CheckOut Date</th>
							</tr>
							</thead>
							<tbody>
							<%while(rs.next())
							{
								
							 %>
							 <tr>
							 
							 
							 <td><%=rs.getString("bookingid") %></td>
							 <td><%=rs.getString("franchise") %></td>
							 <td><%=rs.getString("room") %></td>
							 <td><%=rs.getString("addr") %></td>
							 <td><%=rs.getString("city") %></td>
							 <td><%=rs.getString("state") %></td>
							 <td><%=rs.getString("zip") %></td>
							 <td><%=rs.getString("transaction")%></td>
							<td><%=rs.getString("fare") %></td>
							<td><%=rs.getString("bdate") %></td>
							<td><%=rs.getString("cdate") %></td>
							
							</tr>
							
						<%}%>
						<tbody>
						</table><br>
					
					
					
					
					</section>
					<%}
					else
					{
					 %>
					 session expired
					 <%} %>
				
  </body>
</html>
