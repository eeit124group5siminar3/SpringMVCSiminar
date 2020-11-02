package tw.group5.marketSeller.model;

import java.io.IOException;
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

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.util.HibernateUtil;

/**
 * Servlet implementation class MarketHome
 */
@WebServlet("/marketSeller/MarketHome")
public class MarketHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		DataSource ds=null;
		InitialContext ctxt= null;
		Connection conn= null;
		System.out.println("接到");
		try {
			ctxt = new InitialContext();
			ds=(DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();
		System.out.println("456");
						
			if(request.getParameter("selectall") != null) {
				processSelectAll(request,response);
			}
			else if(request.getParameter("goinsert") != null) {
				response.sendRedirect("MarketI.jsp");
			}
			
			else if(request.getParameter("home") != null) {
				response.sendRedirect("top.jsp");
			}
			else if(request.getParameter("delect") != null) {				
				processDelet(request,response);
			}
			
			else if(request.getParameter("update") != null) {
				processUpdate(request,response);
			}else {
				processSelectAll(request,response);
			}	
		}catch(NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		}catch (SQLException e) {
		      System.out.println("Database Connection Error"); 
	    } finally {
	      try {
	    	  System.out.println(conn);
	    	  if (conn != null) conn.close();
	    	  
	      	} catch (Exception e) {
	        System.out.println("Connection Pool Error!");
	      	}
	      }	
	}



	private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        
        String selectid = request.getParameter("productid");
        int id = Integer.valueOf(selectid);
        
        MarketProductDao mDao = new MarketProductDao(session);
        List<MarketProductTotalBean> list = new ArrayList<MarketProductTotalBean>();
        list.add(mDao.select(id));
        
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/marketSeller/MarketU.jsp");
        dispatcher.forward(request, response);
        return;
       
	}



	private void processDelet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        String selectid = request.getParameter("productid");
        int id = Integer.valueOf(selectid);
        MarketProductDao mDao = new MarketProductDao(session);
        mDao.delete(id);
	    response.sendRedirect("MarketS.jsp");
		
	}

	private void processSelectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        
        MarketProductDao mDao = new MarketProductDao(session);
        List<MarketProductTotalBean> mBean =mDao.selectAll();
        request.setAttribute("listinsert", mBean);
		RequestDispatcher dispatcher =request.getRequestDispatcher("MarketHome.jsp");
		dispatcher.forward(request, response);
		   return;
	}
	
	
}