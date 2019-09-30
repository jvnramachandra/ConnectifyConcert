<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
String id = request.getParameter("id");
//int v=Integer.parseInt(id);
//Connection conn = null;
String username = "ADMIN";
String password = "5338";
//String driver = "com.mysql.c1.jdbc.Driver:
String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = null;
PreparedStatement pst = null;
try{

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(connUrl,username,password);
    pst = conn.prepareStatement("DELETE from PROJECT where PROJECT_ID = ?");
    pst.setString(1,id);

    int status = pst.executeUpdate();
    if(status > 0){
    	response.sendRedirect("projectManager_dashboard.jsp");
    }
  }catch(Exception e){
    System.out.print(e.getMessage());
}
/* finally{
    pst.close();
    conn.close();
}*/
%>

    
    
    
  
