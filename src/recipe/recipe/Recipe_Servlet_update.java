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

import recipe.DAO.Recipe_DAO;
import recipe.recipe_bean.Recipe_Obj;

/**
 * Servlet implementation class Recipe_Servlet_update
 */
@WebServlet("/Recipe_Servlet_update")
public class Recipe_Servlet_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Recipe_Servlet_update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		response.setContentType("text/html;charser=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true); 
		session.setAttribute("memberID","a001");
		if (request.getParameter("submit")!=null) {
			gotoSubmitProcess(request, response);
			request.getRequestDispatcher("recipe_workpage.jsp").forward(request, response);
		}
		else if(request.getParameter("name")==null) {
			ProcessFind(request, response);
			return;
		}
		
			if(request.getParameter("name")!=null) {

				
				ProcessUpdateDAO(request, response);
//				System.out.println("---------------------------");
//				System.out.println(request.getParameter("name"));		
			}
			RequestDispatcher rd=request.getRequestDispatcher("/recipe_update.jsp");
			rd.forward(request, response);

	}
	
	//送出修改
	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Recipe_DAO rDAO=new Recipe_DAO();
		Recipe_Obj rObj=new Recipe_Obj();		
//		if(rObj.getRec_id()!=null) {
			rObj.setName(request.getParameter("name"));
			rObj.setDesc(request.getParameter("desc"));
			rObj.setCate(request.getParameter("cate"));
			rObj.setMethod(request.getParameter("Method"));
			rObj.setIngredients_A(request.getParameter("ingredients_A"));
			rObj.setIngredients_B(request.getParameter("ingredients_B"));
			rObj.setIngredients_C(request.getParameter("ingredients_C"));
			rObj.setIngredients_D(request.getParameter("ingredients_D"));
			rObj.setRec_id(request.getParameter("rec_id"));
			System.out.println(request.getParameter("rec_id"));

			rDAO.update(rObj);
			//response.sendRedirect("recipe_workpage.jsp");
	}

	//查詢食譜的table
	private void ProcessUpdateDAO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Recipe_Obj rObj=new Recipe_Obj();
		Recipe_DAO rDAO=new Recipe_DAO();	
		
		//取出超連結的值
		String test=request.getParameter("name");
		String test2=test.replaceAll("'", "");
		rObj.setRec_id(test2);
		System.out.println(rObj.getRec_id()+" =REC_ID");
		
		ArrayList<Recipe_Obj> list=rDAO.partSearch(rObj);
		ArrayList<Recipe_Obj> recipe_table=new ArrayList<Recipe_Obj>();
		for(Recipe_Obj r:list) {
			recipe_table.add(r);
		}
//		for(Recipe_Obj o:recipe_table) {
//			System.out.println(o.getName());
//		}
		
		request.setAttribute("recipe_table", recipe_table);
		
		}
	


	//找出使用者擁有的食譜
	private void ProcessFind(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		Recipe_DAO rDAO=new Recipe_DAO();
//		Map<String, Recipe_Obj> map=rDAO.MapOfJavaBean(null);	
		List<Recipe_Obj> list=rDAO.ListOfJavaBean();
		//將抓到的值存到 uesr_recipe的list中
		ArrayList<Recipe_Obj> user_recipe=new ArrayList<Recipe_Obj>();	
		//從list中抓到名為rec_id的資料
		for(Recipe_Obj a : list) {	
		//利用陣列存取抓到的rec_id並用split 切割
			String[] rec_id=a.getRec_id().split("\\-");
			for(int i=0;i<rec_id.length;i++) {
				if(rec_id[i].equals(request.getSession(true).getAttribute("memberID"))) {
//					System.out.println(a.getName());
					user_recipe.add(a);
				}
			}			
		}
		//測試是否有成功存取抓到的值
//		for(Recipe_Obj b:user_recipe) {
//			System.out.println("---------------");
//			System.out.println(b.getName());
//		}
		
		request.setAttribute("user_recipe", user_recipe);		
		RequestDispatcher rd=request.getRequestDispatcher("/recipe_update_choose.jsp");
		rd.forward(request, response);		
	
	}
	
	}

