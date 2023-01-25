<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<%@ page import="employee.Employee" %>
                <%@ page import="documents.Documents" %>
                <%@page import="documents.DocumentsRepository"%>
                
                <%@ page import="employee.EmployeeRepository" %>
                
        <%@ page import="java.util.Set" %>
        
        <%@ page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="styles.css">
  
  

<style>

#hrDiv
{
	text-align: center; 
	
}

label {
  color: red;
}


</style>
<meta charset="ISO-8859-1">
<title>Human Resources Main Page</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>

<%
Set<Documents> documents = (Set<Documents>) request.getAttribute("documents");

  Employee user = (Employee) request.getAttribute("user");

  DocumentsRepository documentsRepository = (DocumentsRepository) request.getAttribute("documentsRepository");

  EmployeeRepository employeeRepository = (EmployeeRepository) request.getAttribute("employeeRepository");

%>


<div id = "hrDiv">

<h1> Welcome to the Human Resources home</h1>


<h2>Welcome, <%= user.getFname() %>!</h2>


<p> Please select an option </p>

<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#employeeModal">View Your Information</button>
<br>
<br>


<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#updateEmployeeModal">Update Employee</button>
<br>
<br>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#heroDocumentsModal">
    View All Documents
</button>


<a href="search.jsp" class="btn btn-danger">Search for Employee</a>

<form action="/logout" method="post">
    <input type="submit" value="Logout">
</form>

</div>

<div class="modal fade" id="updateEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="updateEmployeeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateEmployeeModalLabel">Update Employee Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <div class="modal-body">
    <form action="/updateEmployee" method="post">
    <div class="form-group">
    <label for="employeeID">Employee ID (This is Required !)</label>
    <input type="text" class="form-control" id="employeeID" name="employeeID" required>
</div>
      <div class="form-group">
        <label for="fname">First Name</label>
        <input type="text" class="form-control" id="fname" name="fname" >
      </div>
      <div class="form-group">
        <label for="lname">Last Name</label>
        <input type="text" class="form-control" id="lname" name="lname" >
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" >
      </div>
      <div class="form-group">
        <label for="salary">Salary</label>
        <input type="text" class="form-control" id="salary" name="salary" >
      </div>
      <div class="form-group">
        <label for="role">Role</label>
        <input type="text" class="form-control" id="role" name="role" >
      </div>
      <input type="submit" value="Update Employee">
    </form>
  </div>

    </div>
  </div>
</div>

<div class="modal fade" id="heroDocumentsModal" tabindex="-1" role="dialog" aria-labelledby="heroDocumentsModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="heroDocumentsModalLabel">Hero Documents</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">Employee</th>
              <th scope="col">Document Name</th>
              <th scope="col">Document Type</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <%
            List<Employee> heroes = employeeRepository.findByRole("Hero");
            for (Employee hero : heroes) {
              Set<Documents> heroDocuments = documentsRepository.findByEmployee(hero);
              for (Documents document : heroDocuments) {
            %>
            <tr>
              <td><%= hero.getFname() + " " + hero.getLname() %></td>
              <td><%= document.getDocName() %></td>
              <td><%= document.getDocType() %></td>
              <td><%= document.getStatus() %></td>
            </tr>
            <%
                }
              }
            %>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="employeeModal" tabindex="-1" role="dialog" aria-labelledby="employeeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 >Employee Information</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
          <tbody>
            <tr>
              <th scope="row">First Name:</th>
              <td><%= user.getFname()%></td>
            </tr>
            <tr>
            <tr>
              <th scope="row">Last Name:</th>
              <td><%= user.getLname()%></td>
            </tr>
            
            <tr>
              <th scope="row">Role:</th>
              <td><%= user.getRole()%></td>
            </tr>
            <tr>
            <tr>
              <th scope="row">Email:</th>
              <td><%= user.getEmail() %></td>
            </tr>
            <tr>
              <th scope="row">Phone:</th>
              <td><%= user.getPhone_number() %></td>
            </tr>
            <tr>
              <th scope="row">Address:</th>
              <td><%= user.getAddress() %></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="employeeSearchModal" tabindex="-1" role="dialog" aria-labelledby="employeeSearchModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="employeeSearchModalLabel">Search for Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="/employee/search" method="post">
          <div class="form-group">
            <label for="employeeId">Employee ID</label>
            <input type="text" class="form-control" id="employeeId" name="employeeId"/>
          </div>
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" />
          </div>
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName"/>
          </div>
          <button type="submit" class="btn btn-primary">Search</button>
        </form>

      </div>
    </div>
  </div>
</div>


<!-- Shows the information of the employee if found -->

 <div class="modal fade" id="employeeInfoModal" tabindex="-1" role="dialog" aria-labelledby="employeeInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="employeeInfoModalLabel">Employee Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
          <tbody>
            <tr>
              <th>ID</th>
              <td id="employeeId"></td>
            </tr>
            <tr>
              <th>First Name</th>
              <td id="firstName"></td>
            </tr>
            <tr>
              <th>Last Name</th>
              <td id="lastName"></td>
            </tr>
            <tr>
              <th>Phone Number</th>
              <td id="phoneNumber"></td>
            </tr>
            <tr>
              <th>Email</th>
              <td id="email"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

</body>
</html>