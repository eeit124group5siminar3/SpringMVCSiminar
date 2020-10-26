package recipe.recipe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.id.enhanced.HiLoOptimizer;

import recipe.DAO.Recipe_DAO;
import recipe.DAO.Recipe_DAO_hibernate;
import recipe.recipe_bean.Recipe_Bean;
import recipe.recipe_bean.Recipe_Obj;
import util.HibernateUtil;

/**
 * Servlet implementation class Recipe_Servlet_delete
 */
@WebServlet("/Recipe_Servlet_delete")
	public class Recipe_Servlet_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Recipe_Servlet_delete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charser=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true); 
		session.setAttribute("memberID","a001");	
		ProcessFind(request, response);	

	}
	

	//找出使用者擁有的食譜
	private void ProcessFind(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		SessionFactory factory=HibernateUtil.createSessionFactory();
		Session hibernatesession=factory.getCurrentSession();
		
		Recipe_DAO_hibernate rDAO=new Recipe_DAO_hibernate(hibernatesession);
//			Map<String, Recipe_Obj> map=rDAO.MapOfJavaBean(null);	
		List<Recipe_Bean> list=rDAO.listOfJavaBean();
//		將抓到的值存到 uesr_recipe的list中
		ArrayList<Recipe_Bean> user_recipe=new ArrayList<Recipe_Bean>();	
//		從list中抓到名為rec_id的資料
		for(Recipe_Bean a : list) {	
			//利用陣列存取抓到的rec_id並用split 切割
			String[] rec_id=a.getRec_id().split("\\-");
			for(int i=0;i<rec_id.length;i++) {
				if(rec_id[i].equals(request.getSession(true).getAttribute("memberID"))) {
					user_recipe.add(a);
				}
			}			
		}
		request.setAttribute("user_recipe", user_recipe);		
		RequestDispatcher rd=request.getRequestDispatcher("recipe/recipe_delete.jsp");
		rd.forward(request, response);		

		}
}