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
.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 12px;
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
ResultSet update_proj = null;
PreparedStatement updateproj_ps=null;
String update_workc= request.getParameter("work_c");
try{ 
	
	//String dev_emailid = " ";
	connection = DriverManager.getConnection(connUrl,username,password);
	//PreparedStatement statement=connection.preparetatement();
	if (session != null) {
		if (session.getAttribute("emailId") != null) {
			String email = (String) session.getAttribute("emailId");
			//System.out.println(email);
			//"select * from userid WHERE id = '" + id + "' 
		      //AND pwd = '" + pwd + "'";
			String update_sql ="UPDATE PROJECT set PROJECT_WC = ? where DEV_EMAILID = ?";
			//Statement statement.setString(1, email);
			updateproj_ps= connection.prepareStatement(update_sql);
			//proj_ps= connection.prepareStatement(proj_sql);
			updateproj_ps.setString(1,update_workc);
			updateproj_ps.setString(2,email);
			int i=  updateproj_ps.executeUpdate();
			if(i > 0)
			{
				System.out.print("Record Updated Successfully");
				response.sendRedirect("developer_dashboard.jsp");
			}
			else
			{
				System.out.print("There is a problem in updating Record.");
			}
		}
	}

} catch (Exception e) {
	e.printStackTrace();
	}
			

%>


</body>
</html>
