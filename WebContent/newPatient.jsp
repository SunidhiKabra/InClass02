<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- ADMIN LOGIN PAGE -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="www.domain2.com/script.js"></script>
<script src="crossdomain.js" ></script>
<script>
	var token = sessionStorage.getItem("token");
	if (typeof token === 'undefined' || token === null) {
    window.alert("token not found");
    location.href="index.jsp";
}
</script>
<script>
function patientSignUp() {	
$.ajax({
        method: "POST",
        data: {
            patient_name: $('#patientName').val(),
            age:$('#patientAge').val(),
            weight:$('#patientWeight').val(),
            address:$('#patientAddress').val(),
            username:$('#patientUsername').val(),
            password:$('#patientPassword').val(),
            phone:$('#patientContact').val()},
            url: "http://ec2-18-216-97-75.us-east-2.compute.amazonaws.com:3000/register_patient",
           
            success: 
            	function(result) {
                	if(result.status==200){
               			window.alert(result.message);
               			location.href = "getData.jsp"
                	}
                	else{
                		window.alert(result.message);
                	}
            	},
            error:
            	function(result) {
                	window.alert("Sign Up failed. Please try again");
            		location.href = "newPatient.jsp";
                }
      });
}
</script>
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

<div class= container>
	<a href="newPatient.jsp">
		<button type="button" class="btn btn-primary btn-lg col-sm-5" style="padding:10px">Create New Patient</button>
	</a>
	<div class="col-sm-2"></div>
	<a href="getData.jsp">
		<button type="button" class="btn btn-primary btn-lg col-sm-5" style="padding:10px">Get All Data</button>
	</a>
</div>
<br>
<div class="container">
  <h2 class="margin20 centerAlign">New Patient Sign Up Form</h2>  
  <br>
  <form class="form-horizontal" action="controller" method="get" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientName">Name:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      	<input type="text" class="form-control" id="patientName" placeholder="Patient's Name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientAge">Age:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
      	<input type="number" class="form-control" id="patientAge" placeholder="Patient's Age" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="patientWeight">Weight:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
      	<input type="number" class="form-control" id="patientWeight" placeholder="Patient's Weight" required>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="patientAddress">Address:</label>
      <div class="col-sm-10 input-group">
      	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
      	<input type="text" class="form-control" id="patientAddress" placeholder="Patient's Address" required>
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
      <div class="col-sm-offset-6 col-sm-10">
        <button type="button" class="btn btn-default btn-success" onCLick="patientSignUp()">Submit</button>
      </div>
    </div>
  </form> 
</div>
</body>
</html>