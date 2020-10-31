package tw.group5.recipe.recipe;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.recipe.DAO.Recipe_DAO_hibernate;
import tw.group5.recipe.service.Recipe_Service;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.util.HibernateUtil;

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
		ProcessDelete(request,response);
	}
	
	
	//透過輸入的id進行刪除
	private void ProcessDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.createSessionFactory();
		Session hibernatesession = factory.getCurrentSession();

		recipe_Service_interface Service = new Recipe_Service(hibernatesession);
		System.out.println(request.getParameter("ID"));
		String id = request.getParameter("ID").trim();
//				Service.delete(id);
		System.out.println("id= " + id);
		if (Service.delete(id)) {

			System.out.println("Get some SQL commands done!");
			request.getSession(true).invalidate();

		}
		System.out.println("over");
		request.getRequestDispatcher("recipe/delete_success.jsp").forward(request, response);

	}

	
	
	
}