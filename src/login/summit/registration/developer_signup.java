package login.summit.registration;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.summit.registration.Developer;
import login.summit.registration.DAO;
import login.summit.registration.DAOImpl;


/**
 * Servlet implementation class developer_signup
 */
@WebServlet("/developer_signup")
public class developer_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public developer_signup() {
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
		DAO dd = new DAOImpl();
		String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\\\S+$).{8,}";
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		password.matches(pattern);
		String jobpos=request.getParameter("jobpos");
		String exp=request.getParameter("exp");
		String projc=request.getParameter("proj");
		String dob=request.getParameter("dob");
		String gen=request.getParameter("gen");
		String repeat_password=request.getParameter("psw-repeat");
		String submit_type = request.getParameter("submit");
		Developer d = dd.getDeveloper(email, password);
		if(submit_type.equals("register") && password.equals(repeat_password)) {
			d.setUsername(uname);
			d.setEmail(email);
			d.setPassword(password);
			d.setJobpos(jobpos);
			d.setExp(exp);
			d.setProjc(projc);
			d.setDob(dob);
			d.setGen(gen);
			dd.insertDeveloper(d);
			request.setAttribute("succesMessage","Registered! Please login to continue");
			request.getRequestDispatcher("developer_login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message","Please enter correct info");
			request.getRequestDispatcher("developer_signup.jsp").forward(request, response);
		}
		
	}

}
