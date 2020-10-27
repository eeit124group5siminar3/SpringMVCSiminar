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
import recipe.service.Recipe_Service;
import recipe.service.recipe_Service_interface;
import util.HibernateUtil;

@WebServlet("/Recipe_Servlet_search")
public class Recipe_Servlet_search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Recipe_Servlet_search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charser=UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("search")!=null) {
			ProcessSearch(request, response);
		}
		
	}

	//用戶或訪客查詢所有食譜
	private void ProcessSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory=HibernateUtil.createSessionFactory();
		Session hibernatesession=factory.getCurrentSession();	
		recipe_Service_interface Service=new Recipe_Service(hibernatesession);
		System.out.println(request.getParameter("input"));
		List<Recipe_Bean> list=Service.ListOfSearch(request.getParameter("input"));
		
		//test
//		for(Recipe_Bean r:list) {
//			System.out.println(r.getDesc());
//			System.out.println(r.getName());
//		}


		request.setAttribute("ListToken", list);
		RequestDispatcher rd=request.getRequestDispatcher("recipe/recipe_search_display.jsp");
		rd.forward(request, response);
	}

}
