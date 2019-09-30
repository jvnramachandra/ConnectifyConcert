package login.summit.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class stakeHolder_signup
 */
@WebServlet("/stakeHolder_signup")
public class stakeHolder_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stakeHolder_signup() {
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
		DAO ss = new DAOImpl();
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\\\S+$).{8,}";
		password.matches(pattern);
		String repeat_password=request.getParameter("psw-repeat");
		String cname=request.getParameter("cname");
		String submit_type = request.getParameter("submit");
		StakeHolder s = ss.getstakeHolder(email, password);
		if(submit_type.equals("register") && password.equals(repeat_password)) {
			s.setUsername(uname);
			s.setEmail(email);
			s.setPassword(password);
			s.setCname(cname);
			ss.insertstakeHolder(s);
			request.setAttribute("succesMessage","Registered! Please login to continue");
			request.getRequestDispatcher("stakeHolder_login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message","Please enter correct info");
			request.getRequestDispatcher("stakeHolder_signup.jsp").forward(request, response);
		}
	}

}
