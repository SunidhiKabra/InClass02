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
function myFunction() { 
 	$.ajax({ 
         method: "POST", 
         data: { 
             username: $('#username').val(),
             password:$('#password').val() },
             url: "http://ec2-18-216-97-75.us-east-2.compute.amazonaws.com:3000/admin_login",
           
             success:  
             	function(result) { 
                 	if(result.status==200){ 
                			window.alert(result.message); 
                			sessionStorage.setItem("token", result.token);
                			location.href = "newPatient.jsp" 
                 	} 
                 	else{ 
                 		window.alert(result.message); 
                 	} 
             	}, 
             error: 
             	function(result) { 
                 	window.alert("Authentication failed. Admin not found."); 
             		location.href = "index.jsp"; 
                 } 
       }); 
 } 
</script> 

<title>Login- In Class 02</title>
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
  <h2 class="margin20">Administrator Login</h2>
  <form id="adminLoginForm" class="form-horizontal" method="post">
    <div class="form-group">
      	<label class="control-label col-sm-2" for="text">Username:</label>
      	<div class="col-sm-10 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        	<input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
      	</div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="password">Password:</label>
      <div class="col-sm-10 input-group"> 
      	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>         
        <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2">
        <button type="button" id="submit" onClick="myFunction()" class="btn btn-default btn-success">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>