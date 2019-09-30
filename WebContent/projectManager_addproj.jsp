<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SignUp for Developer</title>
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
  background-color: #71e2ef;
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
</head>
<body>
<%@page import="java.sql.*"%>
<%

Connection conn = null;
String username = "ADMIN";
String password = "5338";
//String driver = "com.mysql.c1.jdbc.Driver:
String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String dev_emailid,stake_emailid;


try {
Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
ResultSet resultSet_dev,resultSet_stake = null;
PreparedStatement dev_ps,stake_ps=null;
String dev_sql, stake_sql;
//String emailid = null;
try{ 
	connection = DriverManager.getConnection(connUrl,username,password);
	
			//String email = (String) session.getAttribute("emailId");
			//System.out.println(email);
	
	dev_sql ="SELECT * FROM DEVELOPER";
	stake_sql ="SELECT * FROM STAKEHOLDER ";
	dev_ps= connection.prepareStatement(dev_sql);
	resultSet_dev = dev_ps.executeQuery();
	stake_ps= connection.prepareStatement(stake_sql);
	resultSet_stake = stake_ps.executeQuery();

	

			
%>
<div class="conatiner-fluid">
<form action="projectManager_addproj" method="post">

  <div class="container">
    <h1>Add Project</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <label for="pname"><b>Project Name</b></label>
    <input type="text" placeholder="Enter Project Name" name="pname" required>

    <label for="pdes"><b>Project Description</b></label>
    <input type="text" placeholder="Enter Project Description" name="pdes" required>
    
    <label for="pw"><b>Project Work to be done</b></label>
    <input type="text" placeholder="Enter Project details" name="pw" required>
    
     <label for="p_man"><b>Project Manager</b></label>
    <input type="text" value=<%=session.getAttribute("emailId")%> name="p_man" required>
    
    <!--   <label for="p_dev"><b>Project Developer</b></label>
    <input type="text" placeholder="Enter Project Developer details" name="p_dev" required>
    
   <label for="p_stake"><b>Project Stake Holder</b></label>
    <input type="text" placeholder="Enter Project Stake Holder details" name="p_stake" required>-->
    <label for="p_dev"><b>Project Developer</b></label>
     <select name="p_dev" style='width:500px;height:35px;'>
   <%
		while(resultSet_dev.next()){ %>
			<option value="<%=resultSet_dev.getString("DEV_EMAILID")%>"><%=resultSet_dev.getString("DEV_EMAILID")%></option>
		<% } %>
		</select>
	<br><br>
	<label for="p_stake"><b>Project Stake Holder</b></label>
	 <select name="p_stake" style='width:500px;height:35px;'>
		<%
		while(resultSet_stake.next()){ %>
			<option value="<%=resultSet_stake.getString("STAKE_EMAILID")%>">
			<%=resultSet_stake.getString("STAKE_EMAILID")%>
			</option>
		<% } %>
	</select>
	<%  
		}
catch (Exception e) {
	e.printStackTrace();
}%>
	
	<br><br>
    
    <br><br>
    <button type="submit" name = "submit" value="register" class="registerbtn">Add</button>
  </div>
</div>
</body>
</html>
