<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Result.jsp' starting page</title>
    
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
  
  <%
  
  if(current.getAttribute("sResult")!=null)
						{ 
							
							String value=null;
							ResultSet rs=(ResultSet) current.getAttribute("sResult");
							String today=MyDate.currentDate();
							String cdate=MyDate.tomDate();
							%>
							<br><br><br>
							<hr>
							<h3>Search Results for Hotels</h3>
							<%
								if(current.getAttribute("RAvail")!=null)
								{%>
								<span style="color: red"> Sorry!! no Room available in the selected Hotel for the specified period!</span><br>
								<% 
								}%>
							
							 %>
							<form  action="servlet/BookRoom">
							<label>Booking Date<input type="date" min='<%=today %>' name="bdate" ></label><br>
							<label>Checkout Date<input type="date"  min='<%=cdate %>'  name="chdate" ></label><br>
							<table>
							<colgroup>
    						<col class="oce-first" />
    						</colgroup>
							<thead>
							<tr>
							<th>Select</th>
							<th>Franchise</th>
							<th>Address</th>
							<th>State</th>
							<th>City</th>
							<th>Zip Code</th>
							<th>A.C.</th>
							<th>Fare</th>
							<th>Book</th>
							</tr>
							</thead>
							<tbody>
							<%while(rs.next())
							{
								value=rs.getString("fname")+"#"+rs.getString("id");
								System.out.println(value);
							 %>
							 <tr>
							 
							 <td><label>select<input  type="radio" required="required" name="val"  onchange="" value='<%=value%>'></label> </td>
							 <td><%=rs.getString("fname") %></td>
							 <td><%=rs.getString("addr") %></td>
							 <td><%=rs.getString("state") %></td>
							 <td><%=rs.getString("city") %></td>
							 <td><%=rs.getString("zip") %></td>
							 <%if(rs.getString("ac").equals("1"))
							 { %>
							 <td>Yes</td>
							 <%}
							 else
							 {
							  %>
							  <td>No</td>
							  <%} %>
							<td><%=rs.getString("fare") %></td>
							
							
							</tr>
							
						<%}%>
						<tbody>
						</table><br>
						
						<input class="button" type="submit" value="Book" >
						</form>
						<%
						} %>
    This is my JSP page. <br>
  </body>
</html>
