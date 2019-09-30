<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Developer Login</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
	
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color:#71e2ef;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 20%;
	border-radius: 25%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	<h2>Login for Developers</h2>
	
	
	<form method="post" action="developer_login">
		<div class="imgcontainer">
			<img src="C:\Users\jvnra\eclipse-workspace\ConnectifyConcer\WebContent\img_avatar1.png" alt="Avatar" class="avatar">
		</div>
		<!--  <p><h1 style="color:red">$(message)</h1>
		<p><h1 style="color:green">$(successMessage)</h1>-->
		<div class="container">
			<label for="email"><b>Email</b></label>
    		<input type="text" placeholder="Enter Email" name="email" required>
			<label for="psw"><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="psw" required>

			<button type="submit" name="submit" value="login">Login</button>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<a type="button" href="developer_signup.jsp"  class="cancelbtn">Register</a>
		</div>
		
	</form>
	
	

</body>
</html>
