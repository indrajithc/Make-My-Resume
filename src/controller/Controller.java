package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import operations.Index;

//import org.apache.catalina.servlet4preview.ServletContext;

import com.google.gson.Gson;

import details.User;
import includes.*;

@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String page = null;

		// authentication
		HttpSession authentication = request.getSession();
		User user = (User)  authentication.getAttribute("user");
		String type = "";

		if (user == null ) {
			System.out.print("goto login");
			String requestURL = request.getRequestURL().toString();
			String queryString = request.getQueryString();
			if (queryString != null) requestURL += "?" + queryString;
			
			response.sendRedirect(Connection.DIRECTORY +"/loginpage?referrer="+ requestURL );
			return;
		} else {
			type = user.getType();
			
		}
		
		

		switch (request.getParameter("page")) {
		

		case "Dashboard":
			page = "index.jsp";
			break;

		case "about":
			page = "about.jsp";
			break;

		case "logout":
			page = "logout.jsp";
			break;
			
		case "exit":
			page = "logout.jsp";
			break;

		case "quit":
			page = "logout.jsp";
			break;

		case "form":
			page = "form_sample.jsp";
			break;

		case "category":
			page = "department.jsp";
			break;

			
		case "employer":
			page = "employer.jsp";
			break;

			
			
			
			
			
			
			
			
//	=================================================================================================================		
			
		case "profile":
			page = "profile.jsp";
			break;
			

		case "department":
			page = "department.jsp";
			break;


		case "job-category":
			page = "job-category.jsp";
			break;			


		case "job":
			page = "job.jsp";
			break;		

		case "language-category":
			page = "language-category.jsp";
			break;			


		case "language":
			page = "language.jsp";
			break;			  

		case "skills":
			page = "skills.jsp";
			break;				  

		case "competencies":
			page = "competencies.jsp";
			break;	

		case "vacancies":
			page = "vacancies.jsp";
			break;			  

		case "education":
			page = "education.jsp";
			break;			  
			
 	
//
//			=================================================================================================================	
			
			
			
			
			
			
			
			
			

		case "basic":
			page = "basic.jsp";
			break;			  

		case "toadmin":
			page = "toadmin.jsp";
			break;			  

		case "resume":
			page = "resume.jsp";
			break;	

		case "resumes":
			page = "resumes.jsp";
			break;	

		case "newsletter":
			page = "newsletter.jsp";
			break;	
			
//		case "job":
//			page = "job.jsp";
//			break;			  
			
 	
//
//			=================================================================================================================			
			
				
				

		default:
			page = "index.jsp";
			break;
		}

		if (page != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/" + type + "/" + page);
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession authentication = request.getSession();

		try {

			ServletContext context = (ServletContext) request
					.getServletContext();
			details.Server SERVER = (details.Server) context
					.getAttribute("server");
			String referrer = request.getHeader("referer");

			if (authentication.getAttribute("user") == null
					|| authentication.getAttribute("user").equals("")) {
				boolean gotoLogin = true;

				if (request.getParameter("action").equals("login") 
						|| request.getParameter("action").equals("employer-register")
						|| request.getParameter("action").equals("employee-register")
						|| request.getParameter("action").equals("employer-login")
						|| request.getParameter("action").equals("employee-login")) { 
					if (!isNull(request.getParameter("useranme"))
							|| !isNull(request.getParameter("user_id"))
							|| !isNull(request.getParameter("email"))
							|| !isNull(request.getParameter("password"))) {
 
						map = Index.Function_Index(request, SERVER);
						
						gotoLogin = false;
					}
				}

				if (gotoLogin) {
					for (Entry<String, Object> entry : map.entrySet()) {
						entry.setValue(null);
					}
					String go_to_this = "" + SERVER.getServerProtocol() + "://"
							+ SERVER.getServerName() + ":"
							+ SERVER.getServerPort() + ""
							+ SERVER.getContextPath() + "/loginpage"; 
					map.put("success", -1);
					map.put("authentication", false);
					map.put("page", go_to_this);
					map.put("to", referrer);
				}

			} else {

				map = Index.Function_Index(request, SERVER);
			}

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));

		} catch (Exception e) {

			String go_to_this = "" + returnPath (request)  + "/loginpage"; 
			map.put("success", -1);
			map.put("authentication", false);
			map.put("page", go_to_this);
			map.put("to", request.getHeader("referer"));
			map.put("error", e.toString());
		}

	}

	private boolean isNull(String value) {
		if (value == null || value.equals("") || value.isEmpty())
			return true;
		else
			return false;
	}

	// private boolean isNull ( int value) {
	// if(value == 0 )
	// return true;
	// else
	// return false;
	// }
	
	
	
	
	
	
	//return path 
	public static String returnPath (HttpServletRequest request)  {
		
		String path = "http://localhost:8080/Project_X" ;
		try {

			path = request.getProtocol().replace("/1.1", "").toLowerCase() + "://" + request.getServerName() + ":"+ request.getLocalPort() + request.getContextPath() ;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return path;
	}

}
