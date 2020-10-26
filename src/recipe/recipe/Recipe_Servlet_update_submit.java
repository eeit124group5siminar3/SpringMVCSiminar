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
import recipe.recipe_bean.Recipe_Bean;
import util.HibernateUtil;

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
			System.out.println("gotoSubmitProcess成功");
//			request.getRequestDispatcher("recipe/recipe_workpage.jsp").forward(request, response);
//			response.sendRedirect("./recipe/recipe_display.jsp");
		}
		 response.sendRedirect("recipe/recipe_workpage.jsp");

	}
	
	
	// 送出修改
	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.createSessionFactory();
		Session hibernatesession = factory.getCurrentSession();
		Recipe_DAO_hibernate rDAO = new Recipe_DAO_hibernate(hibernatesession);
		
		System.out.println(1);
		
//		List<Recipe_Bean> recipe_update=new ArrayList<Recipe_Bean>();
//		if(rObj.getRec_id()!=null) {
		String name=request.getParameter("name");
		String desc=request.getParameter("desc");
		String cate=request.getParameter("cate");
		String method=request.getParameter("Method");
		String ingerdients_A =request.getParameter("ingredients_A");
		String ingerdients_B=request.getParameter("ingredients_B");
		String ingerdients_C=request.getParameter("ingredients_C");
		String ingerdients_D=request.getParameter("ingredients_D");
		String rec_id=request.getParameter("rec_id");
		System.out.println(request.getParameter("rec_id"));
		Recipe_Bean rObj = new Recipe_Bean(name,ingerdients_A,ingerdients_B,ingerdients_C,ingerdients_D,desc,cate,method);
		System.out.println(name);
				
		rDAO.update(rec_id,rObj);
		
		System.out.println(3);
	}

}
