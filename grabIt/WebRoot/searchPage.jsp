<%@page import="temp.MyDate"%>

<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="appGrab.Useful" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="welcome/assets/css/main.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script >
		function book(r) 
		{
			
				
		}
	
	</script>
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
				
					<section class="main items">
				
						<article class="item">
							<header>
								<a href="searchPage.jsp"><img src="welcome/images/pic01.jpg" alt="" /></a>
								<h3>Search hotels by city</h3>
							</header>
							<form class="form" action="servlet/GetSResut">
							<input type="text" required="required" name="city" placeholder="Enter City" onblur="showName(this.value)">
							<select name="ac">
							<option value="1">A.C.</option>
							<option value="0">Non A.C.</option>
							</select><br>
							<input class="button" type="submit" value="Search">
							</form>
						</article>
						<!--  <article class="item">
							<header>
								<a href="login.jsp?user=hotelmanager"><img src="welcome/images/pic02.jpg" alt="" /></a>
								<h3>Get your Hotel Registered with us!</h3>
							</header>
							<p>Get Your Hotel Registered with Us!</p>
							<ul class="actions">
								<li><a href="login.jsp?user=hotelmanager" class="button">Register your Hotel</a></li>
							</ul>
						</article>-->
						
					</section>
					
					<section  id="result" class="main items">
						<%if(current.getAttribute("sResult")!=null)
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
						</section>
						
					
						
					

				<!-- Main -->
				<!--
					<section id="main" class="main">
						<header>
							<h2>Lorem ipsum dolor</h2>
						</header>
						<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
					</section>
				-->

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.</p>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="welcome/assets/js/jquery.min.js"></script>
			<script src="welcome/assets/js/skel.min.js"></script>
			<script src="welcome/assets/js/util.js"></script>
			<script src="welcome/assets/js/main.js"></script>
			<%}
			else
			{
			%>
			session expired
			<%
			}%>

	</body>
</html>
