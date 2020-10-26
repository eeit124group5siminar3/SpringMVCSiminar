package active.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ActiveHome
 */
@WebServlet("/ActiveHome")
public class ActiveHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		DataSource ds=null;
		InitialContext ctxt= null;
		Connection conn= null;
		try {
			ctxt = new InitialContext();
			ds=(DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();
			
						
			if(request.getParameter("apply") != null) {
				response.sendRedirect("ActiveApply.jsp");
			}
			if(request.getParameter("selectone") != null) {			
				processSelectOne(request,response);
			}
			if(request.getParameter("selectall") != null) {			
				processSelectAll(request,response);
			}	
			if(request.getParameter("delect") != null) {				
				processDelet(request,response);
			}
			if(request.getParameter("update") != null) {
				processUpdate(request,response);
			}
			if(request.getParameter("home") != null) {
				response.sendRedirect("top.jsp");
			}	
		}catch(NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		}catch (SQLException e) {
		      System.out.println("Database Connection Error"); 
	    } finally {
	      try {
	    	  if (conn != null) conn.close();
	      	} catch (Exception e) {
	        System.out.println("Connection Pool Error!");
	      	}
	      }	
	}
	//查詢單筆活動table===========================================================
	private void processSelectOne(HttpServletRequest request,
            HttpServletResponse response) throws SQLException, IOException, ServletException {	 
	
		ActiveDAO activeDAO = new ActiveDAO();
		List<Active> actives = activeDAO.listActive();
		String actName = request.getParameter("selectname");		
		
		List<Active> listactives = new ArrayList<Active>();	
		for (Active act : actives) {
			if(act.getAct_name().contains(actName)){
				activeDAO.findByName(actName);	
				listactives.add(act);
			}			
		}
		
		request.setAttribute("listactives", listactives);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ActiveHome.jsp");
        dispatcher.forward(request, response);
		return;
	}
	
	//查詢全部活動table===========================================================
		private void processSelectAll(HttpServletRequest request,
	            HttpServletResponse response) throws SQLException, IOException, ServletException {	 
			
			ActiveDAO activeDAO = new ActiveDAO();
			List<Active> listactives = activeDAO.getAll();
//			activeDAO.listActive();	
			activeDAO.getAll(); 
			request.setAttribute("listactives", listactives);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ActiveHome.jsp");
	        dispatcher.forward(request, response);
		}
	//刪除活動table===========================================================
		private void processDelet(HttpServletRequest request,
	            HttpServletResponse response) throws SQLException, IOException {	 

			ActiveDAO activeDAO = new ActiveDAO();			
			List<Active> actives = activeDAO.listActive();
			String selectid = request.getParameter("selectid");
			
			for (Active act : actives) {
				if(act.getAct_id().equals(selectid)){
					activeDAO.delete(selectid);
					response.sendRedirect("ActiveSucc.jsp");
				}
			}
			
			return;
	} 
		//Step.1修改活動table===========================================================
		private void processUpdate(HttpServletRequest request,
	            HttpServletResponse response) throws SQLException, IOException, ServletException {	 

			String selectid = request.getParameter("selectid");
			ActiveDAO activeDAO = new ActiveDAO();
			List<Active> actives = activeDAO.listActive();
			List<Active> list = new ArrayList<Active>();	
			for (Active act : actives) {
				if(act.getAct_id().equals(selectid)){
					activeDAO.findByPrimaryKey(selectid);
					list.add(act);
				}
			}
			request.setAttribute("list", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ActiveUpdate.jsp");
	        dispatcher.forward(request, response);      
			return;
		} 
}
