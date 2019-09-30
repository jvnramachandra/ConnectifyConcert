package login.summit.registration;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class projectManager_login
 */
@WebServlet("/projectManager_login")
public class projectManager_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public projectManager_login() {
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
		DAO mm = new DAOImpl();
		//String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		//String repeat_password=request.getParameter("psw-repeat");
		String submit_type = request.getParameter("submit");
		ProjectManager m = mm.getprojectManager(email, password);
		if(submit_type.equals("login") && m!=null && m.getEmail()!=null) {
			request.setAttribute("message",m.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("emailId",email);
			session.setMaxInactiveInterval(30); 
			request.getRequestDispatcher("projectManager_dashboard.jsp").forward(request, response);
		
			
		}
		
		else {
			request.setAttribute("message","User Not found!! Please register");
			request.getRequestDispatcher("projectManager_login.jsp").forward(request, response);
		}
	}

}
