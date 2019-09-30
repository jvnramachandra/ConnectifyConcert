package login.summit.registration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class projectManager_addproj
 */
@WebServlet("/projectManager_addproj")
public class projectManager_addproj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public projectManager_addproj() {
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
		// TODO Auto-generated method stub"
		String pname=request.getParameter("pname");
		String pdes=request.getParameter("pdes");
		String proj_data=request.getParameter("pw");
		String proj_dev=request.getParameter("p_dev");
		String proj_man=request.getParameter("p_man");
		String proj_stake=request.getParameter("p_stake");
		Connection conn = null;
		String username = "ADMIN";
		String password = "5338";
		//String driver = "com.mysql.c1.jdbc.Driver:
		String connUrl = "jdbc:oracle:thin:@localhost:1521:xe";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(connUrl,username,password);
			System.out.println(conn);
			PreparedStatement ps=conn.prepareStatement("INSERT into PROJECT(PROJECT_PNAME,PROJECT_PDES,PROJECT_WD,DEV_EMAILID,PROJ_EMAILID,STAKE_EMAILID) values (?,?,?,?,?,?)");  
			ps.setString(1, pname);
			ps.setString(2, pdes);
			ps.setString(3, proj_data);
			ps.setString(4, proj_dev);
			ps.setString(5, proj_man);
			ps.setString(6, proj_stake);
			
			
			
			int status = ps.executeUpdate();
			if(status > 0) {
				System.out.println("INSERTED");
				response.sendRedirect("projectManager_dashboard.jsp");
			}
			else {
				System.out.println(" NOT INSERTED");
				request.getRequestDispatcher("projectManager_addproj.jsp").forward(request, response);
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
