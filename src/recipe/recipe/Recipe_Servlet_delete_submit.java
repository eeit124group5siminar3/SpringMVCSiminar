package recipe.recipe;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import recipe.DAO.Recipe_DAO_hibernate;
import util.HibernateUtil;

@WebServlet("/Recipe_Servlet_delete_submit")
public class Recipe_Servlet_delete_submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Recipe_Servlet_delete_submit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
//		if(request.getParameter("delete")!=null) {
//			if(request.getParameter("ID")!=null) {
//				ProcessDelete(request,response);
//				request.getRequestDispatcher("recipe/recipe_workpage.jsp").forward(request, response);
//			}
//		}
		
//		if(request.getParameter("delete")!=null&&request.getParameter("ID")!=null) {
			System.out.println("11111111111111111111");
		ProcessDelete(request,response);
			request.getRequestDispatcher("recipe/recipe_workpage.jsp").forward(request, response);
//		}
	}
		private void ProcessDelete(HttpServletRequest request, HttpServletResponse response) {
				SessionFactory factory=HibernateUtil.createSessionFactory();
				Session hibernatesession=factory.getCurrentSession();
				
				Recipe_DAO_hibernate rDAO=new Recipe_DAO_hibernate(hibernatesession);
				System.out.println(request.getParameter("ID"));
				String id=request.getParameter("ID").trim();
				rDAO.delete(id);
				System.out.println("id= "+id);
//				if(rDAO.delete(id)){
		//
//			          System.out.println("Get some SQL commands done!");
//			          request.getSession(true).invalidate();
//			          
//				}
				System.out.println("over");

		
}

	
	
	
}