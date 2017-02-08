<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
  </head>
  
  <body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="inner">
					<h1>GrabIt</h1>
					<p>The Best way to book your hotel online!! Hassle free!!</p>
				</div>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Banner -->
					<section id="intro" class="main">
						<span class="icon fa-diamond major"></span>
						<h2>GrabIt</h2>
						<p>In search of Hotel Rooms ?? Need Best Offers ??<br />
						You just happen to be at the right place !<br />
						grabIt is the best place to book rooms at your desired hotel at the best price!<br><br>
						Oh Wait, you have your own Hotel ? <br>
						 Register your Hotel at our place and watch it get filled with customers! 
						</p>
						
					</section>

				<!-- Items -->
					<section class="main items">
						<article class="item">
							<header>
								<a href="login.jsp?user=customer"><img src="welcome/images/pic01.jpg" alt="" /></a>
								<h3>Login/Register as a Customer</h3>
							</header>
							<p>Register/Login as a customer and book the rooms at your desired Hotel at best price!</p>
							<ul class="actions">
								<li><a href="login.jsp?user=customer" class="button">Login/Register</a></li>
							</ul>
						</article>
						<article class="item">
							<header>
								<a href="login.jsp?user=hotelmanager"><img src="welcome/images/pic02.jpg" alt="" /></a>
								<h3>Get your Hotel Registered with us!</h3>
							</header>
							<p>Get Your Hotel Registered with Us!</p>
							<ul class="actions">
								<li><a href="login.jsp?user=hotelmanager" class="button">Register your Hotel</a></li>
							</ul>
						</article>
						
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

	</body>
</html>
