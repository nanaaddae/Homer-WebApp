<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

   <link rel="stylesheet" type="text/css" href="styles.css">

<meta charset="ISO-8859-1">
<title>Documents</title>
</head>
<body>



<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#downloadModal">Click here to see all crucial documents</button>
<br>
<br>


<div class="modal fade" id="downloadModal" tabindex="-1" role="dialog" aria-labelledby="downloadModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="downloadModalLabel">Download Important Documents</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <div class="modal-body">
        <button class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/downloads/confidentiality_agreement.pdf';" download="Confidentiality Agreement">Confidentiality Agreement</button>
        <button class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/downloads/direct_deposit_form.pdf';" download="Direct Deposit Form">Direct Deposit Form</button>
        <button class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/resources/non_disclosure_agreement.pdf';" download="Non Disclosure Agreement">Non Disclosure Agreement</button>
        <button class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/resources/training_agreement.pdf';" download="Training Agreement">Training Agreement</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>