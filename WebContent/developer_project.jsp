<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Developer Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 60%;
    height: 270px;
	margin-left:280px;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 80px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
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

</style>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
Connection conn = null;
String username = "ADMIN";
String password = "5338";
//String driver = "com.mysql.c1.jdbc.Driver:
String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";

try {
Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
ResultSet resultSet_dev,resultSet_proj = null;
PreparedStatement dev_ps,proj_ps=null;
%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
  
    <ul class="nav navbar-nav navbar-right">
      <form action="developer_logout" method="post">
      	<button type="submit" name="submit" value="login">Logout</button>
      </form>
    </ul>
  </div>
</nav>


<br><br><br><br>
<div class="main">
	<div id="profile" >
		<i><h2 style="margin-left:370px;">UPDATE STATUS OF WORK COMPLETED</h2></i>
		<form action="update_project.jsp" method="post" >
		<div class="panel panel-default">
				<div class="panel-heading"><i></i></div>
					    <div class="panel-body">
					    		<textarea width= 50cm placeholder="Enter Here!" name="work_c" required></textarea>
					    				</div>
					    		<div class="panel-footer">
					    		
				<input type="submit" value="submit">
					    		
				</div>
		</div>
	</form>
	</div>
 </div>
<br><br>
</body>
</html>
