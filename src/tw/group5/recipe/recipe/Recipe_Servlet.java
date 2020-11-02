package tw.group5.recipe.recipe;

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

import tw.group5.recipe.DAO.Recipe_DAO_hibernate;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.Recipe_Service;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.util.HibernateUtil;

@WebServlet("/Recipe_Servlet")
public class Recipe_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Recipe_Servlet() {
        super();
    }
    
	//因為資料庫沒有設定自動新增序列所有會有問題,我是使用自己輸入的值

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charser=UTF-8");
//		HttpSession session = request.getSession(true); 
//		session.setAttribute("memberID", "a21");
		
		if(request.getParameter("upload")!=null) {
			request.getRequestDispatcher("recipe/recipe_upload.jsp").forward(request, response);
		}
		if(request.getParameter("update")!=null) {
			Recipe_Servlet_update rsUpdate=new Recipe_Servlet_update();
			rsUpdate.doPost(request, response);	
			}
		if(request.getParameter("search")!=null) {
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
		doPost(request, response);

	}
	
	
	//---------新增資料-----------
	//

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
	
	//因為session的緣故 , 會無法傳送資料
//		response.sendRedirect("./recipe/recipe_display.jsp");
		
	}

	//---------新增資料確認頁面--------
	private void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session hibernatesession=factory.getCurrentSession();
		recipe_Service_interface Service=new Recipe_Service(hibernatesession);

		
		System.out.println("call insert DAO");
		Recipe_Bean recipe_detail=(Recipe_Bean)request.getSession(true).getAttribute("recipe_check");

		if(Service.insert(recipe_detail)){
	          System.out.println("Get some SQL commands done!");
	          request.getSession(true).invalidate();
	          
		}
		
		System.out.println("over");
		request.getRequestDispatcher("recipe/upload_success.jsp").forward(request, response);

	}


}