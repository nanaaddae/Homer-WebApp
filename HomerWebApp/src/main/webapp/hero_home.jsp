<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        <%@ page import="employee.Employee" %>
                <%@ page import="documents.Documents" %>
                <%@page import="documents.DocumentsRepository"%>
                 <%@page import="training.Training"%>
                  <%@page import="training.TrainingRepository"%>
                 
               
                
        <%@ page import="java.util.Set" %>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


   <link rel="stylesheet" type="text/css" href="styles.css">
 
 <script>
 document.getElementById("submit-button").addEventListener("click", function(){
	    var forms = document.getElementsByTagName("form");
	    var formData = new FormData();

	    for(var i = 0; i < forms.length; i++) {
	        var fileInput = forms[i].querySelector("input[type='file']");
	        var documentId = forms[i].querySelector("input[name='documentIds']").value;
	        formData.append(documentId, fileInput.files[0]);
	    }
	    
	    fetch("/upload", {
	        method: "POST",
	        body: formData
	    }).then(function(response) {
	        console.log(response);
	    });
	});
</script>
<meta charset="ISO-8859-1">
<title>Hero</title>
</head>

<body>

<div id = "heroDiv">
<%
Set<Documents> documents = (Set<Documents>) request.getAttribute("documents");

  Employee user = (Employee) request.getAttribute("user");
  
  Set<Training> trainings = (Set<Training>) request.getAttribute("trainings");

%>

<h1> Welcome to the hero home</h1>


<p>Welcome, <%= user.getFname() %>!</p>


<p> Please select an option </p>


<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#employeeModal">View Your Information</button>
<br>
<br>


<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#documentsModal">View Your Documents</button>
<br>

<br>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#trainingsModal">View Your Training</button>

<br>
<br>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#instructorsModal">View All Instructors</button>

<br>
<br>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#signupModal">Sign Up for Training</button>

<br>
<br>

<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#contactModal">
  View Contact Information
</button>
<br>
<br>
<br>

<br>
<br>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#uploadModal">
    Upload Important Documents
</button>

<br>
<br>

<a href="documents.jsp" class="btn btn-danger">Click here to download important documents</a>


<form action="/logout" method="post">
    <input type="submit" value="Logout">
</form>

</div>


 <div class="modal fade" id="documentsModal" tabindex="-1" role="dialog" aria-labelledby="documentsModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="documentsModalLabel">Documents</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<h3> Your Documents</h3>
      
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Document ID</th>
              <th scope="col">Document Name</th>
              <th scope="col">Document Type</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <!-- loop through the employee's documents and display them in the table -->
            <%
            
            
        

            for (Documents document : documents) {
                
            %>
            <tr>
              <th scope="row"></th>
                <td><%= document.getDocId() %></td>
              <td><%= document.getDocName() %></td>
              <td><%= document.getDocType() %></td>
              <td><%= document.getStatus() %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 
 <div class="modal fade" id="trainingsModal" tabindex="-1" role="dialog" aria-labelledby="trainingsModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="training">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="trainingsModalLabel">training</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<h3> Current Training </h3>
      
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Training ID</th>
              <th scope="col">Training Name</th>
              <th scope="col"> Description</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <!-- loop through the employee's training and display them in the table -->
            <%
        

            for (Training training : trainings) {
                
            %>
            <tr>
              <th scope="row"></th>
              <td><%= training.toString()%></td>
              
              <td><%= training.getTitle()%></td>
              <td><%= training.getDescription() %></td>
              <td><%= training.getStatus() %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="instructorsModal" tabindex="-1" role="dialog" aria-labelledby="instructorsModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<!--         <h5 class="modal-title" id="instructorsModalLabel">All Instructors</h5>
 -->        
 			<h3> All Instructors</h3>
 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Instructors</th>
            </tr>
          </thead>
          <tbody>
            <!-- loop through the unique instructors and display them in the table -->
            <%
            Set<String> uniqueInstructors = new HashSet<>();
            for (Training training : trainings) 
            {
            	
            	uniqueInstructors.add(training.getInstructor());

            }
            for (String instructor : uniqueInstructors) {
            	%>
            	<tr>
            	<td>
            	<%= instructor %>
            	</td>
            	</tr>
            	<% } %>
            	</tbody>
            	</table>
            	</div>
            	<div class="modal-footer">
            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            	</div>
            	</div>

            	  </div>
            	</div>
            	
            	
            	<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signupModalLabel">Sign Up for Training</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/add-training-to-employee" method="post">
          <div class="form-group">
           <label for="trainingSelect">Select Training:</label>
     
            <select class="form-control" id="trainingSelect">
              <% for (Training training : trainings) { %>
                <option value="<%= training.getId() %>"><%= training.getTitle() %></option>
              <% } %>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
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
        
  <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3>Contact Information</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li style = "color:red">Name: Nick Fury</li>
          <li style = "color:red">Phone: 555-555-5555</li>
          <li style = "color:red">Email: nickfury@gmail.com</li>
        </ul>
        <ul>
          <li style = "color:red">Name: John Smith</li>
          <li style = "color:red">Phone: 555-555-5556</li>
          <li style = "color:red">Email: johnsmith@example.com</li>
        </ul>
        <ul>
          <li style = "color:red">Name: Jacob Anderson</li>
          <li style = "color:red">Phone: 555-555-5557</li>
          <li style = "color:red">Email: jacobanderson@example.com</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  

<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="uploadModalLabel">Upload Documents</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <table>
                <thead>
                    <tr>
                        <th style = "color:red">Document Name</th>
                        <th style = "color:red">Status</th>
                        <th style = "color:red">Action</th>
                    </tr>
                </thead>
                <% for(Documents document : user.getDocuments()) {
                    if(document.getStatus().equals("PENDING")){ %>
                        <tr>
                            <td style = "color:red"><%= document.getDocName()%></td>
                            <td style = "color:red"><%= document.getStatus() %></td>
                            <td>
                                <form action="/upload" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="documentIds" value="<%= document.getDocId()%>">
                                    <input type="file" name="file" required>
                                </form>
                            </td>
                        </tr>
                    <% }
                } %>
            </table>
            <button id="submit-button">Submit</button>
        </div>
    </div>
</div>
</div>

</body>
</html>