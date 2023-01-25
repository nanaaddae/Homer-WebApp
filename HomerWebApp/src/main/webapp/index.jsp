
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOMER</title>

  <link rel="stylesheet" type="text/css" href="styles.css">


</head>

<body>

<div id = "myDiv">
<h1>Homer Log in </h1>
	<form method="post" action="/login">
		Username: <input type="text" name="email"><br>
		
		<br> 
		
		Password: <input type="password" name="password"><br>
		
		<br> 
		
		<br> 
		
		<p> Please select your respective role please</p>
		<input type="radio" name="role" value="hr" checked> Human Resources<br>
		<input type="radio" name="role" value="admin"> Administrator<br>
		<input type="radio" name="role" value="hero"> Hero<br>
		<input type="submit" value="Login">
	</form>
	
</div>

<div class="footer">

<img src="/static/HOMER.png" alt="Logo">
    
</div>
</body>
</html>