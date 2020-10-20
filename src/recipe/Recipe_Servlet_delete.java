package recipe;

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
		
		
		if(request.getParameter("delete")!=null) {
			ProcessDelete(request,response);
			request.getRequestDispatcher("recipe_workpage.jsp").forward(request, response);
		}else if(request.getParameter("ID")==null) {
			ProcessFind(request, response);	
			return;
		}if(request.getParameter("ID")!=null) {
			ProcessDelete(request,response);
		}
		RequestDispatcher rd=request.getRequestDispatcher("/recipe_update.jsp");
		rd.forward(request, response);
	}



	private void ProcessDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Recipe_DAO rDAO=new Recipe_DAO();
		Recipe_Obj rObj=new Recipe_Obj();
		System.out.println(request.getParameter("ID"));
		rObj.setRec_id(request.getParameter("ID"));
		if(rDAO.delete(rObj)){

	          System.out.println("Get some SQL commands done!");
	          request.getSession(true).invalidate();
	          
		}
		System.out.println("over");

	}
	

	//找出使用者擁有的食譜
	private void ProcessFind(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		Recipe_DAO rDAO=new Recipe_DAO();
		//	Map<String, Recipe_Obj> map=rDAO.MapOfJavaBean(null);	
		List<Recipe_Obj> list=rDAO.ListOfJavaBean();
		//將抓到的值存到 uesr_recipe的list中
		ArrayList<Recipe_Obj> user_recipe=new ArrayList<Recipe_Obj>();	
		//從list中抓到名為rec_id的資料
		for(Recipe_Obj a : list) {	
			//利用陣列存取抓到的rec_id並用split 切割
			String[] rec_id=a.getRec_id().split("\\-");
			for(int i=0;i<rec_id.length;i++) {
				if(rec_id[i].equals(request.getSession(true).getAttribute("memberID"))) {
					user_recipe.add(a);
				}
			}			
		}
		request.setAttribute("user_recipe", user_recipe);		
		RequestDispatcher rd=request.getRequestDispatcher("/recipe_delete.jsp");
		rd.forward(request, response);		

		}
}