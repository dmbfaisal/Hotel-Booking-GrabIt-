<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Registeration.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="login/css/logstyle.css">
	<script type="text/javascript">
	function validate()
	{
	
	var p=document.register.pass.value;
	var r=document.register.repass.value;
	if(p==r)
	{
		return true;
	}
	else
	{
		alert("passwords do not match!")
		return false;
	}
	}
	
	function checkPass()
{
    
    var pass1 = document.getElementById('pass');
    var pass2 = document.getElementById('repass');
    
    var message = document.getElementById('confirmMessage');
    
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    
    if(pass1.value == pass2.value){
     
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }
    else
    {
        
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  


	
	</script>
	

  </head>
  
  <body>
    <%String u= request.getParameter("user"); %>
  	
  	<%if(u.equals("customer"))
  	{ %>
    <div class="login-page">
  <div class="form">
    <form class="register-form" name="register" action="servlet/CreateAccount" method="post" onsubmit="return validate()">
      <input type="text" name="username" placeholder="name" required="required"/>
      
      <% try{if(request.getAttribute("uvalid").equals("invalid"))
      {%>
      <span id="euser" style="color: red" class="euser">Username Already Taken!</span>
     <% }}
     catch(NullPointerException e)
     {}%>
      <input type="password" name="pass" placeholder="password" required="required"/>
      <input type="password" name="repass" placeholder="reenter password" required="required" onkeyup="checkPass()"/>
      <span id="confirmMessage" class="confirmMessage"></span>
      <input type="text" name="name" placeholder="Name" required="required"/>
      <select name="gender" required="required">
      <option>Gender</option>
      <option>Male</option>
      <option>Female</option>
      </select>
    <label>Date of Birth<input type="date" name="dob" placeholder="Date Of Birth" required="required"></label> 
      <input type="text" name="add" placeholder="Address" required="required"/>
      <input type="email" name="email" placeholder="Email-Address" required="required"/>
      
      <input type="text" name="mob" maxlength="10" placeholder="+91-MobileNo." required="required"/>
      <input type="text" name="state" placeholder="State" required="required"/>
      <input type="text" name="city" placeholder="City" required="required"/>
      <input type="text" name="code" placeholder="Zip Code" required="required"/>
      <input type="reset">
      <input type="submit" value="create" id="submit" >
      <p class="message">Already registered? <a href="login?user=<%=u%>" onclick="ani()">Sign In</a></p>
      <p class="message"><a href="index.jsp" onclick="ani()">Back</a></p>
    </form>
    
  </div>
</div>
<%}
else
{
 %>
 <div class="login-page">
  <div class="form">
    <form class="register-form" name="register" action="servlet/CreateFAccount" method="post" onsubmit="return validate()">
      <input type="text" name="username" placeholder="Company/Franchise Name " required="required"/>
      
      <% try{if(request.getAttribute("uvalid").equals("invalid"))
      {%>
      <span id="euser" style="color: red" class="euser">Franchise/Company Already Registered!</span>
     <% }}
     catch(NullPointerException e)
     {}%>
      <input type="password" name="pass" placeholder="password" required="required"/>
      <input type="password" name="repass" placeholder="reenter password" required="required" onkeyup="checkPass()"/>
      <span id="confirmMessage" class="confirmMessage"></span>
      
      
     
      
      <input type="email" name="email" placeholder="Email-Address" required="required"/>
      
      <input type="text" name="mob" maxlength="10" placeholder="+91-MobileNo." required="required"/>
      
      <input type="reset">
      <input type="submit" value="create" id="submit" >
      <p class="message">Already registered? <a href="login?user=<%=u%>" onclick="ani()">Sign In</a></p>
      <p class="message"><a href="index.jsp" onclick="ani()">Back</a></p>
    </form>
    
  </div>
</div>
 
<%} %>
  </body>
</html>
