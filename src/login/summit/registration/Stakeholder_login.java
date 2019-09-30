package login.summit.registration;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Stakeholder_login
 */
@WebServlet("/Stakeholder_login")
public class Stakeholder_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stakeholder_login() {
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
		DAO ss = new DAOImpl();
		
		String email=request.getParameter("email");
		String password=request.getParameter("psw");

		String submit_type = request.getParameter("submit");
		StakeHolder s = ss.getstakeHolder(email, password);
		if(submit_type.equals("login") && s!=null && s.getEmail()!=null) {
			request.setAttribute("message",s.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("emailId",email);
			session.setMaxInactiveInterval(30); 
			request.getRequestDispatcher("stakeHolder_dashboard.jsp").forward(request, response);
			//response.sendRedirect("stakeHolder_dashboard.jsp");
			
		}
		
		else {
			request.setAttribute("message","User Not found!! Please register");
			request.getRequestDispatcher("stakeHolder_login.jsp").forward(request, response);
		}
	}		
}