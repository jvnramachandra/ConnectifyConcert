<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Project Manager Dashboard</title>
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
  background-color: #71e2ef;
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
	background-color:#dd8627;
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
 
  	<a href="projectManager_addproj.jsp" class="btn btn-info" role="button" style="margin-top:15px">ADD PROJECT</a>
   
    <ul class="nav navbar-nav navbar-right">
   
      <form action="projectManager_logout" method="post">
      	<button type="submit" name="submit" value="login">Logout</button>
      </form>
    </ul>
    
  </div>
</nav>
<br><br><br><br>
<div class="main">
	<div id="profile" >
		<i><h2 style="margin-left:370px;">Project Manager Profile</h2></i>
    	
    	<div class="card" >
    	<%
			try{ 
			int dev_id = -1;
			//String dev_emailid = " ";
			connection = DriverManager.getConnection(connUrl,username,password);
			//PreparedStatement statement=connection.preparetatement();
			if (session != null) {
				if (session.getAttribute("emailId") != null) {
					String email = (String) session.getAttribute("emailId");
					
					//System.out.println(email);
					//"select * from userid WHERE id = '" + id + "' 
				      //AND pwd = '" + pwd + "'";
					String dev_sql ="SELECT * FROM PROJECTMANAGER where PROJ_EMAILID = ?";
					//String proj_sql = "SELECT * from PROJECT";
					//Statement statement.setString(1, email);
					dev_ps= connection.prepareStatement(dev_sql);
					//proj_ps= connection.prepareStatement(proj_sql);
					dev_ps.setString(1,email);
					resultSet_dev = dev_ps.executeQuery();
					while(resultSet_dev.next()){
						dev_id=resultSet_dev.getInt("PROJ_ID");
						System.out.println(dev_id);
						String male="Male";
						String female="female";
						//String deptid= rs.getString("deptid");
				
		%>
	
		 <div class="row">
		 	 <div class="col-sm-6">
		 	 	
		 	 	 <% if(resultSet_dev.getString("PROJ_GEN").equals(male)){ %>
					<img src='img_avatar1.png' alt='Avatar' style='width:50%'>
				<% } else { %>
					<img src='img_avatar2.png' alt='Avatar' style='width:50%'>
				<% } %> 
				
		 	 </div>
		 	 
    		<div class="col-sm-6">
    			<div class="container">
	    			<i><b>NAME : <%=resultSet_dev.getString("PROJ_NAME") %></b></i>
				    <br><br>
				    <i><b>DATE OF BIRTH : <%=resultSet_dev.getString("PROJ_DOB") %></b></i>
				    <br><br> 
				    <i><b>SEX : <%=resultSet_dev.getString("PROJ_GEN") %></b></i>
				   	<br><br>
				    <i><b>EMAIL ID : <%=resultSet_dev.getString("PROJ_EMAILID") %></b></i>
				    <br><br>
				    <i><b>JOB POSITION : <%=resultSet_dev.getString("PROJ_JOBPOS") %></b></i>
				    <br><br>
				    <i><b>EXPERIENCE : <%=resultSet_dev.getString("PROJ_EXP") %></b></i>
				    <br><br>
    			</div>
		 	</div>
		</div>
	</div>
		 <% } 
		 %>
		 <br><br><br>
	</div>
	 <hr style='height:2px;border:none;color:#333;background-color:#333;'>
	<br><br>
		<div id="projects">
		<% String proj_sql = "SELECT * from PROJECT where PROJ_EMAILID = ?"; 
			
			//System.out.println(email);
			proj_ps= connection.prepareStatement(proj_sql);
			proj_ps.setString(1,email);
			resultSet_proj = proj_ps.executeQuery();
				
		%>
		
				 <div class="panel panel-default">
				    <div class="panel-heading">Project Details</div>
					    <div class="panel-body">
					    <% resultSet_proj = proj_ps.executeQuery();
					    	int count=1;
							while(resultSet_proj.next()){
								email=resultSet_proj.getString("DEV_EMAILID");
						%>
						<div class="panel panel-default">
				    		<div class="panel-heading"><i>Project <%=count%></i></div>
					    		<div class="panel-body">
							
							    	<br>
							    	<i><b>PROJECT NAME : <%=resultSet_proj.getString("PROJECT_PNAME") %></b></i>
							    	<br>
							    	<i><b>PROJECT DESCRIPTION : <%=resultSet_proj.getString("PROJECT_PDES")%></b></i>
							    	<br>
							    	<i><b>PROJECT WORK TO BE COMPLETED : <%=resultSet_proj.getString("PROJECT_WD") %></b></i>
							    	<br>
							    	<i><b>PROJECT WORK COMPLETED : <%=resultSet_proj.getString("PROJECT_WC") %></b></i>
							    	<br>
							    	<i><b>PROJECT DEVELOPER EMAIL : <%=resultSet_proj.getString("DEV_EMAILID") %></b></i>
					    	
					    		</div>					    		
					    		<div class="panel-footer">
					    		<a href="delete_project.jsp?id=<%=resultSet_proj.getString("PROJECT_ID")%>">CLICK HERE TO DELETE</a>
					    		</div>
				  		</div>
				  		<% 
					count = count+1;
				}
				
			 }
			
			else {
					response.sendRedirect("projectManager_login.jsp");
				}
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
    
    
    
    </div>
   </div>
</div>
 <br><br>
</body>
</html>
