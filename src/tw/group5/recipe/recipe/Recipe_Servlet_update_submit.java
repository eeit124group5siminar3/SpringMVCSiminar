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
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.Recipe_Service;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.util.HibernateUtil;

@WebServlet("/Recipe_Servlet_update_submit")
public class Recipe_Servlet_update_submit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Recipe_Servlet_update_submit() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("submit") != null) {
			gotoSubmitProcess(request, response);
//			request.getRequestDispatcher("recipe/recipe_workpage.jsp").forward(request, response);
//			response.sendRedirect("./recipe/recipe_display.jsp");
		}
	}
	
	
	// 送出修改
	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.createSessionFactory();
		Session hibernatesession = factory.getCurrentSession();
		recipe_Service_interface Service = new Recipe_Service(hibernatesession);
		
		
//		List<Recipe_Bean> recipe_update=new ArrayList<Recipe_Bean>();
//		if(rObj.getRec_id()!=null) {
		String name=request.getParameter("name").trim();
		String desc=request.getParameter("desc").trim();
		String cate=request.getParameter("cate").trim();
		String method=request.getParameter("method").trim();
		String ingerdients_A =request.getParameter("ingredients_A").trim();
		String ingerdients_B=request.getParameter("ingredients_B").trim();
		String ingerdients_C=request.getParameter("ingredients_C").trim();
		String ingerdients_D=request.getParameter("ingredients_D").trim();
		String rec_id=request.getParameter("rec_id").trim();
		System.out.println(request.getParameter("rec_id"));
		Recipe_Bean rObj = new Recipe_Bean(name,ingerdients_A,ingerdients_B,ingerdients_C,ingerdients_D,desc,cate,method);
		System.out.println(name);
				
		Service.update(rec_id,rObj);
		request.getRequestDispatcher("recipe/update_success.jsp").forward(request, response);

	}

}
