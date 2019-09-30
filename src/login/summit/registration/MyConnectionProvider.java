package login.summit.registration;


import java.sql.*;

public class MyConnectionProvider  {

	
	public static Connection getCon() {
	//public static void main(String[] args) throws ClassNotFoundException,SQLException{
		Connection conn = null;
		String username = "ADMIN";
		String password = "5338";
		//String driver = "com.mysql.c1.jdbc.Driver:
		String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		//conn = DriverManager.getConnection(connUrl,username,password);
	       
		try {
			 
			//Class.forName("com.mysql.cj.jdbc.driver");
			//conn = DriverManager.getConnection(connUrl,username,password);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","JVNRAMACHANDRA","5338");
			conn = DriverManager.getConnection(connUrl,username,password);
			System.out.println(conn);
			Statement stmt=conn.createStatement();  
			ResultSet rs=stmt.executeQuery("select * from developer"); 
			while(rs.next())  
				System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
			
		
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
		return conn;
		
		/*if(conn !=null) {
			System.out.println("Established");
		}
		else {
			System.out.println("NOT Established");
			
		}*/
	}
}

