<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- ADMIN LOGIN PAGE -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="www.domain2.com/script.js"></script> -->
<!-- <script src="crossdomain.js" ></script> -->
<script>
	var token = sessionStorage.getItem("token");
	if (typeof token === 'undefined' || token === null) {
    location.href="index.jsp";
}
</script>

<title>Get All Data- In Class 02</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />   
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script>
$.ajax({
    method: "POST",
    dataType: "json",
    headers: {
        "Authorization": token},
        url: "http://ec2-18-216-97-75.us-east-2.compute.amazonaws.com:3000/all_survey_data",
        success: 
        	function(data) {
           			getSurveyData(data);         	
        	},
        error:
        	function(data) {
            	window.alert("Getting all data failed. Please try again");
        		location.href = "newPatient.jsp";
            }
  });
  
function getSurveyData(data) {
    var table = $('#surveyDataTable').dataTable({
    	"bAutoWidth" : false,
        "aaData" : data,
        dom: 'Bfrtip',
     	buttons: [
         	'print'
     	],
     	"columnDefs": [
            {"className": "dt-center", "targets": "_all"}
          ],
        "columns" : [  {
        	data : "_id"
        }, {
        	data : "q1"
        }, {
        	data : "q2"
        }, {
        	data : "q3"
        }, {
        	data : "q4"
        }, {
        	data : "q5"
        }, {
        	data : "q6"
        }, {
        	data : "q7"
        }, {
        	data : "q8"
        }, {
        	data : "q9"
        }, {
        	data : "q10"
        }, {
        	data : "survey_id"
        }, {
        	data : "PatientID"
        }, {
        	data : "created_at"
        } ]
    })
}

$.ajax({
    method: "POST",
    dataType: "json",
    headers: {
        "Authorization": token},
        url: "http://ec2-18-216-97-75.us-east-2.compute.amazonaws.com:3000/all_patient_data",
        success: 
        	function(data) {
           			getPatientData(data);
        	},
        error:
        	function(data) {
            	window.alert("Getting all data failed. Please try again");
        		location.href = "newPatient.jsp";
            }
  });
  
  
function getPatientData(data) {
    var table = $('#allPatientsTable').dataTable({
    	"bAutoWidth" : false,
        "aaData" : data,
        dom: 'Bfrtip',
     	buttons: [
         	'print'
     	],
     	"columnDefs": [
            {"className": "dt-center", "targets": "_all"}
          ],
        "columns" : [  {
        	data : "patient_id"
        }, {
        	data : "patient_name"
        }, {
        	data : "age"
        }, {
        	data : "weight"
        }, {
        	data : "address"
        }, {
        	data : "username"
        }, {
        	data : "password"
        }, {
        	data : "phone"
        } ]
    })
}

function removeToken(){
	sessionStorage.removeItem('token');
}
</script>
</head>
<body>

<div class="jumbotron">
	<a href="index.jsp" class="btn btn-default" style="float:right" onClick="removeToken()">
  		<span class="glyphicon glyphicon-off"></span>
  		Logout
  	</a>
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
		<h1 class="centerAlign textBold">Survey Data</h1>
		<table id="surveyDataTable" class="display nowrap compact cell-border">
    <thead>
        <tr>
            <th>Id</th>
            <th>Question 1</th>
            <th>Question 2</th>
            <th>Question 3</th>
            <th>Question 4</th>
            <th>Question 5</th>
            <th>Question 6</th>
            <th>Question 7</th>
            <th>Question 8</th>
            <th>Question 9</th>
            <th>Question 10</th>
            <th>Survey Id</th>
            <th>Patient Id</th>
            <th>Created At</th>
        </tr>
    </thead>
</table>
</div>
	
<div class="container">
	<h1 class="centerAlign textBold">Patients' Data</h1>
	<table id="allPatientsTable" class="display nowrap cell-border">
    <thead>
        <tr>
            <th>Patient id</th>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Weight</th>
            <th>Address</th>
            <th>Username</th>
            <th>Password</th>
            <th>Contact Number</th>
        </tr>
    </thead>
</table>
</div>
	
</body>
</html>