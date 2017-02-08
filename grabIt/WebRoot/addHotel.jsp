<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addHotel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="login/css/logstyle.css">

  </head>
  
  <body>
    <%
		HttpSession current = request.getSession(false);
		if(current!=null)
		{ String fran=(String)current.getAttribute("info");    
     %>
     <div class="login-page">
  <div class="form">
    <form class="register-form" name="register" action="servlet/AddHotel" method="post" onsubmit="return validate()">
      <input type="text" name="username" placeholder="Company/Franchise Name " value='<%=fran %>' readonly="readonly" required="required"/>
      
     
     
      
      
     
      
      
      
      
      <input type="text" name="add" placeholder="Address" required="required"/>
      <input type="text" name="state" placeholder="State" required="required"/>
      <input type="text" name="city" placeholder="City" required="required"/>
      <input type="number" name="zip" placeholder="zip code" required="required"/>
      <input type="number" name="rooms" placeholder="No. of rooms"  required="required"/>
      <select name="ac" required="required">
      <option value="1">A.C.</option>
      <option value="0">Non A.C.</option>
      
      </select>
      <input type="number" name="rent" placeholder="Rent/Day"  required="required"/>
      <input type="reset">
      <input type="submit" value="create" id="submit" >
     
      <p class="message"><a href="FranchiseHomepage.jsp" onclick="ani()">Back</a></p>
    </form>
    
  </div>
</div>
     
     
     
     
     
     
     <%}
     else
     { %>Session Expired
     <%} %>
  </body>
</html>
