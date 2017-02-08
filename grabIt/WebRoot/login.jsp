<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="login/css/logstyle.css">
	<script type="text/javascript">
	function ani()
	{
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	}
	
	</script>
	

  </head>
  
  <body>
  <%String u= request.getParameter("user"); %>
  <%if(u.equals("customer"))
  	{ %>
    <div class="login-page">
  <div class="form">
   
    <form class="login-form" action="servlet/CheckCustomer" method="post">
      <input type="text" name="username" placeholder="username"/>
      <input type="password" name="pass" placeholder="password"/>
      <input type="submit" value="create" id="submit">
      <% if(request.getParameter("status")!=null)
      
      {System.out.println(request.getParameter("status")); %>
     <span style="margin: 15px 0 0; color:red;  font-size: 12px;">Invalid Username or password</span>
      <%} %>
      <p class="message">Not registered? <a href="Registeration.jsp?user=<%=u%>" onclick="ani()">Create an account</a></p>
      <p class="message"><a href="index.jsp" onclick="ani()">Back</a></p>
    </form>
  </div>
</div>
<%}
else
{ %>
<div class="login-page">
  <div class="form">
   
    <form class="login-form" action="servlet/CheckFranchise" method="post">
      <input type="text" name="username" placeholder="Franchise/Company Name"/>
      <input type="password" name="pass" placeholder="password"/>
      <input type="submit" value="create" id="submit">
      <% if(request.getParameter("status")!=null)
      
      {System.out.println(request.getParameter("status")); %>
     <span style="margin: 15px 0 0; color:red;  font-size: 12px;">Invalid Username or password</span>
      <%} %>
      <p class="message">Not registered? <a href="Registeration.jsp?user=<%=u%>" onclick="ani()">Create an account</a></p>
      <p class="message"><a href="index.jsp" onclick="ani()">Back</a></p>
    </form>
  </div>
</div>

<%} %>
  </body>
</html>
