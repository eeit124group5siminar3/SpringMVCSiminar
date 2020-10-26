package recipe.recipe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import recipe.DAO.Recipe_DAO_hibernate;
import recipe.recipe_bean.Recipe_Bean;
import util.HibernateUtil;

/**
 * Servlet implementation class Recipe_Servlet
 */
@WebServlet("/Recipe_Servlet")
public class Recipe_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static final int IMAGE_FILENAME_LENGTH = 20;
       
    public Recipe_Servlet() {
        super();
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charser=UTF-8");
		HttpSession session = request.getSession(true); 
		session.setAttribute("memberID", "a21");
		
		
		
		if(request.getParameter("upload")!=null) {
//			response.sendRedirect("recipe_upload.jsp");
			request.getRequestDispatcher("recipe/recipe_upload.jsp").forward(request, response);
		}
		if(request.getParameter("update")!=null) {
			Recipe_Servlet_update rsUpdate=new Recipe_Servlet_update();
			rsUpdate.doPost(request, response);	
			}
		if(request.getParameter("search")!=null) {
//			response.sendRedirect("recipe_search.jsp");
			request.getRequestDispatcher("recipe/recipe_search.jsp").forward(request, response);

		}
		if(request.getParameter("del")!=null) {
			Recipe_Servlet_delete rsDelete=new Recipe_Servlet_delete();
			rsDelete.doPost(request, response);	
		}
		
		
		//---------新增資料-----------
		if (request.getParameter("submit")!=null) {
			gotoSubmitProcess(request, response);
		}
		else if (request.getParameter("confirm")!=null) {		
			gotoConfirmProcess(request, response);
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);

	}
	
	
	//---------新增資料-----------

	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String name;
		String desc;
		String cate;
		String FileName;
		String ingredients_A;
		String ingredients_B;
		String ingredients_C;
		String ingredients_D;
		String rec_id;
		String method;
		String gram_A;
		
		System.out.println("set value");
		desc=request.getParameter("desc").trim();
		cate=request.getParameter("cate").trim();
		name=request.getParameter("recipe_name").trim();
		ingredients_A=request.getParameter("ingredients_A").trim();
		ingredients_B=request.getParameter("ingredients_B").trim();
		ingredients_C=request.getParameter("ingredients_C").trim();
		ingredients_D=request.getParameter("ingredients_D").trim();
		method=request.getParameter("method").trim();
		gram_A=request.getParameter("gram_A").trim();
		System.out.println(request.getParameter("recipe_name"));
		
		
		System.out.println("set values done");
		
		Recipe_Bean recipe_check=new Recipe_Bean(name,ingredients_A,ingredients_B,ingredients_C,ingredients_D,desc,cate,method);
		System.out.println(recipe_check.getName());
		request.getSession(true).setAttribute("recipe_check", recipe_check);
	request.getRequestDispatcher("recipe/recipe_display.jsp").forward(request, response);
//		response.sendRedirect("./recipe/recipe_display.jsp");
		
	}

	//---------新增資料確認頁面--------
	private void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session hibernatesession=factory.getCurrentSession();
		Recipe_DAO_hibernate rDAO=new Recipe_DAO_hibernate(hibernatesession);

		
		System.out.println("call insert DAO");
		Recipe_Bean recipe_detail=(Recipe_Bean)request.getSession(true).getAttribute("recipe_check");

		if(rDAO.insert(recipe_detail)){
	          System.out.println("Get some SQL commands done!");
	          request.getSession(true).invalidate();
	          
		}
		
		System.out.println("over");
		response.sendRedirect("recipe/recipe_workpage.jsp");

	}


}