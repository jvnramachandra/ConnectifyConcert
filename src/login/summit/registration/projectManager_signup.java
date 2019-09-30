package login.summit.registration;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.summit.registration.DAO;
import login.summit.registration.DAOImpl;
//import login.summit.registration.Developer;
import login.summit.registration.ProjectManager;

/**
 * Servlet implementation class projectmanager_signup
 */
@WebServlet("/projectManager_signup")
public class projectManager_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public projectManager_signup() {
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
		DAO mm = new DAOImpl();
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\\\S+$).{8,}";
		password.matches(pattern);
		String repeat_password=request.getParameter("psw-repeat");
		String jobpos=request.getParameter("jobpos");
		String exp=request.getParameter("exp");
		String projc=request.getParameter("proj");
		String dob=request.getParameter("dob");
		String gen=request.getParameter("gen");
		String submit_type = request.getParameter("submit");
		ProjectManager m = mm.getprojectManager(email, password);
		if(submit_type.equals("register") && password.equals(repeat_password)) {
			m.setUsername(uname);
			m.setEmail(email);
			m.setPassword(password);
			m.setJobpos(jobpos);
			m.setExp(exp);
			m.setProjc(projc);
			m.setDob(dob);
			m.setGen(gen);
			mm.insertprojectManager(m);
			request.setAttribute("succesMessage","Registered! Please login to continue");
			request.getRequestDispatcher("projectManager_login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message","Please enter correct info");
			request.getRequestDispatcher("projectManager_signup.jsp").forward(request, response);
		}
	}

}
