<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Search</title>

  <link rel="stylesheet" type="text/css" href="styles.css">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	

<script>
    $(document).ready(function() {
        $("#submitBtn").click(function() {
            var employeeId = $("#employeeId").val();
            $.ajax({
                type: "GET",
                url: "/info",
                data: { employeeId: employeeId },
                dataType: "json",
                success: function(employee) 
                {
                    updateEmployeeTable(employee);
                },
                error: function() {
                    alert("Error retrieving employee information.");
                }
            });
        });
    });
    function updateEmployeeTable(employee) {
        $("#employeeTable tbody").empty();
        $("#employeeTable tbody").append(
            "<tr>" +
                "<td>" + employee.fname + "</td>" +
                "<td>" + employee.lname + "</td>" +
                "<td>" + employee.salary + "</td>" +
                "<td>" + employee.role + "</td>" +
                "<td>" + employee.address + "</td>" +
            "</tr>"
        );
    }
    
    function getEmployeeDocuments(id) {
        $.ajax({
            type: "GET",
            url: "/documents",
            data: { employeeId: employeeId },
            dataType: "json",
            success: function(data) 
            {
                updateDocumentTable(data);
                $("#documentTable").css("display", "table");

            },
            error: function() {
                alert("Error retrieving employee documents.");
            }
        });
    }
    

    function updateDocumentTable(documents) {
        $("#documentTable tbody").empty();
        for (var i = 0; i < documents.length; i++) {
            var document = documents[i];
            $("#documentTable tbody").append(
                "<tr>" +
                    "<td>" + document.name + "</td>" +
                    "<td>" + document.type + "</td>" +
                    "<td>" + document.status + "</td>" +
                "</tr>"
            );
        }
    }
    
</script>

</head>
<body>


<div>
    <label for="employeeId">Enter Employee ID:</label>
    <input type="number" id="employeeId" name="employeeId">
    <button type="button" class="btn btn-danger" id="submitBtn">Search</button>
    
<a href="hr_home.jsp" class="btn btn-danger">Go Back</a>
    
</div>


<table id="employeeTable" class="table table-danger">
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Salary</th>
            <th>Role</th>
            <th>Address</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>


<table id="documentTable" style="display:none;">
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>