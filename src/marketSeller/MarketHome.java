package marketSeller;

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

import active.Active;
import active.ActiveDAO;

/**
 * Servlet implementation class MarketHome
 */
@WebServlet("/marketSeller/MarketHome")
public class MarketHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
			if(request.getParameter("goinsert") != null) {
				response.sendRedirect("MarketI.jsp");
			}
			
			if(request.getParameter("home") != null) {
				response.sendRedirect("top.jsp");
			}if(request.getParameter("delect") != null) {				
				processDelet(request,response);
			}
			if(request.getParameter("update") != null) {
				processUpdate(request,response);
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
		String selectid = request.getParameter("productid"); 
		MarketSellerDAO marketDAO = new MarketSellerDAO();
		List<MarketSellerBean> listmarketBeans = marketDAO.listMarketSellerBeans();
		System.out.println(listmarketBeans);
		List<MarketSellerBean> list = new ArrayList<MarketSellerBean>();
		for (MarketSellerBean act : listmarketBeans) {
			if(act.getProduct_id().equals(selectid)){
				marketDAO.selectId(selectid );
				list.add(act);
			}
			System.out.println(list);
		}
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("MarketU.jsp");
        dispatcher.forward(request, response);      
		return;
	}



	private void processDelet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MarketSellerDAO marketDAO = new MarketSellerDAO();
		List<MarketSellerBean> listmarketBeans = marketDAO.listMarketSellerBeans();
		String selectid = request.getParameter("productid");
		for (MarketSellerBean act : listmarketBeans) {
			if(act.getProduct_id().equals(selectid)){
				marketDAO.delete(selectid);
				response.sendRedirect("MarketS.jsp");
			}
		}
		
		return;
	}

	private void processSelectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           MarketSellerDAO marketDAO = new MarketSellerDAO();
           List<MarketSellerBean> listmarketBeans = marketDAO.listMarketSellerBeans();
           request.setAttribute("listinsert", listmarketBeans);
		   RequestDispatcher dispatcher =request.getRequestDispatcher("MarketHome.jsp");
		   dispatcher.forward(request, response);
		   return;
	}
	
	
}
