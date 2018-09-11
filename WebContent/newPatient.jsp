<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- ADMIN LOGIN PAGE -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Patient- In Class 02</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="jumbotron">
  <div class="centerAlign textBold">
    <h1>In Class 02</h1>      
  </div>  
</div>

<div class="container">
  <h2 class="margin20 centerAlign col-sm-10">New Patient Sign Up Form</h2>  
  <form class="form-horizontal" action="#">
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientName">Name:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      	<input type="text" class="form-control" id="patientName" placeholder="Patient's Name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientUsername">Username:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      	<input type="text" class="form-control" id="patientUsername" placeholder="Patient's Username" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientPassword">Password:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      	<input type="text" class="form-control" id="patientPassword" placeholder="Patient's Password" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientContact">Contact Number:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
      	<input type="tel" pattern="^\d{3}-\d{3}-\d{4}$" class="form-control" id="patientContact" placeholder="Format(xxx-xxx-xxxx)" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientEmail">Email:</label>
      <div class="col-sm-10 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
        	<input type="email" class="form-control" id="patientEmail" placeholder="Patient's email" required>
      	</div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default btn-success">Submit</button>
      </div>
    </div>
  </form> 
</div>
</body>
</html>