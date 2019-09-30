package login.summit.registration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class developer_projectupdate
 */
@WebServlet("/developer_projectupdate")
public class developer_projectupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public developer_projectupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String proj_wc=request.getParameter("work_c");
		System.out.println(proj_wc);
		Connection conn = null;
		PreparedStatement stmt= null;
		ResultSet rst = null;
		String username = "ADMIN";
		String password = "5338";
		//String driver = "com.mysql.c1.jdbc.Driver:
		String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		//conn = DriverManager.getConnection(connUrl,username,password);
	       
		try {
			HttpSession session = request.getSession();
			if (session != null) {
				if (session.getAttribute("emailId") != null) {
			 
					//Class.forName("com.mysql.cj.jdbc.driver");
					//conn = DriverManager.getConnection(connUrl,username,password);
					Class.forName("oracle.jdbc.driver.OracleDriver");
					//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","JVNRAMACHANDRA","5338");
					conn = DriverManager.getConnection(connUrl,username,password);
					System.out.println(conn);
					String email = (String) session.getAttribute("emailId");
					System.out.println(email);
					 
					String pro_upd = "UPDATE PROJECT set PROJ_WC = '" + proj_wc +  "' WHERE DEV_EMAILID = '" + email + "' ";
					stmt=conn.prepareStatement(pro_upd);  
		                    
					int status = stmt.executeUpdate(); 
					if(status > 0)  {
						System.out.println("UPDATED");  
						//request.getRequestDispatcher("developer_project.jsp").forward(request, response);
					}
				}
			}
			
		
		}
			
		catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
	}

}
