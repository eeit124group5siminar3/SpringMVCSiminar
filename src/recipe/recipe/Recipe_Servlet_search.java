package recipe.recipe;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.DAO.Recipe_DAO;
import recipe.recipe_bean.Recipe_Obj;

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
		Recipe_Obj rObj=new Recipe_Obj();
		rObj.setCate(request.getParameter("input"));		
		Recipe_DAO rDAO=new Recipe_DAO();
		List<Recipe_Obj> list=rDAO.ListOfsearch(rObj);
//		for(Recipe_Obj a : list) {
//			System.out.println(a.getName());
//		}
		
		request.setAttribute("ListToken", list);
		RequestDispatcher rd=request.getRequestDispatcher("/recipe_search_display.jsp");
		rd.forward(request, response);
	}

}
