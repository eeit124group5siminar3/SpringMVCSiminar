package recipe.recipe;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import recipe.DAO.Recipe_DAO;
import recipe.DAO.Recipe_DAO_hibernate;
import recipe.recipe_bean.Recipe_Bean;
import recipe.recipe_bean.Recipe_Obj;
import util.HibernateUtil;

@WebServlet("/Recipe_Servlet_search")
public class Recipe_Servlet_search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Recipe_Servlet_search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		response.setContentType("text/html;charser=UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("search")!=null) {
			ProcessSearch(request, response);
		}
		
	}

	private void ProcessSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory=HibernateUtil.createSessionFactory();
		Session hibernatesession=factory.getCurrentSession();	
		Recipe_DAO_hibernate rDAO=new Recipe_DAO_hibernate(hibernatesession);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		List<Recipe_Bean> list=rDAO.ListOfSearch(request.getParameter("input"));
		
		for(Recipe_Bean r:list) {
			System.out.println(r.getDesc());
			System.out.println(r.getName());
		}

		
//		request.setAttribute("ListToken", list);
//		RequestDispatcher rd=request.getRequestDispatcher("/recipe_search_display.jsp");
//		rd.forward(request, response);
	}

}
