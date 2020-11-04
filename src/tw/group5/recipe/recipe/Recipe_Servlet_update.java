package tw.group5.recipe.recipe;

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
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.recipe.DAO.Recipe_DAO_hibernate;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.Recipe_Service;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.util.HibernateUtil;

@WebServlet("/Recipe_Servlet_update")
public class Recipe_Servlet_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Recipe_Servlet_update() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		
		session.setAttribute("memberID", "a001");
		
		 if (request.getParameter("name") == null) {
			ProcessFind(request, response);
			return;
		}

		 else if (request.getParameter("name") != null) {

			ProcessUpdateDAO(request, response);
//				System.out.println("---------------------------");
//				System.out.println(request.getParameter("name"));		
		}
	}



	// 查詢食譜的table
	private void ProcessUpdateDAO(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.createSessionFactory();
		Session hibernatesession = factory.getCurrentSession();
		recipe_Service_interface Service = new Recipe_Service(hibernatesession);
		Recipe_Bean rObj = new Recipe_Bean();
		List<Recipe_Bean> recipe_table = new ArrayList<Recipe_Bean>();

		// 取出超連結的值
		String test = request.getParameter("name");
		String test2 = test.replaceAll("'", "");
		rObj.setRec_id(test2);
		System.out.println(rObj.getRec_id() + " =REC_ID");
		System.out.println(test2);

		//查詢使用者所擁有的食譜中,其中一筆資料
		List<Recipe_Bean> list = Service.partSearch(test2);
		for (Recipe_Bean r : list) {
				System.out.println("Name"+r.getName());
				recipe_table.add(r);
		}
		request.setAttribute("recipe_table", recipe_table);
		request.getRequestDispatcher("recipe/recipe_update.jsp").forward(request, response);


	}

	// 找出使用者擁有的食譜
	private void ProcessFind(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		SessionFactory factory = HibernateUtil.createSessionFactory();
		Session hibernatesession = factory.getCurrentSession();
		recipe_Service_interface Service = new Recipe_Service(hibernatesession);
		List<Recipe_Bean> list =Service.listOfJavaBean();
		
//		//將抓到的值存到 uesr_recipe的list中
		ArrayList<Recipe_Bean> user_recipe = new ArrayList<Recipe_Bean>();
		// 從list中抓到名為rec_id的資料
		for (Recipe_Bean a : list) {
			// 利用陣列存取抓到的rec_id並用split 切割
			String[] rec_id = a.getRec_id().split("\\-");
			for (int i = 0; i < rec_id.length; i++) {
				if (rec_id[i].equals(request.getSession(true).getAttribute("memberID"))) {
//					System.out.println(a.getName());
					user_recipe.add(a);
				}
			}
		}
		// 測試是否有成功存取抓到的值
//		for(Recipe_Obj b:user_recipe) {
//			System.out.println("---------------");
//			System.out.println(b.getName());
//		}

		request.setAttribute("user_recipe", user_recipe);
		RequestDispatcher rd = request.getRequestDispatcher("recipe/recipe_update_choose.jsp");
		rd.forward(request, response);

	}

}
