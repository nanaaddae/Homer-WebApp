<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="employee.Employee" %>
       
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.16.0/dist/umd/popper.min.js" integrity="sha384-yE9tb8hM5o5O5D5Z5FpwE8AWy5+e1RTgLRyh9c2f8j/Gn7F1Y/v/VZQW8fUcnV6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="styles.css">

<title>Administrator Home </title>

<script>

document.getElementById("generatePasswordBtn").addEventListener("click", function() {
	  // Generate a random password
	  var password = Math.random().toString(36).slice(-8);

	  // Set the value of the password input field to the generated password
	  document.getElementById("password").value = password;
	});
</script>

</head>

<div id = "adminDiv">


<body>

<%
  Employee user = (Employee) request.getAttribute("user");
%>

<h1> Welcome to the Administrator home !</h1>

<p>Welcome, <%= user.getFname() %>!</p>

<p> Please select an option </p>


<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#addUserModal">
  Add User
</button>

<br>
<br>

<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Delete Employee</button>
<br>
<br>
<form action="/logout" method="post" onsubmit="return confirm('Are you sure you want to log out?')">>
    <input type="submit" value="Logout">
</form>


</div>


<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/add-employee" method="post">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
          </div>
          <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter first name" required>
          </div>
          <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter last name" required>
          </div>
          <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" class="form-control" id="salary" name="salary" placeholder="Enter salary" required>
          </div>
          <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role">
              <option>Human Resources</option>
              <option>Admin</option>
              <option>Hero</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="phone_number">Phone Number</label>
            <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="Enter phone number" required>
          </div>
          <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" required>
          </div>
          
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            
             <button id="generatePasswordBtn" class="btn btn-secondary">Generate Password</button>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Delete Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/delete-employee" method="post">
          <div class="form-group">
            <label for="employeeId">Employee ID</label>
            <input type="text" class="form-control" id="employeeId" name="employeeId" placeholder="Enter employee ID">
          </div>
          <button type="submit" class="btn btn-danger">Delete</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>