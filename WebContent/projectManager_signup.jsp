<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SignUp for Project Manager</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #dd8627;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}

</style>
<script>
	function validate(){
		var psw=document.getElementById("psw").value;
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
		if(!psw.match(pattern)){
			alert("Invalid Password");
			return false;
		}
		return true;
	}

</script>
</head>
<body>
<div class="conatiner-fluid">
<form action="projectManager_signup" method="post">

  <div class="container">
    <h1>Registration for Project Manager</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email"  required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw"  required onsubmit="return validate()">
        
    <label>Password must contain a digit, a lower case, an upper case, a special character, with no whitespace and a minimum of 8 characters</label>
    <br><br>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    
    <label for="jobpos"><b>Job position</b></label>
    <br>
    <select name="jobpos" style='width:500px;height:35px;'>
		<option>MANAGER</option>
		<option>EXECUTIVE MANAGER</option>
		<option>SENIOR MANAGER</option>
		<option>GENERAL MANAGER</option>
	</select>
    
    <br><br>
    <label for="exp"><b>Experience</b></label>
    <input type="text" placeholder="Enter Experience" name="exp" required>
    
    <label for="projc"><b>Project's Completed</b></label>
    <input type="text" placeholder="Enter Project's Completed" name="proj" required>
    
    <div class="form-group"> 
   <label class="control-label" for="date">Date</label>
    <input class="form-control" id="date" name="dob" placeholder="MM/DD/YYY" type="text" required/>
    </div>
   
    <label for="gen"><b>Gender</b></label>
    <input type="radio" name="gen" value="Male" />Male
     <input type="radio" name="gen" value="Female"/> Female</p></h4>
	<br>
    
   
   
   

    <button type="submit" name = "submit" value="register" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="projectManager_login.jsp">Sign in</a>.</p>
  </div>
</form>
 <script>
    $(document).ready(function(){
      var date_input=$('input[name="dob"]'); 
      var container=$('.container-fluid form-group').length>0 ? $('.container-fluid form-group').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
</script>

</div>




</body>
</html>
